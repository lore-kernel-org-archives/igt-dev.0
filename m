Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384ECE77188
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 09:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE56510F02D;
	Fri, 10 Jan 2025 09:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iASD+QLd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D173410F02D;
 Fri, 10 Jan 2025 09:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736501982; x=1768037982;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tsynU5nYn8P1K18dqTFRVZshn44fv5zL3uLhVcXHbQ8=;
 b=iASD+QLdcBi5e9O7yydv6ZesTPPn9hBkj0L6xT4Y5FJlABi7mlCcCfKm
 vBCQUNowiUayltrFuLzGpw5+LekREAQHJJHU0dIrWRWrZGtWkykmql1W7
 3cJBHw9l/lYfxyLXxi9vdHBomyU5eiOlL8HoY25Q6P0hR0EbBHv/GQsv3
 ztdby30laFc0R6d8HNENxGMxwyXknXKYc32pCDmdE0So2yyQuNU1cXD2Y
 6t0QPfJ7GVtUNtRm3RSZ6oncqJBdvnVzoK83zzLI+ukIZ2F5KHoetvC2R
 M/6qCK6jEiBtemcKrR8whbH+ob2cVupi8sZgJqiEPD2tLT8tklHzR1tmL w==;
X-CSE-ConnectionGUID: lQ002TXwTMGj1PSvAkHlLQ==
X-CSE-MsgGUID: Z+1IulL8T1KZlWgH1OzdnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="40733388"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="40733388"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 01:39:41 -0800
X-CSE-ConnectionGUID: SfgC3OUjR7yO1Of6nH/lxg==
X-CSE-MsgGUID: DHplRx2JQMeuoVFPtGPZMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134588958"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jan 2025 01:39:37 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 10 Jan 2025 01:39:36 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 10 Jan 2025 01:39:36 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 10 Jan 2025 01:39:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j72ys+Eca82wxJfBpY1T5JXXVUNqy5nRU+z3j4oYLQSL0tV+C3q3n2++t93FIQEz40yjkq93SGxG6Yg84Sznb7+mPQLWJL6RJXC8R+et2oXpwE0kZNAUWHltuMGU1G/1oMPMm+NHZQ/i2ziQRM33qGbo40d/NkrYxrablTAe25BbfyI4wDTj2zo2FUDe2WwjqJULrifZPfauakO1OngFb3qwpSOMEp3Ok0BWenVH/dvibOvVL0MPYsPzutLajGC1KeuYRkt4Hz6I0WZOWailvab15RZ/UO6YkP0P8+46298UiOj4rtq1/6DoCnfcLLklD1Daw1/44xk2atga13dFrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tsynU5nYn8P1K18dqTFRVZshn44fv5zL3uLhVcXHbQ8=;
 b=kpJB8S3Q7q8pTUJm7IgwCwcsGmoF2UhvRQqMt5a4oTc95b3Sz9uF/j/m4cjCQLH0/QQkQC3SaJFb5Bvr2Y5iqr4xw8pV7ifPy6hpDNUnRdMo3IZ09/1iZzqvuG6p3cPdBIkuKt2QxkSdsnZ/EB93ocBhDxXUrz4W38yYt0UMyL0E3x4hUt+M/C8CwPHHCytZXQyt0pfciDLk6pjfhP2jcTXYmRkOnqRmXmosBIasFaM9c4qo5hY6qdi/s7hgIMAIsNOZz695RU0hyAJJ43WtpdPjXOf2AnfPTe4c6Qin5oXsUJQo4Lp95i6P8aCPP8iP7ogyCiDJ6OHrQEtdjTR3rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by PH7PR11MB6724.namprd11.prod.outlook.com (2603:10b6:510:1b4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Fri, 10 Jan
 2025 09:39:28 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a%4]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 09:39:27 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2lndF9rbWVt?=
 =?utf-8?Q?leak:_library_to_interact_with_kmemleak_(rev2)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciBsaWIvaWd0X2ttZW1sZWFr?=
 =?utf-8?Q?:_library_to_interact_with_kmemleak_(rev2)?=
Thread-Index: AQHbYtqfc/EPPQebIEyIsRMBFnRDV7MPwI8A
Date: Fri, 10 Jan 2025 09:39:27 +0000
Message-ID: <CH0PR11MB5491512F2D696F3FA5B866E1EF1C2@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20250109181027.90402-1-peter.senna@linux.intel.com>
 <173645503540.1723339.14281937234503972914@b555e5b46a47>
 <ad4db798-13a4-4dae-b904-ab4ab682eb8a@linux.intel.com>
