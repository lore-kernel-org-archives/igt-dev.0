Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05317E77197
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 16:45:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B999E10E47B;
	Thu,  9 Jan 2025 16:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FjZ9ht+c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F33210E47B
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2025 16:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736441137; x=1767977137;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s+vk+52m5kPEDpgp+1u9WggcnoEiQuzgCjFwBZHV+TY=;
 b=FjZ9ht+chujSwF/9k6zp+OJtieVX7YC3jTvsdZjcdWQT51rWZbFdKvJ1
 p1xcjTBIotLzjv2F30OY2+tZ+f5KmP7scU571QyhlSVVVKgXaCwbVN1c9
 ZunfsT4rliRcRT+rNcr79QIAkAYf1umgbn5tpyHebn/Dap8cRw4PhPjNW
 cr9EeS4wVK2LlWI9QfrshqQkxqYMlcGt9UR7eRq0uwzV2d6F1SxSgm3UO
 CxfgxCE3bdtBMW5n/joq+Si8H5GxY8om5nCzgbpEsBq90oi5cFyOI1xmz
 8pYuN9enh4rYKmyWeQx4uZz+dYY1e5qYzaVjQ70KoiVOgMlmgl9WI1rL5 Q==;
X-CSE-ConnectionGUID: taGMNx3rSCKLHAr3EEGXrA==
X-CSE-MsgGUID: taWx9RTxTEa/U98m2uBtFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="48129299"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; d="scan'208";a="48129299"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 08:45:37 -0800
X-CSE-ConnectionGUID: UxkeQCDVSj+BoJpwGQUgfA==
X-CSE-MsgGUID: E4+ZETm8TmaAPOJuXtPOcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; d="scan'208";a="103974800"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2025 08:45:36 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 08:45:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 08:45:35 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 08:45:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WCQIlGDCel/CwV9POFndJxXKQJbNUAHvFNk4MwfjJ9hsd65olpyV+ComaHhBinhuV9a1wGovc2iN0Pxi87M6NlCoSIZlPkDH1kik5F4aarkHLqASUCKYntxbisouN03Q5l9SNSGx3XnIh/OJMUNbhgA0lH5WBD+ePB3dFo+QP0//epdegbxXUUTapIvWiHRMqHjbN7/j7QXkeKkUYEeA/vbxg8ODU593ogOZ2uc+qP6Jrmv7h/TUfGNN/stbYYQaKMKeAkDw+kg5abWSk/OAAO0PsLS41TZmTaA1rzlq4ILgGRE1r8SzcJM0/BpyAhs4ZPPRbyYG0dZwt/7wq+9q8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+vk+52m5kPEDpgp+1u9WggcnoEiQuzgCjFwBZHV+TY=;
 b=RyrD7j6hcA0zkSSJ25hCQJruVmPbrvaIutcidRNHMkcKeagyVcaIDIsHYzdOdEAmfeqiaQ+b4vzCcCQf3iq56iixFNwVWCHPH1SdoeK7wm3ra20s8pR3zl11MoIAI9PNYczRRDdCNKbJohrBd+2i5ZJnb5noSYA3IZuiYGxhKZU+esl8hREZhL/SBfv9tmtD/2XPiPf80pyReUjgV+iP+oKOVQvX8F/4xeyYK3LEFo98j/18xPUDzvokW6IWHbREpY8BuJKromU1iZNvhunvXrTEXzdO8ma7b9eHCiM+mudcjbqO28r0T0pM4EiciRbvcMFat5wpbAKdXJ6FeUOxFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by LV2PR11MB5999.namprd11.prod.outlook.com (2603:10b6:408:17d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 16:45:19 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%2]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 16:45:19 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Konieczny, Kamil" <kamil.konieczny@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Garg, Nemesa" <nemesa.garg@intel.com>
