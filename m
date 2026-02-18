Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB227E9A047
	for <igt-dev@archiver.kernel.org>; Wed, 18 Feb 2026 12:33:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD7410E2ED;
	Wed, 18 Feb 2026 12:33:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SzxxffRL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B730F10E127
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Feb 2026 12:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771418036; x=1802954036;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=G6ENwEHMdjbJkVAjJ0vYhJttv4VOUvrC1N+FfYYOd1s=;
 b=SzxxffRLp3f/lcxyrqXuBj24BgcYonzY/sdO+oIyIfQ3BxXGQ00wXSLw
 axCq8X/uzbPFatjQO7bxla40Qi2yZjhsR+ow6moGTxnjn1RgSmN+8mSaN
 EG73jLnnP8nlJzPnDK7iQg/zx0D2ZBodsgkc39YU9RPj0eE/5CQRKdYwq
 LQlwMEd9+sIYwD6ZpImobQJj/q0yldkze0iD64zpoqBZXOclyY1zezMus
 /ipDDAm6+KFZhCGXsWVywqO5sJNvf0wQZxjVKv5BQaBWvl7/UOr4ybfwI
 BrIG3q47eoHIp+pEXOYaJxLWMIuUQdhyZg2aM5li6f6dVfwhX9pb2Tth/ A==;
X-CSE-ConnectionGUID: 4mc0UJe5RAK1it08t58oBA==
X-CSE-MsgGUID: RbvFPgFhR4qGg8e3QY36IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="89904037"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="89904037"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 04:33:56 -0800
X-CSE-ConnectionGUID: lz5QzH+xTGuL3sdnCi6sng==
X-CSE-MsgGUID: ORNHLY/TRK+Nn/UCznzjvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="237179103"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 04:33:55 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 04:33:54 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 04:33:54 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.19)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 04:33:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBY09+BOR5XqAyEXRbYNok6+J4SIQpLPt5KibFLWEA5fHIctgoxMwiH7oMLCpaLMghNIV0pPhR2ZRbw96E86N/pKg6n1HhpGbXzubnsgFS2WARt2sq6s40WG7e0W3HMBLQGVVyrC1FNOlraFthBj3elzWK/gkmJTSweV3pWitZHaquoFWMXhtZWqAt4IMAtW/0AzxOFi43aBKy0i3NGLlZ8jjSs6ISeTZNhz3KIEAPSumky2MhNV5cEoZJZmnckdVgwAY0Y5hhF7h/3IzpvYKw80OLetZ77T9/5WYRAve7vI1mBUZW16BbVsJgyelXi7VPnxsnKY5DqM8BJcxylZrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZkfIjYrqYTglXu2J0T1Xt/BVlvDgGl/MLXgpI7d4ow=;
 b=P3OHLVE8tTR1M6tC/4YQ6aeqJ8GFfw2LiVPz+1K1IZKqz8832VRGiiQ4YqukE0X3u6QkpMXE1GGwFFBGIj2/Xf2R/JFhTWVWKgYD9JJJIVZjVccBq//8HrpzmUsrKp9NytBRRrl/tF7V7wzMFDOeoGzer20pw+KNUyElTM1Np5+imkySacSq1NFDM6YDFRWULEzfCYmMSSIsZnriyqwLwx0p3X0uY7rI9ksMhiWKBEQUyw3Fy2sr5tf+b+WYQTMY/1vYcJlJem+QambaPS5M3uLw/4nHAtQsNlAw2fQslD/8RnXcgkvSgE14ES8QyBxUtLWKuryrgGfY5p8v6Nz0ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CY5PR11MB6187.namprd11.prod.outlook.com (2603:10b6:930:25::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 12:33:52 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 12:33:52 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>, "Sebastian
 Brzezinka" <sebastian.brzezinka@intel.com>
Subject: [PATCH v2 i-g-t 1/4] tools/meson: make per-tool dependencies instead
 of using global deps
