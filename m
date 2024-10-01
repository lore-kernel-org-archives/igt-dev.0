Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613DDCE8376
	for <igt-dev@archiver.kernel.org>; Tue,  1 Oct 2024 06:20:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074BF10E5D9;
	Tue,  1 Oct 2024 06:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J731q/26";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7EE810E0C9
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Oct 2024 06:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727763612; x=1759299612;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vrpZawX6IrOhM7cmOLF8Cnqj4N9rUOSpmGg5wGmA7B0=;
 b=J731q/265SksOVz1zkjOyyt143QVwQrwTYz/+9Tm5IRClTgMLlWkZWSq
 Jn72FiAJRAbCHanO0TMukPAhNIbHS/XZ1V+GfdFAc5w6mkNktYDjQcsLy
 pqnTVDF0ORLgIZTbj6dlDPT/OQQRCcEuVz7RngnpvD/vhvyNetUa+3iiD
 xuAdN4O8qY0eP1lDuVW38eHm9Bt5mnBya+T5Mrr4+oMQg6axHgA9fBYph
 XHrITCgqlc/Tcan6ZH65ePThZybbdzbCL9916dNbv+J7U6yNnlLoYJzUV
 jgNWxY+TgUYoTNj35jHSukcpxmMdc4h5kxymcSjpyDvOVk5O2KtKpgBgC w==;
