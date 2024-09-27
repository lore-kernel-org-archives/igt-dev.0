Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D171ECEBF78
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 06:27:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4AA10EC1D;
	Fri, 27 Sep 2024 06:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AktloLjL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0032510EC1D
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 06:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727418459; x=1758954459;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YKY0yZ1XIL/EOQVMVOedz0gi2kg0z5zW/OH9cilmVtw=;
 b=AktloLjLdzrM7KoklDXnnih4OR7kqFgqBi1XFVuQwcqOe7ZjC9w+Ynud
 OyrzGIpRLZzpVTHlZP818sCLicuqZfN7TLm4eA3txQ4y2kLHWIXZyoWXM
 LTgtn4hZ9XGLpqQN1+CSGIOYTOVGHeP0axgTBAAiW+/5TMxLb7iPPd623
 YzbMXvwjkWI/x7xPtySB7rOC0SPS6tQ1kaD08+CvJnyI5JjFFcl4FTSlY
 yZxHEUkgduspTE8NirnhenQheybgqWqrhArHZiIk0iJWcG60J8RomHKNh
 QDmFpVknjpW2SMm6pUVMhYQT0RZMpGjEYsNiJFTK/9lxVATjJjwAfILLz Q==;
X-CSE-ConnectionGUID: bMvuyu+NQEefcxHUkaNbgA==
X-CSE-MsgGUID: JxNqCkKiQPe3RAAjfHpCYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37132309"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; d="scan'208";a="37132309"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 23:27:38 -0700
X-CSE-ConnectionGUID: derMSRMET0aZLJ2q8OMK+A==
X-CSE-MsgGUID: I8YnaZ0zQeWcwA0vnxpcNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; d="scan'208";a="95772210"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2024 23:27:38 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 23:27:38 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 23:27:37 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 23:27:37 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 23:27:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ouUURtOmg/yI/EuiENczzEzO+qgtV8Vq2b49EEHmTKU/uhhSqsrn8w+FORokygOgG6doHZO3WK3aSg1xVpzQaTdRaGxyBxaLGZPDNvOOmfsv0EbxrLBgGSs8tsooq8YYoZoxn/wTKFSbhb0McMAb9O3MidBx1WXzmUNnjl+bHtIkbCVb0Om7NCFdd2qTbHt1M3aDp7q7MStYury0/xyhMajDXNMKUa5ZnX1C4fsbNldn7f9+zOwT5yLm4LJryKB3FitMlmp8ocCvdmLYtjn5Ch+yBBYgv+X/5EbUBgYk7K6KzWuDf5iY82UU5qFZte5kkN4H8rznFHusTvNrg5PCSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKY0yZ1XIL/EOQVMVOedz0gi2kg0z5zW/OH9cilmVtw=;
 b=DoplF+uFz6VzPVBrMgVMQ/GehtFGxd+sGBQesxzXYdn1CSzQQ5uu0m07/ygD4RcLgUdMzKoK14BwvgCM1019nR3SZYG6egut8kt2wYvGE5SiBV3e00bUvpwGkuEUB8fkh3L/cDBAAs8VLkLytBA1OcbJtb0Tje59ifewhikClhtYlnhk/jxZZHGL6YCRS80KeGSLyEy7MCBPiwlNoYl+uuwlA2qS/nzVknSrO0e/U1edB9Xc2UcKSpy4LcqMB3y4b0jY7bdCjTLW8UJoDIfoL/iyjaXIJEYrMSVEp2DjSPGTLdvuvvDObQLeoseUBODQ9sDrKgNfLtJzR2ToaPwV9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SJ0PR11MB5053.namprd11.prod.outlook.com (2603:10b6:a03:2af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Fri, 27 Sep
 2024 06:27:35 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.8005.020; Fri, 27 Sep 2024
 06:27:35 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>
Subject: RE: [PATCH i-g-t 1/2] lib/igt_psr: Allow testing without checking
 sink status
Thread-Topic: [PATCH i-g-t 1/2] lib/igt_psr: Allow testing without checking
 sink status
Thread-Index: AQHbD+KGGm0viVIFwkeWBNMzlARRBLJrLJ4Q
Date: Fri, 27 Sep 2024 06:27:35 +0000
Message-ID: <DM4PR11MB63128EEBE33599AF82EC98B9906B2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240926070517.1326936-1-jouni.hogander@intel.com>
In-Reply-To: <20240926070517.1326936-1-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SJ0PR11MB5053:EE_
x-ms-office365-filtering-correlation-id: ff29e219-2492-468a-c4df-08dcdebd799e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?d1RwWnYycnAwQk5WQ0FuQ3U2eTlaM2JxZHdWZFVsY3dNUlJWTmg0UU9oZ0Ro?=
 =?utf-8?B?Q0RZanBEdUVuek96MjF0THFEVVR3ZFdmc2lGWlNFd3ViSERNWkRXMjFmOGJP?=
 =?utf-8?B?RktjbVJRY0VsMnZOc0Z1TS9ZVjhSclZWNlYyc21zOHR0Z3JndFI2VGNiSWRH?=
 =?utf-8?B?U0Y4c1lSeXlhTUcxMkNvY2MyZm4rMk1xcE9pY1RYUS9hUFFUYW9ENGlkci9X?=
 =?utf-8?B?Q3dNOVJQVEN4M21vandFOGI5OVFCUVUvZGFCb29ER0dHaEVQQ1FXR084ZUFl?=
 =?utf-8?B?RTlXQmNybG1GeWptZGdydnFCaHh4d3JBaUw0YjhJbzZxdGFnVGp2Q0d3b3ds?=
 =?utf-8?B?eEM3WVlTTU04eW10bU43VmdMNmhkZEMrRGF1Q1FRdmFuUmkrQ08vWm5Hc0hp?=
 =?utf-8?B?Ryt4K2F4T3dFTDU3MlhMWDdRejJmMEpGSm12THJwVFV1bkk1WndDOUJnZVM0?=
 =?utf-8?B?ajQxWnhiWVZYbVN5YTVOcXNrc2FoWWY0dlVNRFQ0eGZRMUh3dXF0eno4MTVl?=
 =?utf-8?B?YlRWczJpS2hPeGU5WDNEaXVnSUhRazdhc3dUMEg0T0U1eG84SzBLamsvTWRt?=
 =?utf-8?B?ZEdwMGJFRTJQUkdPUDNOeEdDbXhwRXNyNTR2clptcnFwTHNOb3NVV3BLdnRO?=
 =?utf-8?B?Uk1nOWpxcGZsL0tyL2tNVWh5bnY1QzVUNkZlQlBnQmVuYjFIWldWdkF0YkJ2?=
 =?utf-8?B?QkxUY21RSFZjV3NOVjdZOG5qUTk5WDZyV3k1U1RIWGxzVk5XTTNHUDFJOGx0?=
 =?utf-8?B?L3ZiRHpsRUNBWnJLU1NtbCt0enY1YW8vVUNPUWxIN0F4L1h2L3NQL1BUT2RN?=
 =?utf-8?B?dTMzUWFrVkV2Zis5M0pic1hkdStUWWExQ0tHckphbUtCWkUyS1IxeVpha1di?=
 =?utf-8?B?ZXNjbm5aZTMvMFpndDJZNnRNWGhjdlpUa3BTUlpzTmZTcktwTkxTdXpkNTNs?=
 =?utf-8?B?cUZrYmFETzNveXg4NlBsbUNFSXR5TXpOV2NUWUwyNHVlRGNkQ0hXS1I0WTVD?=
 =?utf-8?B?aFRnN1hBNmxWKzFSN3c5bnowS3pQdGVyeUN0VHF1aDd4VnFBeWc5cmFaUnZM?=
 =?utf-8?B?aG1JYlJhZDZnNGQ3bjh3RTg0T3FsT3R6WFpWTDN6ZXBoQW12NUh6TTRabTcw?=
 =?utf-8?B?TVlDY0lBYWdqeFJ3M1N4ZFQ3UnZBOFJlTHhoTzR1M3ErUGRMVUpOR3lGQ1VD?=
 =?utf-8?B?YXlSL0FUWFpkcWp4ZTg3dUlwdFRKbkQ4bTMzYjV1WEVENS9aM1BCSVIrK0x2?=
 =?utf-8?B?RG9CcGFYNCtXYkRGR2Z3cmZubjJhZHZOcTRDblFVOTdOR1MwSVZSbHVCTnpZ?=
 =?utf-8?B?bmtGR3NVVTkrVE5vWjVuOTNxNTlsWENzbTdXRnZPRXhiOU1tMTRiZm8rTXBG?=
 =?utf-8?B?YUQweUNYekRyWmN6YzFiV0VybWhlbmxtQmhCYjRqOTJVY01aRWNpWmVWVXZF?=
 =?utf-8?B?S2lkS2RhSVN6NDdGam92L09oUTZjUkxnVU4yRWM5S3AvMVR0OTg1c1l3dnB3?=
 =?utf-8?B?S3dPTDhRRWFEaFZqeGVrS3ZWNDFVN2J2Tm5LUENNWjdLVGJPbWxDd3VNWDJT?=
 =?utf-8?B?L2h3OHBIaFdhNzBNaXgrb05sL2hvNzJWL2tGeDhYS1JLMG8zSDRiSHlvSUls?=
 =?utf-8?B?dGR0VmZoRlo3cXpZUGpRekRCNmhvVzI4K3I3NkxuM0hBa0F6amdkd2sxK3RW?=
 =?utf-8?B?UFA2MnpEVU9kUzFRdVlqWWY5WTdGdHVqd2M1bFRWTjUvdmtibkJqSkFJRDE0?=
 =?utf-8?B?QytQR1U4c3c5TzR4bGtiV2ZTRThUbjluTXZBQ1A4cFRVSnRld21nazZWdG54?=
 =?utf-8?B?enVyZzY3cHNpOUtUa1U4aUN4V3NYVVk4SFFBTVlFdElWeTd5Kzl4Mk9ML05M?=
 =?utf-8?B?NjBaaURRNjMzNFFKRHVpUUNqQUJwRzNrejRhS1dMS1ZxNkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUVLZ0twdGxjMm5hdWFaM0V3VlducTNJWURzak84NUxTK09CN1ROdGRwM2NC?=
 =?utf-8?B?Z1JNNWhlaG1GV0ZabVRhUmdLMTltWUVoZ3l1SkVTQkpCYVRzSXRLU1lDa0Z2?=
 =?utf-8?B?bjUwY0gzVnowdzR5N3FiSkkyYWU1NU1sU3Bjc0YyRzgzTDkvU0tqWmhUdHA0?=
 =?utf-8?B?aDY3YWtUN291cUcxbHhSQzBXSW1YKzRQamhRNW1qYW5HWG02ci9wOWZRTWhz?=
 =?utf-8?B?SEh0U1pRVy9Mck9Sdm5ZNkI1QlZXeUgzemNrNnZUd2ZveDNVR3R5L1UyUFg4?=
 =?utf-8?B?WkZMT1dpY2lBamtDY2NhSTFGVlRBbnV1ZFJleGJ3V1dTR3U3TGw4KzNJK1Ji?=
 =?utf-8?B?b3MvUmdyeVZsdzlyZmZyVVF2aTJFaUNqdnVNeTN3S3dUeXV0U0hTWlE2SUZF?=
 =?utf-8?B?bmlPVitjNFJLczhRcTFiUVRpR01YQzZNekZNS3dIZG4zQ1BTQ1NNc0xNM1h5?=
 =?utf-8?B?VkUzd0Q5TkZzY0ltWXJROGFzWGJEekpIN3phcXk4R3E0SlplUDFhOHFqYjVC?=
 =?utf-8?B?MnRWaG41aHhVaU8wZmdOeGg4QTFkQjBnWG9ZbWY0YTBGd2VoVlhXNkxyMFdt?=
 =?utf-8?B?TCswV1UwdnFveUhnZC96UUV3Z083bGNrZHVPcnVxS3B3dEswWnlrVUhjVk9M?=
 =?utf-8?B?QzhvUExXblBzc2JDUWVWdGlONGNEVVp2bVNZRDA5UTFBZTBzRHZzOUdiMEYw?=
 =?utf-8?B?YXJDbkhOZzhnUmhOM3B2M1NZYVZWVUNOTkxoZDl4SHAyd0YrQkoxc2k2MGJ1?=
 =?utf-8?B?cVZ3WHk5L1Jhb1poUFZnako2cG1HMFRyajMwV3hZcklvRGp6ZEJ0YlVZOGpJ?=
 =?utf-8?B?eWYwZDVVV0FYc2hWczJHNS9pREswMkt1a09lSU03M05QYnp1Q2RhYThHelB1?=
 =?utf-8?B?UDBZSnpGN0xsckR0V1MvRXVtdmZESVBNMDdlWmMrOGxLeDVjTG1GSGV2akF3?=
 =?utf-8?B?TWJETENuWlR0eEcxdW41ZEdsSzVKd2IwYXVxS0NXU2dRWFY1TlkyUFplWStw?=
 =?utf-8?B?OUEyRnA5UjdUbDdwaUFQQjV3V2tMa2pKZ3UweUZ2bmJpdnVzbzRpWEFZZytx?=
 =?utf-8?B?ZER2bnpXRXBzTkIvUXNHVERvMG1CNDR6OEhiYzBPWXo5MTk1NWRHeGE0Qi80?=
 =?utf-8?B?aHpud0VCcjN2RzNjaHhZSHFkVVd0SDRJbzlIdXRrYWdQYlNFUW0weXFORGIz?=
 =?utf-8?B?VUV6U2hkMEtSQzg0ZGVNUVBYaGtpVXFyZG5VQVM1NGEyVU8vdzhtRkdMN1li?=
 =?utf-8?B?SElvSENrcDZLWGl4RFFCU2kwUld2WHZXWkVGVnljNVF5alpFMm9lQ0RuQy9W?=
 =?utf-8?B?T01YY0JRRk9NYi9YNitQTmYveFpiRmZZSzdqa0ZkRlhYY29CazVTLzFsVEZU?=
 =?utf-8?B?TTVsSld3TDYxbmJlN0pTanU3RG55cDYzYUlYeWtoOGY1Q1RXaXE1Nlp4S0tn?=
 =?utf-8?B?NllkbzBadXJiNGY1TGZuMk56MHlNMUhJZXlyeDR2TU1BNktGMk9WVmVrMXpi?=
 =?utf-8?B?RG1BNjlkaFpJQVlSRStWaUtSNzNPZWdnWmswZnNXUHBYeEl1R2VmeWhXTUps?=
 =?utf-8?B?M21QMGpUSitFR3BlWHphRFNDYnYrdXc4Uld6NXFESHhiTWZEOUU0T21Oc3Z5?=
 =?utf-8?B?UXZNeitWK1hrNDU1L1ovM1c4allmOFhGUlVlTTBTL1ZqVWVtenJlU0VqbjdY?=
 =?utf-8?B?VXVJNUlNZnpKWkZ6ZUh0d0RhZmNmdmFMNmpjM3JuUDA5ZHBkVk11djJ4V1F3?=
 =?utf-8?B?cWl5Z0lSQitkajltV3djcGFNMG5tQ043ek52cXE3c29EY2NjbjB5VHFSQytD?=
 =?utf-8?B?ZUxpbHdmVk1IaGttL0FHZDJONjBDVW5Bd3VaSGRMbVIrRURSb1VuTFRIS0c2?=
 =?utf-8?B?U2tyT2VNVU02WUdqWHVqZnZPVnZ0dDY1KzdoWkkyNGd5c2JKNVl6UUxPMlpD?=
 =?utf-8?B?NlJFWnRwV3BGb0JKYVZvTms3Z1hucG5mVkF1Wkp3WEdwSWN3YThTV1VWK2tv?=
 =?utf-8?B?K3kwVnlCaVFpZEh5QTBLaFJoTERGUkVtemVTRzIzc001N2RrQXRYTGNSeWVB?=
 =?utf-8?B?VW1tOXFFWXRlbDR6Qmt5NDRrejNXdzIySzRXaTBabVhBR25kU1gvNmc3bmVz?=
 =?utf-8?Q?1Gp0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff29e219-2492-468a-c4df-08dcdebd799e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2024 06:27:35.0262 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aCoQECziONpAJd/JsLDblvyFRR4XQ4OnGOLaJAIAl79DvsnyzaCIKCjbivCYznDbVk2xAYO0gJBLcdzrvvAy/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5053
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSm91bmkNCj4gSMO2Z2Fu
ZGVyDQo+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMjYsIDIwMjQgMTI6MzUgUE0NCj4gVG86
IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBOYWxhZGFsYSwgUmFtYW5haWR1
IDxyYW1hbmFpZHUubmFsYWRhbGFAaW50ZWwuY29tPjsgSG9nYW5kZXIsIEpvdW5pDQo+IDxqb3Vu
aS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdCAxLzJdIGxpYi9p
Z3RfcHNyOiBBbGxvdyB0ZXN0aW5nIHdpdGhvdXQgY2hlY2tpbmcgc2luaw0KPiBzdGF0dXMNCj4g
DQo+IFdlIGFyZSBjdXJyZW50bHkgc2VlaW5nIHByb2JsZW1zIHdpdGggRFAyLjEgZGlzcGxheSBl
bXVsYXRvciBkZXZpY2VzIGFzDQo+IHNpbmsgUGFuZWwgUmVwbGF5IHN0YXR1cyBpcyBub3QgdXBk
YXRpbmcgYXMgZXhwZWN0ZWQuIEZvciB0aGlzIHB1cnBvc2UgdXNlDQo+IGVudmlyb25tZW50IHZh
cmlhYmxlIChJR1RfUFNSX0lHTk9SRV9TSU5LX1NUQVRVUykgdG8gZGlzYWJsZSBjaGVja2luZw0K
PiBzaW5rIHN0YXR1cyBjb21wbGV0ZWx5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSm91bmkgSMO2
Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQoNClNlZWluZyBsb3Qgb2YgdGVzdHMg
ZmFpbGluZyB3aGljaCB3ZXJlIHBhc3NpbmcgcHJldmlvdXNseSwgTm90IHN1cmUgaXQgaXMgcmVs
YXRlZCB0byB0aGlzIGNoYW5nZSBwbGVhc2UgY2hlY2suIA0KPiAtLS0NCj4gIGxpYi9pZ3RfcHNy
LmMgfCA1ICsrKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9wc3IuYyBiL2xpYi9pZ3RfcHNyLmMg
aW5kZXggZDE0YTkzNTM0Li45NjMzODU5NjcgMTAwNjQ0DQo+IC0tLSBhL2xpYi9pZ3RfcHNyLmMN
Cj4gKysrIGIvbGliL2lndF9wc3IuYw0KPiBAQCAtODUsNiArODUsNyBAQCBzdGF0aWMgYm9vbCBw
c3JfYWN0aXZlX2NoZWNrKGludCBkZWJ1Z2ZzX2ZkLCBlbnVtDQo+IHBzcl9tb2RlIG1vZGUsIGln
dF9vdXRwdXRfdCAqbw0KPiAgCWNoYXIgYnVmW1BTUl9TVEFUVVNfTUFYX0xFTl07DQo+ICAJZHJt
TW9kZUNvbm5lY3RvciAqYzsNCj4gIAljb25zdCBjaGFyICpzdGF0ZTsNCj4gKwljb25zdCBjaGFy
ICplbnY7DQo+ICAJYm9vbCBhY3RpdmU7DQo+ICAJaW50IHJldDsNCj4gDQo+IEBAIC0xMTQsNyAr
MTE1LDkgQEAgc3RhdGljIGJvb2wgcHNyX2FjdGl2ZV9jaGVjayhpbnQgZGVidWdmc19mZCwgZW51
bQ0KPiBwc3JfbW9kZSBtb2RlLCBpZ3Rfb3V0cHV0X3QgKm8NCj4gIAlpZ3Rfc2tpcF9vbihzdHJz
dHIoYnVmLCAiUFNSIHNpbmsgbm90IHJlbGlhYmxlOiB5ZXMiKSk7DQo+IA0KPiAgCWFjdGl2ZSA9
IHN0cnN0cihidWYsIHN0YXRlKTsNCj4gLQlpZiAoYWN0aXZlICYmIG91dHB1dCkNCj4gKw0KPiAr
CWVudiA9IGdldGVudigiSUdUX1BBTkVMX1JFUExBWV9JR05PUkVfU0lOS19TVEFUVVMiKTsNCj4g
KwlpZiAoYWN0aXZlICYmIG91dHB1dCAmJiAoIWVudiB8fCAhYXRvaShlbnYpKSkNCj4gIAkJYWN0
aXZlID0gcHNyX2FjdGl2ZV9zaW5rX2NoZWNrKGRlYnVnZnNfZmQsIG91dHB1dCk7DQo+IA0KPiAg
CXJldHVybiBhY3RpdmU7DQo+IC0tDQo+IDIuMzQuMQ0KDQo=