Date: Wed, 18 Feb 2026 13:33:56 +0100
Message-ID: <be671a8b919f9b13456bbf2cff8bd4c34553a62f.1771248283.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1771248283.git.sebastian.brzezinka@intel.com>
References: <cover.1771248283.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::11) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|CY5PR11MB6187:EE_
X-MS-Office365-Filtering-Correlation-Id: 24c55450-a87b-4a3b-6d9c-08de6ee9f953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0RzSk84VTJJTkZWSndBMldXTG5URExramVnaWZ2cGJ4RW5uY3lCdUlZUkoz?=
 =?utf-8?B?UUxDeXBiQmRJV0VrRUVhOHhNcHRyL045WmlLdWxCb05ybFZkWTBoNldsUmZK?=
 =?utf-8?B?WWdLUHZQSlEzMWFiUmFRU0FxMEtlYUxRUkgxWW9wTFhndGJzdHM0ZXFhOXlN?=
 =?utf-8?B?aEVodEZ4WXZzY2QrMUFDdERsVG9YTHZBNkZuRE4rcmNJaENhZFhlY1JiZDhs?=
 =?utf-8?B?WW9hclEwOEw1cytaRDloNWZETk9QMW9aNEdUK2M1bG1FYU5xSDduSGExUUM0?=
 =?utf-8?B?aWxibTViMVkraVIwNUxtRkxIaDlqQ2ZTcEdXSFNvUldvR1BieWUveEUrS1BJ?=
 =?utf-8?B?U0c1a0VFUG51ZlVJZHFQcWY2ZGlSYnlKbGtnRFpTQ0lvUTAxUFMxeDZpYmFS?=
 =?utf-8?B?dDFXUmo3d1VQNXpOL05vdWZkV0V6SG9tbVV1K0krMWdzQU1xOTdIQ1JFQTAz?=
 =?utf-8?B?NmtHeFRBMVJ6cFFTS3hNVUY0Smd0VjR4Z090RDdWbUhFdExMdFZUdVlLYnZX?=
 =?utf-8?B?aUpYQTlSNUExd1NJaE91ZW0vaHRNSi84bDB6WlptczZUNUFrd3FaVXJkNlFX?=
 =?utf-8?B?MEtjdE92cWQyb2toUzBKVHhYeGtnNW5lTHovZDdoNUVqVHdrdGJ6S1VkeUww?=
 =?utf-8?B?RjNzbGpiVUZyWGF1SzBuRzdBd0hLZmlER1hWVmpOSkFMV0djSjRDbWlJdnI0?=
 =?utf-8?B?TnpzT0dVQ3NWaDJVRWtPYUQxN1VWTGJ1aTNHQ2c1bE5hWHNESDRMbWFZWHVS?=
 =?utf-8?B?V1BkbmFaTEFIL1UvNTF1Vit3cXpiTWRrK0RaTUVLcWFseUZUYkw0UUN4RXdT?=
 =?utf-8?B?K2NuejlGckVBTlVhR2FwSHdjT3VIYmxhdmI3bmRDN2ExZU4weDZrcG9YOW5K?=
 =?utf-8?B?cFBCdVhaNlRPeXBBK3Y0cWk3OTczUnFyOHlnMG91c2pORmZEMEZwaDNHQmVx?=
 =?utf-8?B?bDFHT3RxSHlkMTl3Titkc2ZSclVod0NMdkN5dXVDZFA3UnhHQkxKbXYrcGxS?=
 =?utf-8?B?aDhQRFBHQnh6L21ZbDBYTE1MTmQyZ0RwMG5qTUFmTHc3NGpoaGcweElqVXE1?=
 =?utf-8?B?blZrVklXUXQySThKMy9yOVRvM3VpdVBRQ2VRTzJDeE5UVHFDVjdBd1QrbW1x?=
 =?utf-8?B?a1Bvcy9JdzFTNzFhU3N4elZCVDJ4NittNzRHeTduZ0U0ajBDZGFqN25WTTJG?=
 =?utf-8?B?YjdkaXkvemVucWFUcmxZeWoya2JvMHN0MVl0aEJZNTViSkhxdzhDM2FFay9p?=
 =?utf-8?B?akMvcE9iNTdkcUthekphaUdrZVZtbGtHakZpNFhZK3hXWlM2N2YxSndyMW5M?=
 =?utf-8?B?MWtLQ21JT2swNGtTSDlzLzluUVdHUGtjWkd1S1psWjhlTEZVNWhFZlYvaUdF?=
 =?utf-8?B?Z21tYVpVKzNWWHNvbFZCSFRZUXpRL1hkcHhQTU1FZUYxdFNFSGFFOVU5Y3c1?=
 =?utf-8?B?YUsydjhJV2Z3ZGJDaVZkUXJpY2pXdUNXZnFaQ1JkeUYwYnYyWEptY2h6T29Z?=
 =?utf-8?B?QWprdkJwbkpVRGR4K040U2FTZWxyb0hQYjlTUE1jZnFtaGZHNWQza0pYUHND?=
 =?utf-8?B?TTBGdFRiUjN3empzK1ZvTGVHMXNHVFBLYmh4bXZrUDYyZjFtMkc2UXJVVXMy?=
 =?utf-8?B?aWhNaW1GanpxVTFmMFRSUnkyM2kvZnc5bFhoSGFvcXhqbThScXVleFVTWDU4?=
 =?utf-8?B?M2RnemllMWRKVWhCMm91cDlVV2c2ZGdkcHk0UmFNS2V0M3paMnM5ZTVTTmJv?=
 =?utf-8?B?MmI3Z2lYcTRnUnVkVHpWSitrVTdIeVA2Z2V4NnR4QjRVbDhsRmJBcnJMNUpu?=
 =?utf-8?B?ZTdvaThPanJML3J2YXYrdk45eHU3M2tONzR4N3Z6UnVWNXVnWVBwUTlKeW9D?=
 =?utf-8?B?RTE5VmUyM2pxa0trSzhQZGY3emZidjhnT0l6ekVKcUJUcFp5VGdMTFE3RUFY?=
 =?utf-8?B?ZjZUVS9SSlRUVnJza2piWFQ0eHYyZnFYend5QitmNDM4cFcvcndjS0psdGR2?=
 =?utf-8?B?S3pkRTZXaDhyQXN1emp1M0grRGNVaVNkWE1XTk5IU3h6c1AxS3FWN0xBN2lL?=
 =?utf-8?B?SnZJOUk4S3V6dFk5cE1IdU9pK1ZVVE5sblRmbVdETXZydGZsM1gzTlVJQkhx?=
 =?utf-8?Q?hYUo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjV4WlFYZ1FCMUY3NExIcFp2dU9wMC9ic0dzbE03eEZLVW1jVW5jT01mKzZw?=
 =?utf-8?B?SmwvdW1GM0IxM1FaUVN0c0lXRnBkSVNMMzZieHAwTXJ1dkNaRFlDWmMvSEU1?=
 =?utf-8?B?QVNqcTdGNld5SzZzMEtVRW1sTk1ERUdob1RZc1FyWUorbEd2K1NDYitnSUZL?=
 =?utf-8?B?akMxOUp1bkdnT1o1aWdwbjVVVDVhQWN1dGozQ25BNUoxQTRabUdOamlLd0FK?=
 =?utf-8?B?RjY1cndxaTBJdEpvaWJDZHFVaUoyZkVjUWRVU2Rxd1hVaTZ4dHRLVUg2Y0wx?=
 =?utf-8?B?NUNWWVZKWEF0NDZOSkJlbEF0N21RKzdleCtDOU1hU0pXUU9jWndRR0Rxa093?=
 =?utf-8?B?ZVliWlZ4bjY5OVF2azlVM0srNXhWa3R5NEYwMXBhZ0tLZXpCbWFWekRFNEUv?=
 =?utf-8?B?SlNFS0JpdjFYcGxiOVE3NUt0bDVSVVltNlBJMHhrYXBXM3FoLzQydUM1RzFY?=
 =?utf-8?B?Uzk3OEgvbUtoa0o3YU9uL3dXL3pWV0ZuKzVMdWpMdmVBd3loRFJTSHR6LzNw?=
 =?utf-8?B?V0NGNGVxZEYzdGFyTEVLR01xaXdYTURxSTRvdGQ2SktsakNJT1VWZE5VV2ZG?=
 =?utf-8?B?OEt1UW9iblZzY3dvUkJ0eWxFMWhhOGM1TjhhQW96UUlETUdTU1FkeTNVNENl?=
 =?utf-8?B?VzVvMzJDSGNiQWpVeE9nUE1XbFhtWkNFRXNrQnFMMm5lWjZ1WHJTVExpQTJn?=
 =?utf-8?B?SnVWL3ZLdG5SVFF1TUJiZDdSbUNxam5WTVl1U0s5dHJFSXU5OERQQWQzZk05?=
 =?utf-8?B?SGhLVndIVGFJMklYaitwQnpHRnZWYXM4b2U0WnJtOXZCTzRrTEpJME81dU90?=
 =?utf-8?B?amNHYm5sSnVYbXp6aUdMR2pwN25XY2xhWnAreGpQNk5McUVQaElkUlNFdHJa?=
 =?utf-8?B?L1RLMUFNK2FjWTRuZGQ2T1N1RGxvejVvdkdLOXhXZWlVaHRRV1FZMEJKWmVE?=
 =?utf-8?B?Qk1LbWlxQW9tVmkrY1d5MkZ0Z0JwRE5lNStEU3BKY3lLSS9nbVBIcVR5YUtY?=
 =?utf-8?B?Y0twYUJaMXovL2E0OFRmdElQdFpHYzNPRlVZQWk3QjhJS01ZamlSUTdSMXZB?=
 =?utf-8?B?Z0liZTBHckc2ZFl0T0NjSm1scjkwTFcvZmtZVDRFUVR6MUZiaDJtVlY0bE1U?=
 =?utf-8?B?RDQwRGZ1R3dZQnkyRXdFYXBvZzdIQWRzdDBwOGhtRGVSL1FKSUpsZ1gxck04?=
 =?utf-8?B?Rmo4Sm9wYVUrMWsyaXF1d3lCVmRoWU9KY2RRRUVtR0JHeks0WUdlNHd6bUFW?=
 =?utf-8?B?TDkxSnlBUnhCbmJxYmpwdUY1eThrVkpXem15RGdtZ1ZWWm9hWFlrNTVJZ3Rs?=
 =?utf-8?B?cGV6RHVXd1FmZkgrV3lJQjQrWlBoQXFIakF3S2lvazgxckdubkxNcFZsWm83?=
 =?utf-8?B?Wnovc3IxQlBjUEhzUGtwZXFLdStKUGl1NW1qSC9EYjNnL0YxaVFwNVRTSHpq?=
 =?utf-8?B?dWlESVExa3VMWE5IbG9qcXVnWDh5bCtQUTA3bSszVzkzVEJMMllvS05KOXdx?=
 =?utf-8?B?R0ZYSkFVekFtRWdnRXVoWDZGbWh4V0xZOUhadng4Zjk2RlpSZVFrQkVrT3Jv?=
 =?utf-8?B?RkhBdS9RSmR2Mm1VMUR3SVduazhoY3B0MFVwYkYvY2l5RGR6ZGFkajh1VXZR?=
 =?utf-8?B?N0FJRjdBSUpqdkRHVmIyL1lza0djMkZJWkloNlFUekpibkZzbkpjTEwzZnp5?=
 =?utf-8?B?a3hvWktBTysvd3QxWS8rUy9ROS83dTVva3J3MlFHV0VscytOVTZTcW4zaWp5?=
 =?utf-8?B?Y1B0cXhGcDZKdmZ1TG9OTVQxVEE0TDB3TFkyc01nSnJuZ1VMb2Zlc2U4U29u?=
 =?utf-8?B?clJPdVRxQSs0Y0ZmWm5KZFUyWExja1hkZ2QvM0RTeGt1d3kwV0V1STRaV0Ft?=
 =?utf-8?B?TnFXdCtBMm5YTGRWL2xBWXF5MTZJK2pydWZRWDQ4ZmVLMXNaN1M0U2RML3E4?=
 =?utf-8?B?MktOckM1NE9kQlNXY3E5WFlYY29zS2N3STdhYWFpOC9FbmFoVXV6bHF1dmVM?=
 =?utf-8?B?a0ZhQUFiMUNnbENlUWxBdDFRQVFvTU8xT2NxdWZRRVljT2p0ODNRUVZnQ3p4?=
 =?utf-8?B?YWRoSTJSMFhnTmNSbnRSM0xCSkZoaFRnWGF1b2dvcWdFM2h1ZjhyUjZ2WkRS?=
 =?utf-8?B?d1V6akNBYXhPVUw4UlJSRktBdXo3RllzSDlodmw1SnkrOUd0S0ZRcnNjYXBt?=
 =?utf-8?B?eTRoUFVTd0FhV2Q0ZWJsM0FUV0kxZk5kbWwzN2x5M09PcVJBUzhVMjdBNzcx?=
 =?utf-8?B?VTFvSEl6eXdUbXV3L2wrZjhkdjU1VXBGU3BkRVpyaTJlUmJuYU5VT0tKNXEy?=
 =?utf-8?B?LzNVcGZ6YVdTYkx3SGdHRUVpWVIxdEkyRWtrMGV2OG10MXZqOGp4SFFJaW12?=
 =?utf-8?Q?136oZc9vYkFu41y4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c55450-a87b-4a3b-6d9c-08de6ee9f953
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 12:33:52.3980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FiUChyBmWFlk40lBjGhBveGuHRNss2/xlemBk9cl0PaCvYs7eRhdMK2+himpNDDUeipf++CbbdBCwqqDeTjHN6YEQ/6oqdN7kpQBd2xzrpE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6187
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