X-CSE-ConnectionGUID: SnRPuWlRRQGsENlbtKoh/A==
X-CSE-MsgGUID: mwdHQOQUTxW8atMHeXpWSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="37469744"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="37469744"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 23:20:12 -0700
X-CSE-ConnectionGUID: wv0GAMvvRiq6QL4i7sngEw==
X-CSE-MsgGUID: 35YQKvJnQQei76jj9XQg9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="73964777"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 23:20:12 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 23:20:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 23:20:10 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 23:20:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 23:20:10 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 23:20:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GV6FvC+S2JETX50w8I4IwQLoC7ljw3t99Q5kR2TmzVeEmRE3tRJZb65zkRMvHghrH6Y3NcMvThZjVsjbqMHLEMvKoHsiMpWIzZOi8rhYpN0RVAbzzISP7J6TeHZG91wdSEeE0ke2k/3OOoS/dBSwgYFqh870IKJuOOaB1fY8BJN4LIapsUEOxeZ2jqknwOiMqciHm/w+BbAdcm/8n17Ah0VG8MY2SO95+8i/pVO1BU3vzx1CdLLnWZzir4WkoY3X5wsczoiopb+V/gBzhvmN6YBCtiCbv1Dvq+ujRbbWCnSRZjIa0lPcSjqdQ7FsRSZdpW6oFYyli7W2EWUvICUGSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vrpZawX6IrOhM7cmOLF8Cnqj4N9rUOSpmGg5wGmA7B0=;
 b=ZF0oHbozd/qL1AjIXf2M85TQwnktJv3fSEOpsWfZKqS2CfaNl9MlGLoeXpuIvWnkCagRe5q5paddye/3YaLybzBb035MJhEz4isJZCa0tXcFqRRWfeT828twLz0z7oKKUKtxFU064RQYAYL8OPl4SEVd13TB+Xi4O35Lv1t+JAzbwMBZIXapiL2BtgI+HhSfc7EFMQxJS4wguMLcItyG09TjKHL/uihT2k8BNbvsY8FeeeEEMRa0kB4QvaXM/gQX2I9L0gd0hsnn+OzwgkCqxi4z90m8DMzjh/FqajFIeJI/UESaPBex9/8v71t9100OGY0K/AsOGi0yTVNN/dPXVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH7PR11MB6332.namprd11.prod.outlook.com (2603:10b6:510:1fc::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8005.26; Tue, 1 Oct 2024 06:20:08 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 06:20:08 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>
Subject: RE: [PATCH i-g-t 1/2] lib/igt_psr: Allow testing without checking
 sink status
Thread-Topic: [PATCH i-g-t 1/2] lib/igt_psr: Allow testing without checking
 sink status
Thread-Index: AQHbD+KGGm0viVIFwkeWBNMzlARRBLJrLJ4QgAADKmCABkQ64A==
Date: Tue, 1 Oct 2024 06:20:08 +0000
Message-ID: <DM4PR11MB6312BDC0715D8FA4BBD5CA5990772@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240926070517.1326936-1-jouni.hogander@intel.com>
 <DM4PR11MB63128EEBE33599AF82EC98B9906B2@DM4PR11MB6312.namprd11.prod.outlook.com>
 <DM4PR11MB63120769DD22BB9D340F3B1A906B2@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB63120769DD22BB9D340F3B1A906B2@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH7PR11MB6332:EE_
x-ms-office365-filtering-correlation-id: c808b418-f93d-48a9-6d56-08dce1e118f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aCtqcXJKMXlYOUw0NDMraFEyZFFnSFF4VkZrM3BJWi9Gb3o1V2xKMUx2VS9T?=
 =?utf-8?B?c1JXTEJQcmNmTWxPcG1lUzlXR0R6WFo3bzFzcUVuSzhLTkVzOTNvVTQ1NGtE?=
 =?utf-8?B?ZG9HRUFTMDRBOXREMERJeWEyZkZFRnN6R0laeVBiVVdsZ0d6QnNSY3BUVWlv?=
 =?utf-8?B?UFZPS2tpUGJncWRvcklPRk9uZzRUWTA0SVFKMHNlN3VaS3lpWE5QVTEwV2E3?=
 =?utf-8?B?UnpINlJaMUM3SGwrUGdDRlh0U0x5NGJNUkZobmxVVmhqMytTUWY0cHlvMlVJ?=
 =?utf-8?B?SjluelNLaU1mQXhZU1ZkU1RtaHhOTjhQeURiekZpdmNiWkNRWXlsYzFBaTNl?=
 =?utf-8?B?TmRWQk9jZC9XSnF4WHZJZ085blQrdDIvdllUOFMwMDhSZmlqdE42SnF4aEFx?=
 =?utf-8?B?amlhbHNnOHo4UU91RkVHUlpXV05mYlRKZVRGTi9DOWduUlhXQk94a2g5VTdh?=
 =?utf-8?B?T0Z0Q204Q0pOOThsWEhlcUoyZnlyY0MzWWtmNVhxQWVweEVyN3hiSnVlTjZH?=
 =?utf-8?B?SWd4Wkw1MTFCMWFyZkFMd1hRckpBWTcyTzE1Nm91RGNBQWFYdEJvSXVjeW44?=
 =?utf-8?B?QVRPNm14VmVQMVc0anF5MzYxdGtiWGh1Sk9xdnliTFphTGdQZHdwNDlXd0E0?=
 =?utf-8?B?ZnhJVUNTL1EwdmtIV3MxdGVCOVBXcHJzREJEUHdmeW1VeDROam5FTnRJeWMv?=
 =?utf-8?B?empxaFpSa0FodFhRWU15L0pGUUdJZkMzVU1GS0JjNWdhcmN6Z2RSQmJmdkJi?=
 =?utf-8?B?d3RiRjJ1UVJNWWUxQ3F1S2FZbnl5ZURLcjc1NU5ZZjcvamh3bmY1NHBSeFA2?=
 =?utf-8?B?L0Q1K0xMai8vemN1cVVUbnNxNXhnVm9WUHJwUWRvbjFYd0ZHaHp1RmlpRjZC?=
 =?utf-8?B?WXVabVMwOXlwZDljSHZxc2tIYVVMbDhsVHVBUGhkS0UrV21waDBmMEhQSWUw?=
 =?utf-8?B?dGZrTXlPUTc5T0E5Zm1OS1R5Qm9NVWhyZU52cDhtMlZ6TWJic3ZNWmdMSDkx?=
 =?utf-8?B?ZHk2YW5QMW1qZ2FLM1FPbWJHU2w0d3B3b3VoU2tjV2liWXByZmFxeWFQMWIx?=
 =?utf-8?B?TDRaN25RUU1MSkE2UlIzZ25HaFlQb2xNaXdDMWdSUTQzd1Mvdm15czh3WktL?=
 =?utf-8?B?MGJMRjY1RGIyRjZOVHJXY0lQYlpwTVlBdDlub2NtNWV4MSswK1k2V29BZWdI?=
 =?utf-8?B?dEFVd1NsQzhncEZLZnByeTRkazExeERoeXdYSngvSk4zOVBoeHA5RHBHb3hk?=
 =?utf-8?B?bHY5ejhuZ3lNR1FyWkZPdHM4UE5JY3FQbWFZVzdPaFN4WVVMMGc0UWlqMkdM?=
 =?utf-8?B?OEhBNVdwK3pTVmhBWE5RQ1lhS2dyd3dTU0pWRVVZdVZTQTdoR0F5S2xpSm8w?=
 =?utf-8?B?QkFUaGhSTG1QbWwrUVY2QkI5Yi9ObjZSdkg0MmowSjBmTmhTTTcxWFEzYU9y?=
 =?utf-8?B?QzYwaW1jcmZ1Tkp6bkY2aDlTOXV6K09rcWNMc0dOZWVpM2ZtMFJiRWNYei9v?=
 =?utf-8?B?Vkt4SERDM25HNm5JZ1d2eEVrS2YyQVl4Z0NZTlFlS2Y4SGNtQ2dqenk5eWxL?=
 =?utf-8?B?Nm1uUUF1MCtHcS81VGw2UVpNUDYyaEE1ZElyN1dOckVNZ2xtZUthUUYrOHRw?=
 =?utf-8?B?QkJ2NFc4aHM2L2Uwd09ESU9kWEVZTVVPZ1Z4azFFZWlGcE1OV3ArcXJSSXhr?=
 =?utf-8?B?K1RMT2lwWmdGVFVXOTB0bmdtNXpoYm95bFYySEI1bHNqaVM0YXZxblZJWVZI?=
 =?utf-8?B?NGhkOGx3aHFVK1FHM2xvc1dhVkZuU3ZRY2NiUFZIbHg0aWxmYUdpZlF6VXlr?=
 =?utf-8?B?Tm55bVRBc2FoUmpTd0NZQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWc4bExnaWNXc3ozekpWTnIvUlRvdDJOTFdHV0xGakJaOUdkalhBWjVMci9w?=
 =?utf-8?B?d3BQdGtXTkZMbkNoNE1IUmZuOE1PV25HeHdySDRCTTVaTW1hM0ZUSWd6R3Ny?=
 =?utf-8?B?M3N2U3BxOGJFVHpnZ3k0NS85cDR6dlE5RTJrT01yMkY3RUtZZVMweVdRUTFi?=
 =?utf-8?B?U21BWEN0VVlkblBBZWRHVldGdlhNaWw3ZmpVU1NFbFJtVzNtZWwzTUNpdnQ3?=
 =?utf-8?B?djk2VkpMb3QySXhPcElIVy95RktlN0g1S3VGaTBXMGhUMTV0RU5NWmhud0pu?=
 =?utf-8?B?eTBpd1Z4emtOZ1BtRkNxR1RsSzYzeWxmZ0RsVFRISHBNTFdWRlVEeFRuaTJX?=
 =?utf-8?B?NWJiVXEzUzFOYW1oeG1xWHBQMDhueGZWd3hVSkNyTzlEaXZZNXh1ZzJ0Nk9I?=
 =?utf-8?B?SVdZQ0crZlh2Zm9rVEc4eWkyTGI3SFIzQVc2dXhoWGZLN1R1SkdTSEZuZ3d3?=
 =?utf-8?B?ZmRJVUNZTU96N0RiNkRUNGJ6SUZycUV5eG8zR0hCZUgyWUM2aEpVUU52QlRs?=
 =?utf-8?B?WWNQSUpDUmRUb1NGRjRRVlliaHRhL3dLZVBYS0w5VmNIb1ZXUytLWUdlM3dj?=
 =?utf-8?B?RXRwbGkrZU1md0tIdGl0a0NGT3ByRG82cFVSU2NMSVM2NFhqMDdHU3hEc0s3?=
 =?utf-8?B?Y3lxNU5WRFk4MDdSdGNsTENhN2tGK2ZwUm1mVDJaVTIwM0VoVktKclFoWGtC?=
 =?utf-8?B?eXJRcTJBR2ozZDFFL0swRGlYNU9HYXdTZ0ZjZGswWmdMYmZ5L3NSY3lxL0dy?=
 =?utf-8?B?Q2VPdzR1WXFyZHNuZ3hnd3VLdHRCYk85ajFzSnF5RWZ3MDgwVXdVVXh3RDNr?=
 =?utf-8?B?RmJsbVhEc1ExaHp5dUp0K1Z6MGd2UEEycTV4aEZtUCtsamVMRks2UHJmU2o0?=
 =?utf-8?B?UVNaSnpIUzJvMGVmS2hnVXhESUhOMXVYa3lXQ2dCdXp4VTRYUVVOYWUzT09J?=
 =?utf-8?B?SmpVeExzN2xPYTNNdklyZU9Sc3lSeDJVN0VseHFBbVlwYnBBWTBVU1VUWHBs?=
 =?utf-8?B?YlVhNDV5TnpVM1lKQW9PWTRIQ1llT3dkN2hXL0gyZnJkWlR3eVpqenQxNHNl?=
 =?utf-8?B?aW8vY0NVMXlJcDErTUo2NkhZM3BOdVVrNEVvSDVvQWNCVWY3QU55K3RHcW9M?=
 =?utf-8?B?TEpaMUFzOCt2MEo3NjdqU25ITlZqUUpxSzdOTTBmZDhCRnpLR2JXRDNyNFFW?=
 =?utf-8?B?NDFycFN5N3paODlHdmFId2FhMzJqMTJ6UnZwQTBUajcxYUNXUXcza2E1YmRZ?=
 =?utf-8?B?Q2Nzc2J2TytJSWFsSURTMUcvU0NrQ0xHWEVuTXpkRFlBT3oxMkJmVHZqSjFN?=
 =?utf-8?B?dVhBOGY4dXBFM0poaEEyYVF4UkdTajVIN1VPcHV4UHNyVmJIMERpNkovb05U?=
 =?utf-8?B?N05uK1BiTjBDM2toMENlK1V1UTE0YjYwMzd3SVd1aldzSEdCOE5rejZOTFh6?=
 =?utf-8?B?WW9mM3pxcjQ2M1hidk5RM3g5NXhPa2Y0K05JbTNESXZEaGoyY0t5WlUxdm9a?=
 =?utf-8?B?T01ZS2RrV2NyenBpemp4R09uMUY1ZTg0WDduNitTdXY1S3NqUU5NaHZYOXUz?=
 =?utf-8?B?TDVBczBxS0IwR1h0Q1g3cWk4RE00OGZ6U2VYNlI0aEt5M0tKTzR3cHhybUh2?=
 =?utf-8?B?R0U5WUlHbEpaYTd5anNlWDF2czNXL2NrZFVOajlZTGFDVTZwR01Pc1lSQkVH?=
 =?utf-8?B?a3JjUnNmMkdpNy85eTVFWlIrVURVc3hpZWtiTWc0Wk1zSHZYd2lmMG1wbG5a?=
 =?utf-8?B?eWVlenRtSnYrR2xvMm9yd2x2d0loWkhScXNOZG1xejFEWHhMWVd4WHVMN0Jt?=
 =?utf-8?B?ZUQzMFJ4K2pVTWdBRTRvb29oWnNOaW9EVkgwMlBwQUZGZDgzZ3k1ZHF2d0l5?=
 =?utf-8?B?N2g2cDBzN0x5UTZQcnRSUENhVDFKSjEyUks0Zm9leHVVNDRlY1lHZjBMRlVD?=
 =?utf-8?B?dTFpazN6Mjh2eGNadE9HT0dlNEt1R2lSNFhZQnlYNkVVZDRmeFNxamJ0cGFR?=
 =?utf-8?B?SEMzMEVybGZ1SDVieHE0MW5HVGlJMk9VcStwT2x0MCttZUZ2cHAwbjk3L3lK?=
 =?utf-8?B?U2lXdUp1TlJaWGViUTZmNHIzcVZLbm80VElLQ3JHdFBzMVVKY3VxM0VPanhy?=
 =?utf-8?Q?aJoU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c808b418-f93d-48a9-6d56-08dce1e118f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2024 06:20:08.1767 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A0rzYHsr7MGzQIFJsHYO17JcQEg74k2tVBYvz/mJfZL6bLJ3eJeKTFFq24/TtyljrAFJ302m3Oi25hz4IjNqjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6332
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

TEdUTQ0KDQpSZXZpZXdlZC1ieTogSmVldmFuIEIgPGplZXZhbi5iQGludGVsLmNvbT4NCg0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCLCBKZWV2YW4NCj4gU2VudDogRnJp
ZGF5LCBTZXB0ZW1iZXIgMjcsIDIwMjQgMTI6MDkgUE0NCj4gVG86ICdKb3VuaSBIw7ZnYW5kZXIn
IDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+OyAnaWd0LQ0KPiBkZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnJyA8aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc+DQo+IENjOiBOYWxhZGFsYSwg
UmFtYW5haWR1IDxyYW1hbmFpZHUubmFsYWRhbGFAaW50ZWwuY29tPjsgSG9nYW5kZXIsIEpvdW5p
DQo+IDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggaS1n
LXQgMS8yXSBsaWIvaWd0X3BzcjogQWxsb3cgdGVzdGluZyB3aXRob3V0IGNoZWNraW5nIHNpbmsN
Cj4gc3RhdHVzDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTog
QiwgSmVldmFuDQo+ID4gU2VudDogRnJpZGF5LCBTZXB0ZW1iZXIgMjcsIDIwMjQgMTE6NTggQU0N
Cj4gPiBUbzogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+OyBpZ3Qt
DQo+ID4gZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+IENjOiBOYWxhZGFsYSwgUmFtYW5h
aWR1IDxyYW1hbmFpZHUubmFsYWRhbGFAaW50ZWwuY29tPjsgSG9nYW5kZXIsDQo+ID4gSm91bmkg
PGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCj4gPiBTdWJqZWN0OiBSRTogW1BBVENIIGktZy10
IDEvMl0gbGliL2lndF9wc3I6IEFsbG93IHRlc3Rpbmcgd2l0aG91dA0KPiA+IGNoZWNraW5nIHNp
bmsgc3RhdHVzDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBG
cm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBC
ZWhhbGYgT2YNCj4gPiA+IEpvdW5pIEjDtmdhbmRlcg0KPiA+ID4gU2VudDogVGh1cnNkYXksIFNl
cHRlbWJlciAyNiwgMjAyNCAxMjozNSBQTQ0KPiA+ID4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+ID4gPiBDYzogTmFsYWRhbGEsIFJhbWFuYWlkdSA8cmFtYW5haWR1Lm5hbGFk
YWxhQGludGVsLmNvbT47IEhvZ2FuZGVyLA0KPiA+ID4gSm91bmkgPGpvdW5pLmhvZ2FuZGVyQGlu
dGVsLmNvbT4NCj4gPiA+IFN1YmplY3Q6IFtQQVRDSCBpLWctdCAxLzJdIGxpYi9pZ3RfcHNyOiBB
bGxvdyB0ZXN0aW5nIHdpdGhvdXQNCj4gPiA+IGNoZWNraW5nIHNpbmsgc3RhdHVzDQo+ID4gPg0K
PiA+ID4gV2UgYXJlIGN1cnJlbnRseSBzZWVpbmcgcHJvYmxlbXMgd2l0aCBEUDIuMSBkaXNwbGF5
IGVtdWxhdG9yIGRldmljZXMNCj4gPiA+IGFzIHNpbmsgUGFuZWwgUmVwbGF5IHN0YXR1cyBpcyBu
b3QgdXBkYXRpbmcgYXMgZXhwZWN0ZWQuIEZvciB0aGlzDQo+ID4gPiBwdXJwb3NlIHVzZSBlbnZp
cm9ubWVudCB2YXJpYWJsZSAoSUdUX1BTUl9JR05PUkVfU0lOS19TVEFUVVMpIHRvDQo+ID4gPiBk
aXNhYmxlIGNoZWNraW5nIHNpbmsgc3RhdHVzIGNvbXBsZXRlbHkuDQo+ID4gPg0KPiA+ID4gU2ln
bmVkLW9mZi1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+
ID4NCj4gPiBTZWVpbmcgbG90IG9mIHRlc3RzIGZhaWxpbmcgd2hpY2ggd2VyZSBwYXNzaW5nIHBy
ZXZpb3VzbHksIE5vdCBzdXJlIGl0DQo+ID4gaXMgcmVsYXRlZCB0byB0aGlzIGNoYW5nZSBwbGVh
c2UgY2hlY2suDQo+IA0KPiBDb2RlIHdpc2UgTEdUTSwgSXQgc2hvdWxkbid0IGJlIGFmZmVjdGlu
ZyB0aGUgdGVzdC4gTmVlZCB0byBjaGVjayB3aHkgd2UgYXJlDQo+IHNlZWluZyBmYWlsdXJlLg0K
PiA+ID4gLS0tDQo+ID4gPiAgbGliL2lndF9wc3IuYyB8IDUgKysrKy0NCj4gPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPg0KPiA+ID4gZGlm
ZiAtLWdpdCBhL2xpYi9pZ3RfcHNyLmMgYi9saWIvaWd0X3Bzci5jIGluZGV4DQo+ID4gPiBkMTRh
OTM1MzQuLjk2MzM4NTk2Nw0KPiA+ID4gMTAwNjQ0DQo+ID4gPiAtLS0gYS9saWIvaWd0X3Bzci5j
DQo+ID4gPiArKysgYi9saWIvaWd0X3Bzci5jDQo+ID4gPiBAQCAtODUsNiArODUsNyBAQCBzdGF0
aWMgYm9vbCBwc3JfYWN0aXZlX2NoZWNrKGludCBkZWJ1Z2ZzX2ZkLCBlbnVtDQo+ID4gPiBwc3Jf
bW9kZSBtb2RlLCBpZ3Rfb3V0cHV0X3QgKm8NCj4gPiA+ICAJY2hhciBidWZbUFNSX1NUQVRVU19N
QVhfTEVOXTsNCj4gPiA+ICAJZHJtTW9kZUNvbm5lY3RvciAqYzsNCj4gPiA+ICAJY29uc3QgY2hh
ciAqc3RhdGU7DQo+ID4gPiArCWNvbnN0IGNoYXIgKmVudjsNCj4gPiA+ICAJYm9vbCBhY3RpdmU7
DQo+ID4gPiAgCWludCByZXQ7DQo+ID4gPg0KPiA+ID4gQEAgLTExNCw3ICsxMTUsOSBAQCBzdGF0
aWMgYm9vbCBwc3JfYWN0aXZlX2NoZWNrKGludCBkZWJ1Z2ZzX2ZkLA0KPiA+ID4gZW51bSBwc3Jf
bW9kZSBtb2RlLCBpZ3Rfb3V0cHV0X3QgKm8NCj4gPiA+ICAJaWd0X3NraXBfb24oc3Ryc3RyKGJ1
ZiwgIlBTUiBzaW5rIG5vdCByZWxpYWJsZTogeWVzIikpOw0KPiA+ID4NCj4gPiA+ICAJYWN0aXZl
ID0gc3Ryc3RyKGJ1Ziwgc3RhdGUpOw0KPiA+ID4gLQlpZiAoYWN0aXZlICYmIG91dHB1dCkNCj4g
PiA+ICsNCj4gPiA+ICsJZW52ID0gZ2V0ZW52KCJJR1RfUEFORUxfUkVQTEFZX0lHTk9SRV9TSU5L
X1NUQVRVUyIpOw0KPiA+ID4gKwlpZiAoYWN0aXZlICYmIG91dHB1dCAmJiAoIWVudiB8fCAhYXRv
aShlbnYpKSkNCj4gPiA+ICAJCWFjdGl2ZSA9IHBzcl9hY3RpdmVfc2lua19jaGVjayhkZWJ1Z2Zz
X2ZkLCBvdXRwdXQpOw0KPiA+ID4NCj4gPiA+ICAJcmV0dXJuIGFjdGl2ZTsNCj4gPiA+IC0tDQo+
ID4gPiAyLjM0LjENCg0K