Subject: RE: [PATCH i-g-t] Revert tests/kms_histogram: Fix build breakage
Thread-Topic: [PATCH i-g-t] Revert tests/kms_histogram: Fix build breakage
Thread-Index: AQHbYg9WxEQdsrOL3Eay0C7lAC7sc7MOpyCg
Date: Thu, 9 Jan 2025 16:45:18 +0000
Message-ID: <IA0PR11MB730797A94AF7B68FD513C062BA132@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250108205251.1645069-1-lucas.demarchi@intel.com>
In-Reply-To: <20250108205251.1645069-1-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|LV2PR11MB5999:EE_
x-ms-office365-filtering-correlation-id: 6f38f090-2e44-46b8-9ec4-08dd30cd0068
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|10070799003|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?N3ZFaG5KRTFGdkR5TGlodVZKR1ErWHFhbFptSGV2allKaTFweGxwL3VDa1J4?=
 =?utf-8?B?Y1dhUDl6N1E0aG1uV0NBaEFmUXpwRUFPVFBvaWc5RzExbkVTbFpsRGNQM0hK?=
 =?utf-8?B?T2wzT2VldjJFMXJTbXN6ME1LZHh4dnBEZkRGVlVIRVEzTlJMTHdrOWd0NTVx?=
 =?utf-8?B?RXBxWE9teVRaV1FIL0p6ZzBlenpDQSttVTl5ZUg2M0ZkWnlZTmxRbzRCNG9E?=
 =?utf-8?B?TlpCRlZFNEdJRmlMSFFDRjd1SUFsbCtGSEYzNWUyVFdWbWpKNkg2d0dqenFm?=
 =?utf-8?B?MHAyUGVyRGVaam1wWGVqL2kvanRzOUl6MjdpcjdSajUzS1J2Ym9pTDBLdVJl?=
 =?utf-8?B?aUVsMUxWeTlINzhEcFloUDZPL1FVaXUxT1ZzNDhqT2Exb2hmeUZLWS8rOW5l?=
 =?utf-8?B?SnVnbXY2NGJxWkxnaUhPMFJ6MzVPeE1DWi9uOGdCaUlUcU5jVS9EY2lVcENL?=
 =?utf-8?B?ZjEwUmJtOGE5MGczWGlDMElqTkJEL1pRVHQrd3RXYXVZaVJYVklEMmZJTmJV?=
 =?utf-8?B?Uk9EL1E1ZGdKRUp1SEgxc3FmVDY4L1BJSWI1S1A5REFEbGJXSlM5OXFkMjdw?=
 =?utf-8?B?cWlpSXlaQjRWY1BPc0p2Y0xsdzRUUmVCV1lTaHNGbFpkSXUzRW9TTlAwTUhT?=
 =?utf-8?B?cGhLOVlFWGRRbStLQy91ZUZSdDIyeENOV3Z4SUVPU2hWdTBUNDRZOUZPSEg1?=
 =?utf-8?B?TUhCSlpZd3BtZVQ4dnQrUWlNUHhJTzExaHM2dng4OXBINzZqVW9uYjhPaTAz?=
 =?utf-8?B?S0h3TDBmM2w2K2dJMnB6azRuMnpSK3FVZlpRZm9JdytTU1MrRkJrekdWc0hS?=
 =?utf-8?B?RGlBT2tIQ0gya0pGQTNPd29XaDJSdlBOVDJUL2svczBhRm4ydkRaOEJsSllu?=
 =?utf-8?B?OHZyTVN3WkZwVm9xL29ZY3ltWDZ4cGR1SWE4Smg3R3granBPcVlCWEcxWkk2?=
 =?utf-8?B?YjdMU3kzeXJTcXp0Z3Q0YXlOMHl0eW40MWpWaEcvYmVnc0pQVmVtQnl5UWI1?=
 =?utf-8?B?UVRqdGpDNVUrMXFVWUZiT1V6cnBTaXMrSjZNUExYQWkxU01rMXZYN0tOczZs?=
 =?utf-8?B?RGswZUFMOHZtblZhYjREN25kcVFMMHZFSDFNcFNWejdiRXI3VkJ6MFFDRWtS?=
 =?utf-8?B?QXVaTlVMeFlwbmRtM2FDSWhCWEwyUDNjRTJYVzlRZHF5Y3RlWlBaajZ5TE9W?=
 =?utf-8?B?Y0VoeEhDakt6UzhLWEVSUWRZdTdLZWZwamJYZUhjZXFGdzVMY3hOVEl3cjhE?=
 =?utf-8?B?eE54MGNKMEwvTXJZSUt2WUlpNVIzVEduNGdRRnE0REdiOFFhbXlrWUR4UENm?=
 =?utf-8?B?STVQOUNoUXBKUVhzZHNLc1NnV2t3T0F0UVF1L2gvd2gwQ2VMTFp5b1ZoYWQ1?=
 =?utf-8?B?YVhSYXJaUkg4eis4N1d2L2p0RFRLb2ZodnQwaU9kU2VQQVMweUNINlRBeWFD?=
 =?utf-8?B?ZE1uUmhGYTVkaDNkc0JheG8xZmdqc0RZQzZZSHo5cVpENzN3Qlg3elViTXRU?=
 =?utf-8?B?VTRFUCs3cXMwUFNnNmZwbnRHOFpsQ0tuQktCM1pUcVBXQ3RKejF6d29HcHVC?=
 =?utf-8?B?UVEyRXZTemdONTRDV1R4MUZKVXVQYk5GdU9JdmpOSXVqaURPSUErQzVDckxi?=
 =?utf-8?B?anZ6azZTZUszYkpCbTc2ZWJCanVGeitlbDYvMmU1RmtBTGhGZlNoVHdrSG9E?=
 =?utf-8?B?WjhuY2tHZHNjMWhieTFCYWlQSzcrUVZzSXNzWFVzUTZHNXpEbUQ0dldhcDBl?=
 =?utf-8?B?c3FJa2F1YnRvelFCZUY5VXN5YUZ1L3FYTks4a1IzeE8vcENvVTlGMmZCN29H?=
 =?utf-8?B?Mzh1dmkwazZHdUlOOTd0bTgwZUtLZjM4elg2aElaVW1BeFF4Z2dVdTlqMWY4?=
 =?utf-8?B?OExWZ0dYM1hMM1NVeXp4QzY2RVI4bm1CSk9peHZmYXVlT0t5aDM0K3MwKzdQ?=
 =?utf-8?Q?Tu58IlSp/82ooPGo6Lr1rrrsv9jsXM2n?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjhEREJ1SEE1bXBoR1FLeVhDdEptV0NOZzZkVXBmL2txWFl3TWZJaGVqM3lH?=
 =?utf-8?B?Q09mTzA2dkx5MG5udUI2aElSNVJDTkI5RHRuSWpDenFuZXFaUElZdnppVWdr?=
 =?utf-8?B?NTdNbEVwb0tTbnNVNGtxbjNHL0ZkNjRoVHcxZFZlc0ZTZzZuQWRTK1hjNHIv?=
 =?utf-8?B?L2RhRExidlR2THJKc2t1MlRoUmJ1Qjd1cE10YlIyTzhkQi9QRTV0dHBqRnNL?=
 =?utf-8?B?WWdqLzNSZmRnYW5tZnVUZURaeWJscFNDVnhJNE9IQ0VseGZobGFodzRYMFJJ?=
 =?utf-8?B?UkZlODNSU0FsUGNEYmw1V3QvcmdMUXUzaDNlaGFXR3lJbWZkZklueHc3c0xZ?=
 =?utf-8?B?R2JvRGhFMVpVQnRWZUxkNzVBOGk3OTBFdlRIL0xyNVF1Z0RCNmxOcGJBTFVJ?=
 =?utf-8?B?NVNldkd6Q3gyMUt4T0tLNGlpMlU0eXBvSE0rdXpCbTdaOWp6MFp0dDl4clZT?=
 =?utf-8?B?WFJPOUJjK2FmcE5zUUNjU0Jod3hoQ0d5UEFmaHhoZ3F4YXpla0tEeWorS2VU?=
 =?utf-8?B?cG9TWFlsUU0vM25md0xZdDhxQmZGclFyNXNPT0pJVitRQWlLZk1pTVd4WWJJ?=
 =?utf-8?B?MExrRW8yS2d6bFo3NklTUDBmTkJDdzB5NEt0RVZwdWJFdlBVU3lkQS8waXVl?=
 =?utf-8?B?NGpYZVZPTW9nU09FdUZIYXJSN21rNXZaM1AzS25KNzNjR2F5TTFObXZZYklw?=
 =?utf-8?B?NVBicVgxYnpIU3RUVUtSWCtxQ1g3R3BJRnBkWmNqYXU5Zmh2ZkNFRWZXREdO?=
 =?utf-8?B?NkQ3YXFZMC9aZks3QUVMTUo3YS8rZWxFNkk3MFVldHZHU054NnlzNjFlR2Nt?=
 =?utf-8?B?NVR5VElJbFpBM1orZW9vWERHRXhscXRXc2czbXM5OGYrOVU0b0xCUnRleUU2?=
 =?utf-8?B?UjhKaFZIeWhjWWdxeENtUC83amJRQTJNQ0d3NVRxVlhaQWFVZkxSRXZaNTZQ?=
 =?utf-8?B?VGhUN2pRY2s4bm11UDcrZEtJWHl0akwvVjA2eklVcVE5Ylk0RWdwZitYUThJ?=
 =?utf-8?B?cjFqMnR4a2dxQ0twRCtOOFNSa1Nqa2d1S1FSZFRGK3Z2bFdkbUVvdnZUR3VS?=
 =?utf-8?B?dGtNa2pEVTV6V3FwNklqYlVvelJmNDgvbUowTHF4Q1lEMXAxUWtIWFc5YzZl?=
 =?utf-8?B?Y3ZXWkFOUzZqL2F1QjU0YzJCRUd4cS85dmVuQ3pOVnM2YjhPMjVtZWorUWsv?=
 =?utf-8?B?d0RnMWZqcUtiUG9JTGVDK3hIMHdlcjR0OE8ra253MWd1RjZVaTN4RlZOWE16?=
 =?utf-8?B?OVBQZG1tcWhRbHVSWlkyNWVMeGthRTJBNjN0OGVQQkI1K2UwWmpMeDg2eEVD?=
 =?utf-8?B?VUdHNzZRWVk0SXdzTmRSSU9RQXhsRlJta1cyTi9jZ2doaHNJbnJQa2FrNlRr?=
 =?utf-8?B?VGtiYjhLcWxWUE5uV0pJRng0MjJWTEQ1amtFUkhnVkthWVp3OHhrZUY3Zncx?=
 =?utf-8?B?Q1ZaSkk0K09KZEtObFBuZjEvc0pRWXdvdDN0NHRSZTBxREtadGYrZkpPMnFk?=
 =?utf-8?B?UW5mM1dGNFNjZ3VFNGdyYnM5L3BYMWVJV2VTcng1QThIRGhsVlhjbGxUVkV5?=
 =?utf-8?B?ZUw0YzY1eVAxNDZoVHhpTnFhQmlQNUNIanRRQWE2ai9ISXJXeVpNckhLWjUw?=
 =?utf-8?B?c01FRDBEai9ucVgyNWxYZ1VwdXBuM0R0Z3BhUjZJdHVxR3RCUXcwcksrSFhh?=
 =?utf-8?B?MjlCbkJjMzJ4WlMvV3RJV2VnZFhVTExQMTJ6RVpNVlhZemc2US9ON1l3UXRz?=
 =?utf-8?B?bnhwenlGQndHZmZIWGdNSEZKYkZmVnd0V0RpZ1UwbFlaRkNiV0RJYTVkUFlS?=
 =?utf-8?B?QVo1UGdxMGZmdHdOVW0zbVIwRmt3S3AyYWZPR2drbkxHbmdKRnZ5dEVEZWpJ?=
 =?utf-8?B?OWVDVGdRSTlWQzFIZjZRVTYvamhyRHFkTEdWYzJkbFY2TXYzUjJSdjVodGtT?=
 =?utf-8?B?ZW9Kay85SzhkaHM5bVpnQXJBTjBTRXVWakpMRXM5TVhvM1ZvcW9lQXE2NGJR?=
 =?utf-8?B?ejZFNkp3S0M3L3ViYVBMNFJlNzF6T1ZqWS9QSXVQc0lDQWpFMWVKSytQTGtl?=
 =?utf-8?B?U29uUy9aVjhjQnRzRGZ6aHE5a2JwOU55Ni8xQjdvaDlvYVh1djRjT2hIOEFY?=
 =?utf-8?B?QUNFRE5rSUUrTUYvYUlwQ0RKWDF3d1Z4SEhzeGFhVmlRNzR0UjZ6ZzNNMXpv?=
 =?utf-8?Q?9b7zgxi6TpywAUpl6Xzc8zpvuwHQLzsynFKTq6Lp68G6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f38f090-2e44-46b8-9ec4-08dd30cd0068
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 16:45:18.9570 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: geCdsuzBw7MaNCFmja8yZfxKckc8tepbQ8E039+npZu2Tj5NTO7oRSv4sbvZCvJMA8Izq0dzXxgOYmDCRDdGzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5999
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEZSBNYXJjaGksIEx1Y2FzIDxs
dWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKYW51YXJ5IDksIDIw
MjUgMjoyMyBBTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IERl
IE1hcmNoaSwgTHVjYXMgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT47IEtvbmllY3pueSwgS2Ft
aWwNCj4gPGthbWlsLmtvbmllY3pueUBpbnRlbC5jb20+OyBUaGFzbGVlbSwgTW9oYW1tZWQNCj4g
PG1vaGFtbWVkLnRoYXNsZWVtQGludGVsLmNvbT47IE11cnRoeSwgQXJ1biBSDQo+IDxhcnVuLnIu
bXVydGh5QGludGVsLmNvbT47IEdhcmcsIE5lbWVzYSA8bmVtZXNhLmdhcmdAaW50ZWwuY29tPg0K
PiBTdWJqZWN0OiBbUEFUQ0ggaS1nLXRdIFJldmVydCB0ZXN0cy9rbXNfaGlzdG9ncmFtOiBGaXgg
YnVpbGQgYnJlYWthZ2UNCj4gDQo+IFRoaXMgcmV2ZXJ0cyBjb21taXRzDQo+IDg5MTFlZmYyYzZj
MCAoInRlc3RzL2ttc19oaXN0b2dyYW06IEFkZCBjaGVjayBmb3IgbGliZ2hlIHZlcnNpb24iKQ0K
PiA2ZTkzYzJlODA3YjMgKCJ0ZXN0cy9rbXNfaGlzdG9ncmFtOiBBZGRlZCBJR1Qgc3VwcG9ydCB0
byB2YWxpZGF0ZSBnbG9iYWwNCj4gaGlzdG9ncmFtIikNCj4gDQo+IFRocyBhZGRpdGlvbiBvZiBs
aWJnaGUgdmVyc2lvbiBjaGVjayBkaWRuJ3QgcmVhbGx5IHdvcmsgYXMgdGhlIHJlbGVhc2VkIGxp
YmdoZQ0KPiBleHBvc2VzIGEgMS4wLjAgdmVyc2lvbjoNCj4gDQo+IAlSdW4tdGltZSBkZXBlbmRl
bmN5IGxpYmdoZSBmb3VuZDogWUVTIDEuMA0KPiANCj4gTGV0J3MgcmV2ZXJ0IHRoaXMgYW5kIGNv
bWUgYmFjayB0byB0aGF0IHdoZW4gdGhlcmUncyBhIHJlbGVhc2VkIGxpYmdoZSB0aGF0DQo+IHdv
cmtzIGFuZCBkb2Vzbid0IGtlZXAgY2hhbmdpbmcgdGhlIEFQSS4NCj4gDQo+IENjOiBLYW1pbCBL
b25pZWN6bnkgPGthbWlsLmtvbmllY3pueUBpbnRlbC5jb20+DQo+IENjOiBNb2hhbW1lZCBUaGFz
bGVlbSA8bW9oYW1tZWQudGhhc2xlZW1AaW50ZWwuY29tPg0KPiBDYzogQXJ1biBSIE11cnRoeSA8
YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+DQo+IENjOiBOZW1lc2EgR2FyZyA8bmVtZXNhLmdhcmdA
aW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFy
Y2hpQGludGVsLmNvbT4NCj4gLS0tDQoNClJldmlld2VkLWJ5OiBBcnVuIFIgTXVydGh5IDxhcnVu
LnIubXVydGh5QGludGVsLmNvbT4NCg0KVGhhbmtzIGFuZCBSZWdhcmRzLA0KQXJ1biBSIE11cnRo
eQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0NCg==