Rework tools/meson.build to stop linking every tool against the full
global igt_deps set. Most tools do not require cairo, glib, udev,
pciaccess, or zlib, and the previous all‑tools‑get‑everything approach
pulled in unnecessary libraries.

Introduce a small shared base dependency set (lib_igt, libdrm) and
switch to a per‑tool dependency dictionary. Tools now declare their
actual extra requirements explicitly, reducing over‑linking and making
dependency intent clearer.

Fold previously standalone tool definitions into the unified tools_progs
structure and use consistent executable() creation. The tools list is
also reordered to keep it clean and logically grouped.

This is a build‑system cleanup only; no functional behavior changes.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/meson.build | 121 ++++++++++++++++++++++------------------------
 1 file changed, 57 insertions(+), 64 deletions(-)

diff --git a/tools/meson.build b/tools/meson.build
index 8185ba160..0fc2427f9 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -11,51 +11,60 @@ foreach prog : tools_progs_noisnt
 			install : false)
 endforeach
 
-tools_progs = [
-	'igt_facts',
-	'igt_power',
-	'igt_stats',
-	'intel_audio_dump',
-	'intel_backlight',
-	'intel_bios_dumper',
-	'intel_display_bandwidth',
-	'intel_display_crc',
-	'intel_display_poller',
-	'intel_dump_decode',
-	'intel_error_decode',
-	'intel_forcewaked',
-	'intel_gpu_frequency',
-	'intel_firmware_decode',
-	'intel_framebuffer_dump',
-	'intel_gpu_time',
-	'intel_gtt',
-	'intel_guc_logger',
-	'intel_hdcp',
-	'intel_infoframes',
-	'intel_lid',
-	'intel_opregion_decode',
-	'intel_panel_fitter',
-	'intel_perf_counters',
-	'intel_pm_rpm',
-	'intel_reg_checker',
-	'intel_residency',
-	'intel_stepping',
-	'intel_tiling_detect',
-	'intel_vbt_decode',
-	'intel_watermark',
-	'intel_gem_info',
-	'intel_gvtg_test',
-	'dpcd_reg',
-	'lsgpu',
-]
-tool_deps = igt_deps
-tool_deps += zlib
+tool_deps = [lib_igt, libdrm]
+tools_progs = {
+	'amd_hdmi_compliance': [tool_deps, cairo],
+	'dpcd_reg': [tool_deps],
+	'gputop': [lib_igt_drm_clients,
+		   lib_igt_drm_fdinfo,
+		   lib_igt_profiling,
+		   math],
+	'igt_facts': [tool_deps, cairo],
+	'igt_power': [tool_deps],
+	'igt_stats': [tool_deps],
+	'intel_audio_dump': [tool_deps],
+	'intel_backlight': [tool_deps],
+	'intel_bios_dumper': [tool_deps, pciaccess],
+	'intel_display_bandwidth': [tool_deps],
+	'intel_display_crc': [tool_deps, cairo],
+	'intel_display_poller': [tool_deps],
+	'intel_dump_decode': [tool_deps],
+	'intel_error_decode': [tool_deps, zlib],
+	'intel_firmware_decode': [tool_deps],
+	'intel_forcewaked': [tool_deps],
+	'intel_framebuffer_dump': [tool_deps, cairo],
+	'intel_gem_info': [tool_deps, cairo],
+	'intel_gpu_frequency': [tool_deps],
+	'intel_gpu_time': [tool_deps],
+	'intel_gpu_top': [lib_igt_perf,
+			  lib_igt_device_scan,
+			  lib_igt_drm_clients,
+			  lib_igt_drm_fdinfo,
+			  math],
+	'intel_gtt': [tool_deps, pciaccess],
+	'intel_guc_logger': [tool_deps, cairo, pthreads],
+	'intel_gvtg_test': [tool_deps, cairo],
+	'intel_hdcp': [tool_deps, cairo, pthreads],
+	'intel_infoframes': [tool_deps],
+	'intel_lid': [tool_deps],
+	'intel_opregion_decode': [tool_deps],
+	'intel_panel_fitter': [tool_deps],
+	'intel_perf_counters': [tool_deps],
+	'intel_pm_rpm': [tool_deps, glib, cairo],
+	'intel_reg_checker': [tool_deps],
+	'intel_residency': [tool_deps, cairo],
+	'intel_stepping': [tool_deps, pciaccess],
+	'intel_tiling_detect': [tool_deps, cairo],
+	'intel_vbt_decode': [tool_deps],
+	'intel_watermark': [tool_deps],
+	'lsgpu': [tool_deps, libudev, glib, cairo],
+}
 