In-Reply-To: <ad4db798-13a4-4dae-b904-ab4ab682eb8a@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|PH7PR11MB6724:EE_
x-ms-office365-filtering-correlation-id: 5754b2b1-b8b3-4e7f-efe2-08dd315aad30
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UDlUOUU4QjdXR21ra3MyTmx2NThibyszNzhucHpsL0c2VVRlb1p0bXNFejRq?=
 =?utf-8?B?L2JXSERQRk1saTJac3ZwTEFTVG03aEhGSW1QZDFTSlFSM0FwWEJhOUsyc1NN?=
 =?utf-8?B?d2VNTWNjYjRFOGZybDRpMEFmaFV6VHFtWGFIT3JNMGJ4OGRubUZYYlE4TTAx?=
 =?utf-8?B?K1NKbU5pcnpFUW5yWDVhRndyMkVTMms1Qmo2T2hGYjNxbFhHakxvSjNUc2xk?=
 =?utf-8?B?YzcrYk9UYjgyaUVYWWlhclNsOUJtbW9zTGd3azhUL0toWDI0ekx1dUhaNHo1?=
 =?utf-8?B?QWw1NjlMSjhBNHMyY0Y3T3BkbSsxUm5FdldPQTRPUGhTSm1IN3RwZGVWZUxI?=
 =?utf-8?B?YmYwT1VLa0cycXhQUXRodWhpMXlQRzZYaE52QlRwUG9EUk45R0pCYXg4SXlz?=
 =?utf-8?B?Q2FkcGRMbmtPVElxVFlpMFg2eDZyNk9xTlgvSllIUEh1aTJUMlN1Rm9XV2px?=
 =?utf-8?B?OGx4Sk92Wi9CMWtERDhYQ3hLaEs2UnN6M2JmYUNLR3RUVHczS25nYVVKZnN5?=
 =?utf-8?B?R1J2SHp3NHdLZEJHdTFGRTFEZ0dTaHNlRWtudTFnM1Fkc2lYL0IwSi9xbHJS?=
 =?utf-8?B?THB4UkhvajhvWDMxUU1WT3htMENLdFlVL0MwbnNSUjRKTWdtUWZ1R2d3OWpq?=
 =?utf-8?B?K1JMSDFlR2NRbnNtSDI4UVN4SmRlWnZNTGRmS2xERTNZMjNYTHVXaVdUTitS?=
 =?utf-8?B?ZkNKVFk1MXcyOExjYTl5Ui9NWVhaazFsVDBUZVZRakM0ZXVHZFR6RjN1cEdx?=
 =?utf-8?B?a1ovb1JaOTdtL2pUYktVcTlyWCtNRllTVWhmM1ZwMUplNC9zRXNoMHFERUhq?=
 =?utf-8?B?RXZSSEFCeG9qdG1NcGpHS0ZhaVkwdHdvSG5abnBjVCtNSzZJMzRRUDJBSUNq?=
 =?utf-8?B?WlUySjlqaTFZWEpXTS8xR2tzdmVjb2JmNFJ0VUl3WWx2Z0dEMjJZVGJUQVR2?=
 =?utf-8?B?aHNDSGF2akg3Nm9LcGprL1hoS3R5a2g4MjFGTysvN0VpL0RSSk15a2NIVHph?=
 =?utf-8?B?Mjd5Y2VTYkx3MXJBclpmS3lLd0JxOVFHK2JwbTFEazFIcE54QWVqcGpnMlJp?=
 =?utf-8?B?U3pJUERiOWhBVTFVRGcrU0FZWldua1E5VTVZRDRVOEFmN1MycW5sbHhJcnJt?=
 =?utf-8?B?UVVGa1ljUzBScE5xUnFHQkxOdWx6QTVkbUhWek1sK1phcXJPeDBEY1pxRkJF?=
 =?utf-8?B?UmJwamJNYWFOdnVvYm9TUjBrQy9Ka0thSWRNSmlBeTVwSnVkTDg0ekRTeVds?=
 =?utf-8?B?R2l4cGpiSXZ3OE9LU3RnN3hHZTNiWlEvMUF4NGxZZEVpTlJtSTA2QnN5SG1x?=
 =?utf-8?B?eUlzK1dBMmxObkZ4Nnc3VGVYbEtEQ2N1dkxhMlZKZXEycGdFM0Z4WmJ1bGVs?=
 =?utf-8?B?QWR4RUxHOGE3THhoN1Y1QzN5cTdSZ3dQSGc2Ti9ERU1UTkFzQlgvTHdPOWZN?=
 =?utf-8?B?WFVWU3g4VFI2OUNXaDBrZWt1bTNFYTFyb1lsdWkvcXUxdFNFSnczSzlXV0RN?=
 =?utf-8?B?NnV6elpMU2xMbjVndXNrTFBJZXVnc21NSmZTQ3krUXdEdEgvMEJpTmNVOTIy?=
 =?utf-8?B?TXFaenZrREdXUDUrZUorZTFuNmpvQndKY1hrNVh5YmNPb3VDMVREMmRYTzBQ?=
 =?utf-8?B?TUpCM2Y4UlNGK0hJR1dnRDNGUE5vV0FobThaV241aUE1Y0pXSWQ0NUtEZGpH?=
 =?utf-8?B?YlNjbHg2OE9mbHd3OUJtcFU2ckF0MHNORGVybTR0aytpaWZ4WTdaaVBxRkZw?=
 =?utf-8?B?d1c0WDIvU1RZZlRPdmlFTHpmUWVvMzI2ald6cnVkSkJlanJQSzBGLzQ1ampW?=
 =?utf-8?B?YlcreitmRjV3VlVNN3lXOXN6STArWHBoQzQxOXZNRGg5QlR0MklCaGlVYTdX?=
 =?utf-8?B?Y1dsSG1QNmN0ZTNwc01HUHRRTEFzZGw2NTNzdnUxTWVMZUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TW45ZmpMV0szcWJ1cjUyclhqRS9ISWcrdzNhczNmcFRpczduM3hKQWc2ZmNa?=
 =?utf-8?B?Wm95eXNTclhnYnlWVlBCY1dVRXEyK0FRY2dBc2JlOVlqRzdWNEk1M3lCZjk1?=
 =?utf-8?B?SnBOdlJBbkhDeG9ESDNWc1c3RElxMVpFcDNHUDVvbVR6WkdlNWN1OXlYcjc4?=
 =?utf-8?B?RFhWNExnSCtyMUhLeW5CV0xrSG82S2pja1BPOUlOT0ZOVGJJTWdKNWZaakIw?=
 =?utf-8?B?Uk12WlNOQzBMYTZDd2hiRGVDR0dxQlhnZEZ4eFovOUI0YW45RTVSZFhGaTNy?=
 =?utf-8?B?eGdhWUVLUnpMVE1ERVBWNEFwNE1OamhIN0FOV3lyMmo5SHhKNitRamp3ZWNa?=
 =?utf-8?B?UTFZQW5TakVLalRTdTlrVFJNdWpBT1NBREptc0hqMndtaGxtTGNyYzVlNTZ6?=
 =?utf-8?B?SCtTL3hJSG0rRGhJbW8zQUpWQTlSSUo2ZUkyamczOWIxL25jSXVhWkNPbnFN?=
 =?utf-8?B?Z2ZrWUl1eTFFaW9yVWdiTmZpU2p5blJUS0hEdG5rVjhKejNQVHU2MUU1K0Fm?=
 =?utf-8?B?bGpPUDg1V3VDRzdlK29OT1hlRi9Ud1pra2ZsVmR0SDMxUDRyV2xyT3dOamVK?=
 =?utf-8?B?VGhBRFBlVW81Q0MzTk96TFJLdFVEWEtJVHF6MXBkck5GTTFJSEJvdlBvMXht?=
 =?utf-8?B?V2w1MzJzcUsyRUxSSEVocEVPS3dhT2kvMFpkVk1lTzdlS0pEc3V0Y2ovS0w2?=
 =?utf-8?B?S3VUV04zbmkyeW5BVXVINHdocHNSdTFsZ2pVbktZZlFkaUozdG5ZYXZMNGhr?=
 =?utf-8?B?Ny9WbG9YNlFZYUtIM20yNkliamRMbGl0MWduL0orek9qajBVa1oveFBjVHY1?=
 =?utf-8?B?MGg3ZTNPL3pwdktsclJiN3BvQ2dBTVRyTTlPeFVKcmR2OVh0Zm1zTlNEQ3VG?=
 =?utf-8?B?MFZRRERiMzhPUnBOeDlOZ1cvRThSeWl2R21qSG9PVGpSbEh0YS94cU4wNkxv?=
 =?utf-8?B?ZStwNWFVdUwyNW1LTGdaWkI1VmErOStnS3lWS1ozbG5vV252RUVFdmV2ZTRj?=
 =?utf-8?B?dWVHT1BUVVR0TGhmMHE0MW53Zis1ZG9saGFtUjVqcS9XRExEdy9oUkM2ZGhC?=
 =?utf-8?B?dHdPb1VjTlZxVDd6ckQ0WTVOSnk1alhLTkRvN2gxTng2L3g3R3pEbUF0bitJ?=
 =?utf-8?B?OE9mb29TQ2NINUJzdFMvU1Izbi9rajRWRVRjRStLYWNCNm4vdk13UUZtRTRi?=
 =?utf-8?B?alloa0tEV3JUcjZUWnBUSURxU2RaYXJVTHB4am8vSGcwLzBpZWxhMmIwYUUr?=
 =?utf-8?B?OWlNdjViTUVnUWpnVWJjUkpEMkdwYmRRZ1lFWFd4b2liOTV0YUFJQVdnemtQ?=
 =?utf-8?B?OG1tYnJiYVhhZjE3T0YwZ1UrdmFOTkNCdysrdlJlTU9aTC9XbC9scnVrRlQw?=
 =?utf-8?B?UFd2NTVzUUNWZ0ZSajlFOFBneElUVUI3NitLK1NKQTdzUXUrZ3B1cnYvM3VN?=
 =?utf-8?B?L1FRMFhyUFdVZ0lUcUpLamV6QW12ei9tV3ZIZFBIeXBZZ1R4OXU0RDdHbXFi?=
 =?utf-8?B?SE5qNzl2THVpalNwNTlWWnA4NEkrZkxTd1dES0pvVXQ4U1MxQTAwb3BtT3c3?=
 =?utf-8?B?Mk9kelN0U3NJaFIyYjZPcWZtVGd4Ym9HNTI0YnlqbG10djI1dFBiZHEzY3U4?=
 =?utf-8?B?NThiR2pXOVpPU3lFVXE1UHVoK2djck9wTFgrWHVITThsTTR2ZWdrOTkycnBp?=
 =?utf-8?B?dGxhczF4K1cyVVFEVUNmVTJiVTlmUHZBZS9HNUZHUmYydTBkb2RydUdiU1Rv?=
 =?utf-8?B?dVBJMXhNcnBLb25iZDFIWHlxbzExUWNWUU5qdzlzYkhXazVEOU9YUi82Y0tv?=
 =?utf-8?B?bDNaNk5XNWhzcDV2ZWJFTXgzVU41SHpZeHhUNVYwQzFPNHFmQzRIR21pa3lj?=
 =?utf-8?B?Wk9ncnZVamYwdXdka0RqNERVQWRCRGV2aURGaUkwZ2RKT1k0QkJlbU52NGl6?=
 =?utf-8?B?d0NJMHA5alROTytDNmxsYjVUdURvVWhueTZMWEk3SW5NWTJsUytnZ1hGWkk5?=
 =?utf-8?B?SElBQjhBNlBvVDdqdHBIYUxySm4yTW5jendYelhKVUNSRlNteEtVWVVWQith?=
 =?utf-8?B?b2MxWi95OUF1THFSNllzQ2JZc3RjNlBCRDJzdHNFRDhNSVhJaWVOT2lrb09x?=
 =?utf-8?Q?AR/70hqxp+QgU+407df9h/1G+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5754b2b1-b8b3-4e7f-efe2-08dd315aad30
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2025 09:39:27.8617 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 74OrMkJISw10mLrJ5WKRhkrw65Uk8GdCSUa3fWhkSr4x0Oro3fnQgAw9D+lhRYs5HfbxNbX6hX23VpBXl6kYkNy+EK18ftJxQZzrsvfokCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6724
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQyNjczLyAt
IFJlLXJlcG9ydGVkLg0KaTkxNS5DSS5CQVQgLSBSZS1yZXBvcnRlZC4NCg0KVGhhbmtzLA0KUmF2
YWxpDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBJOTE1LWNpLWluZnJhIDxp
OTE1LWNpLWluZnJhLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2Yg
UGV0ZXIgU2VubmEgVHNjaHVkaW4NClNlbnQ6IDEwIEphbnVhcnkgMjAyNSAwMjozOA0KVG86IGln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KU3ViamVjdDogUmU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2ln
dF9rbWVtbGVhazogbGlicmFyeSB0byBpbnRlcmFjdCB3aXRoIGttZW1sZWFrIChyZXYyKQ0KDQpE
ZWFyIEk5MTUsDQoNCk9uIDA5LjAxLjIwMjUgMjE6MzcsIFBhdGNod29yayB3cm90ZToNCj4gPT0g
U2VyaWVzIERldGFpbHMgPT0NCj4gDQo+IFNlcmllczogbGliL2lndF9rbWVtbGVhazogbGlicmFy
eSB0byBpbnRlcmFjdCB3aXRoIGttZW1sZWFrIChyZXYyKQ0KPiBVUkwgICA6IGh0dHBzOi8vcGF0
Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQyNjczLw0KPiBTdGF0ZSA6IGZhaWx1cmUN
Cj4gDQo+ID09IFN1bW1hcnkgPT0NCj4gDQo+IENJIEJ1ZyBMb2cgLSBjaGFuZ2VzIGZyb20gSUdU
XzgxODQgLT4gSUdUUFdfMTI0MjEgDQo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0NCj4gDQo+IFN1bW1hcnkNCj4gLS0tLS0tLQ0KPiANCj4gICAq
KkZBSUxVUkUqKg0KPiANCj4gICBTZXJpb3VzIHVua25vd24gY2hhbmdlcyBjb21pbmcgd2l0aCBJ
R1RQV18xMjQyMSBhYnNvbHV0ZWx5IG5lZWQgdG8gYmUNCj4gICB2ZXJpZmllZCBtYW51YWxseS4N
Cj4gICANCj4gICBJZiB5b3UgdGhpbmsgdGhlIHJlcG9ydGVkIGNoYW5nZXMgaGF2ZSBub3RoaW5n
IHRvIGRvIHdpdGggdGhlIGNoYW5nZXMNCj4gICBpbnRyb2R1Y2VkIGluIElHVFBXXzEyNDIxLCBw
bGVhc2Ugbm90aWZ5IHlvdXIgYnVnIHRlYW0gKEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnKSB0byBhbGxvdyB0aGVtDQo+ICAgdG8gZG9jdW1lbnQgdGhpcyBuZXcgZmFpbHVyZSBt
b2RlLCB3aGljaCB3aWxsIHJlZHVjZSBmYWxzZSBwb3NpdGl2ZXMgaW4gQ0kuDQo+IA0KPiAgIEV4
dGVybmFsIFVSTDogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAv
SUdUUFdfMTI0MjEvaW5kZXguaHRtbA0KPiANCj4gUGFydGljaXBhdGluZyBob3N0cyAoMzggLT4g
MzcpDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBNaXNzaW5nICAg
ICgxKTogZmktc25iLTI1MjBtIA0KPiANCj4gUG9zc2libGUgbmV3IGlzc3Vlcw0KPiAtLS0tLS0t
LS0tLS0tLS0tLS0tDQo+IA0KPiAgIEhlcmUgYXJlIHRoZSB1bmtub3duIGNoYW5nZXMgdGhhdCBt
YXkgaGF2ZSBiZWVuIGludHJvZHVjZWQgaW4gSUdUUFdfMTI0MjE6DQo+IA0KPiAjIyMgSUdUIGNo
YW5nZXMgIyMjDQo+IA0KPiAjIyMjIFBvc3NpYmxlIHJlZ3Jlc3Npb25zICMjIyMNCj4gDQo+ICAg
KiBpZ3RAaTkxNV9zZWxmdGVzdEBsaXZlQGd0X21vY3M6DQo+ICAgICAtIGJhdC1hZGxwLTExOiAg
ICAgICAgW1BBU1NdWzFdIC0+IFtBQk9SVF1bMl0NCj4gICAgWzFdOiBodHRwczovL2ludGVsLWdm
eC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVF84MTg0L2JhdC1hZGxwLTExL2lndEBpOTE1X3Nl
bGZ0ZXN0QGxpdmVAZ3RfbW9jcy5odG1sDQo+ICAgIFsyXTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4
LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTI0MjEvYmF0LWFkbHAtMTEvaWd0QGkNCj4g
OTE1X3NlbGZ0ZXN0QGxpdmVAZ3RfbW9jcy5odG1sDQo+IA0KVGhpcyBpcyB1bnJlbGF0ZWQgdG8g
bXkgY2hhbmdlLiBQbGVhc2UgZml4IGFuZCByZS1ydW4uDQoNClRoYW5rIHlvdSENCg0KWy4uLl0N
Cg==