-foreach prog : tools_progs
-	executable(prog, prog + '.c',
-		   dependencies : tool_deps,
-		   install_rpath : bindir_rpathdir,
-		   install : true)
+foreach prog, deps : tools_progs
+	executable( prog, prog + '.c',
+		    dependencies: deps,
+		    install_rpath: bindir_rpathdir,
+		    install: true)
 endforeach
 
 if libudev.found()
@@ -65,25 +74,19 @@ if libudev.found()
 		'igt_compliance_utils.c'
 	]
 	executable('intel_dp_compliance', sources : intel_dp_compliance_src,
-		   dependencies : [tool_deps, libudev],
+		   dependencies : [tool_deps, libudev, glib, cairo],
 		   install_rpath : bindir_rpathdir,
 		   install : true)
 endif
-
-executable('gputop', 'gputop.c',
-           install : true,
-           install_rpath : bindir_rpathdir,
-           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
-
 intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
 executable('intel_l3_parity', sources : intel_l3_parity_src,
-	   dependencies : tool_deps,
+	   dependencies : [tool_deps, libudev],
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
 intel_reg_src = [ 'intel_reg.c', 'intel_reg_decode.c', 'intel_reg_spec.c' ]
 executable('intel_reg', sources : intel_reg_src,
-	   dependencies : tool_deps,
+	   dependencies : [tool_deps, pciaccess, cairo],
 	   install : true,
 	   install_rpath : bindir_rpathdir,
 	   c_args : [
@@ -94,16 +97,6 @@ install_data(['intel_gpu_abrt', 'intel-gfx-fw-info'], install_dir : bindir)
 
 install_subdir('registers', install_dir : datadir)
 
-executable('intel_gpu_top', 'intel_gpu_top.c',
-	   install : true,
-	   install_rpath : bindir_rpathdir,
-	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,lib_igt_drm_fdinfo,math])
-
-executable('amd_hdmi_compliance', 'amd_hdmi_compliance.c',
-	   dependencies : [tool_deps],
-	   install_rpath : bindir_rpathdir,
-	   install : true)
-
 if libudev.found()
 	msm_dp_compliance_src = [
 		'msm_dp_compliance.c',
@@ -111,7 +104,7 @@ if libudev.found()
 		'igt_compliance_utils.c'
 	]
 	executable('msm_dp_compliance', sources : msm_dp_compliance_src,
-			dependencies : [tool_deps, libudev],
+			dependencies : [tool_deps, libudev, cairo, glib],
 			install_rpath : bindir_rpathdir,
 			install : true)
 endif
-- 
2.52.0

