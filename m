Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF483C5B543
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 20:37:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9698410E809;
	Wed,  4 Jun 2025 20:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IlsfbcJD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E70610E7E8
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 20:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749069424; x=1780605424;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=D/SV90calXKaHRN9roqPfNQXFIayoPGd2dcFksyBJQc=;
 b=IlsfbcJD2YXkBGHQvsQIG91L3xM2XbACFnlIOOO4zIaQq2DXnbHTjo2g
 E3CU2XZtc+ZtedjgRe69ZKL072ZjTFQJXOb+RVxBIW2eK7tvm+FbhFgmn
 1ZUY7Erv4sbxw9qK0S0jI4YPtqUjiuXXJXF34yGRSEo2GAdo5g+UyoIp8
 Eu/w5kwV1kgPs9uLHwGw4j+p17Or/jVJ4gC8lnsNLd2wFy4M1GI4WWLWn
 NnKkfkiyQNTxSEkyNmv8URNTdKfWUia/nrqq+UgKlasEASAE0Tc6y8m20
 mfg3+YQaCnjkx0dFLFyHHhNgOQhubPix3UFlXh9eEwLh0Bnj52ZcFHoWy g==;
X-CSE-ConnectionGUID: iXJwpHGuQl2U7bYjHVd2jg==
X-CSE-MsgGUID: jmevkwumS/Sx8554JWIzKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="38803504"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="38803504"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 13:37:01 -0700
X-CSE-ConnectionGUID: PmlSctC4RjiTx48/s0zieA==
X-CSE-MsgGUID: HXmz4PZWTMy6VjSz2ALHAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="146283444"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 13:36:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 13:36:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 13:36:48 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.84) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 13:36:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dqHQQbevU8gEfQ37YRxi593SXnl7Tlp1ZGZu7f1P7CD0U3gBOZHZcI30Qckv0gQVbepn8jSpZcRqZHqOULJQvQ1JcpxWl/omzGhEoe3NSrQv3S+jDBTewjpn0pTaAiwKLZhkm9KUd+rbBFACEqTfW37ViKh9vsqoPwy+f8YYnkF4WSKJBNIQqFmeK3V5HOicNzV/0dVP6n8a0arMDGznJ2IhKquO8HQ07OawxDojarpjx7rkLWK0isg0YwP7E6Qrcig6f+NolqwwW5KzFP1W0nQLRdeVUMJhpMN+N0Js7lccIWMDnS7U8QtddqKZOc9llpZnEukZyk0bAijgfEU4QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/SV90calXKaHRN9roqPfNQXFIayoPGd2dcFksyBJQc=;
 b=OA/k1wpqSAeR9zERBP0K87Tg/5gzknwh6mYDkJ3hrlqahsg/DjdFFm8xWu7xGtZMTm7HCSer0DBeUrmwuwtNCE15l+R00BE/Tkqx1Rt1gXYwvC3OhL/uwdxK2IdccY7+1yKZq78LEzY6P91K5pGbttUSx5pwQVHhFcF8yDhkyKDYczQ1cGJA9ke2K2nGyHTRazk2qcuPxmuTXgTdl2TNzdtGCWEXJFHatpJWupotqyvYFMaSZZjmMXm3B3l7wdTSEwfcwuj5SGHO+sCIn5KIL/RZQomRKTkr0m2DFuWP2bM4GLrWlXSl0eTXm2XiiGi8UHsVcYVXL2U43qUhrYTu4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 20:36:43 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8813.018; Wed, 4 Jun 2025
 20:36:43 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>, 
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Harrison, John C" <john.c.harrison@intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>, "Cavitt, 
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
Thread-Topic: [PATCH v3] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
Thread-Index: AQHb1XMTXdMvLbhwo0ypNpX8yrO93rPzbN8AgAAIXICAAAAtgA==
Date: Wed, 4 Jun 2025 20:36:43 +0000
Message-ID: <CH0PR11MB5444EE1EDF46AC60809C3667E56CA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250604170621.83132-1-jonathan.cavitt@intel.com>
 <CH0PR11MB54448B182962FA1CEFED2465E56CA@CH0PR11MB5444.namprd11.prod.outlook.com>
 <1ed93f24-74cc-4972-8497-aec2b94aa84a@intel.com>
In-Reply-To: <1ed93f24-74cc-4972-8497-aec2b94aa84a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SN7PR11MB7539:EE_
x-ms-office365-filtering-correlation-id: 3b02b644-dda0-4433-6dd2-08dda3a7848d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?S09YNXJpa3FWTklCRTlVb2dWSlFRRG5ONFM5NTRNQmxCWU9pUmlycmJEenlL?=
 =?utf-8?B?Uk1DeEF3R2NhREMvR2pwa0QvM2Y5b3hmSzZ2Nys3SDR1bnQxRW1DeENwUGJl?=
 =?utf-8?B?MnBpYlBaRWU1REJOUEZ0ME1zQkZSZTNqejduKzZjb1BIWDdhTHdQNzVNVml4?=
 =?utf-8?B?TUYreEJBU3NQWnpBQldIWnE5UHhuN3g1Qm5wQmdjblN2Z2dvbWp4MldpLzFn?=
 =?utf-8?B?bU9vb2xTLzUwT1dFVlhFMmxBVlQvaHQwdVgzazVJZ3JDa25YWDI2UmtJZDFm?=
 =?utf-8?B?V3hUaTJKNHNEZmtXbjVJcnBkbWtQL2ZxWEExbzVzbk5BNXN4cStvK1FBb1Bi?=
 =?utf-8?B?RFE0ZWxIQ2RiUVZDV3lNd3lyeHYydW1KN2M1Mmx5cGVwekhYOWRMTHdycXhJ?=
 =?utf-8?B?akNvWUs2cVZESnVBZk1OTFFSNVlOV0FDck1ybE0zRXRrM3NyM1E2dnBEcyta?=
 =?utf-8?B?TU93bExWZVlobTB0bHZsMXRmb0FoWlJlQTU1SDYzdGpienR3ZlJ5cTRLTzlx?=
 =?utf-8?B?enpVd2pSdVEyOEdmTTNqUmQ1aVVYNktyZk9jai9ZVWllOUQwY1VzUjUrSitX?=
 =?utf-8?B?U1o1ejl2NFdlcURsclBYRGh6N2lkb3RHUnhqby9GaXhHTEgrRDhFK2UxUWJR?=
 =?utf-8?B?c0gvYmhOdnBuT2hlajh0QzZ4aCtNUDgveEc1TUY1cExrZThZVW5Gb1pUdS9U?=
 =?utf-8?B?bGMyS0lSb0VlMENLNXgrcGNkcC9yQkNwUkp0ZEUvS0dsRFBvUFJqdDBwdDNK?=
 =?utf-8?B?d04yVnV4Nm42SnZJQW5rM3ZKQ255MGNhYkNzZGdsMVY0TDQ2cDNVeVJsYnFP?=
 =?utf-8?B?NDhEQWtjUkFPeGdOaHE2QlJLQllHVUw1ZUxNTklWSjdQYnJZRk1UQzJibS9Y?=
 =?utf-8?B?YUlmM3ZhWmtwQ01vTDFYTFh2OEJ1b29PUnZreTJRSHczMWM3VDZJcUJHRFVD?=
 =?utf-8?B?SjF3MGxvejNRMTZpVEpJMkdSbUJKcGx0WFdlV0x1QXlTWFo1eVlDa2d4bU8w?=
 =?utf-8?B?M044ZzdmWnJmbVZoY3ZwL05hRnQ1K3UxMVhNdGFlZ25JRDAyMFc2dU1IL1o4?=
 =?utf-8?B?Zitab2V4bG9oOVovc3pSQzJPbUNhTWMwUmwvaS9MNmpUOUh6S21rTFF6T3R2?=
 =?utf-8?B?eTl6YTJ3L3NkZ0dwZTYzd0M1cjRJa0w5MjNmdHdyR0tsdE82ODNuSFU3NXVT?=
 =?utf-8?B?L0tkVlFTY1NXcGJwWS9PdC9IcmlvbFBmVDJONlQwY3VGNTVRRDdvK1BWTXVx?=
 =?utf-8?B?ZDBleWRxcGhMVjdQWWdDeEdRampsV1dOVkFGNGYvQ0JzZEloOGozc2tFVkRZ?=
 =?utf-8?B?V3FQNWVJd3BoLzZ5a2gycWtSSDFZVC9WYkEzcFQ5Y3diNXJJZXZJbXVZMHJr?=
 =?utf-8?B?VkZOdHhyRFVBOWJVZmR1bER4RlhGbnd6ODNqNGFtc0NKUFhCalNBUWowOW5M?=
 =?utf-8?B?dm9FbTZSSXJmWGFtODhUbTFJTmMrQytUS3A4Q0NqY1JCb29rWjJHM2hyNm5Y?=
 =?utf-8?B?WmNOZVNOL01XWkhydTBKRFFKOGNNdUJYekgrdDgwVGV2TjlKYXlLQWZXdHEv?=
 =?utf-8?B?ZjNGMXY0dzhjN2syR202VWZ0TU9seDNsRHJWSk1oc29OdG1XeGlQd2E3dm00?=
 =?utf-8?B?TE82MC91S3pBdXBnalgrZzJaRnpvdlVEWlAwMjRmOVR4NFhLYmt6czcvby9q?=
 =?utf-8?B?ZjVSalRaaEdOc0FmQ3hySTVQMmFBSkVHTVRsb2RRQjV5RU5nVUcwV0lDcnFR?=
 =?utf-8?B?QzJTd0dyVHYzQ0svNXRFdTdEMmZOT1N6djRZL3d0N01JREE3ajlBZFNkR2pm?=
 =?utf-8?B?b0hTSHZtdHZKZG5LYnFPSkh0YnRMdU5aQ1FHL0J5M2Z1YzRaazNpRjQwSTFx?=
 =?utf-8?B?OWJwRERLMUR6ZDdHSWVJSndxYUhYelBJYWMwSGFqRDZNSlVHcHpGaDFnNmFs?=
 =?utf-8?Q?vXTvJeVvjTg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGEvOGM3VzR6emptQ1FReTJkWmxhQ0d3dzRLV3d0U09yVGJHQ0piYlp2UXYr?=
 =?utf-8?B?dk83YVVlNXFDaFRtdlNqYklFMnppVmx2Z2paRGs4TkZ1V25BaGRZaVNML2tJ?=
 =?utf-8?B?VGU3NS92VkFrcDVMQWZOcThoV0pwV0gyZTdTd2ZOT3pteC8zdEM1amN2M0RM?=
 =?utf-8?B?aUZBMldNVTBZU09EM2pmUHdkc3cxbHZpZlc2UHFEUHhhc1dJdXlLMkhWSWVu?=
 =?utf-8?B?VFhNSVJ0bVdIYnV2VFhVSXUvb0ttL3dEMTJtMm43by9IMFhpd3JYQUtLeWg0?=
 =?utf-8?B?VkVpcVdiWVpkTTR1MTIwVHcvQTdIaTd0Z0c1aFVyQkgyTFlCM0VCSkRaQ0ZJ?=
 =?utf-8?B?dStMSGx5V3ZXeTAyTm5TV0srNC9CZXJ6QUp5YXhRdVB4b1NMeWhDTU9WdFRy?=
 =?utf-8?B?UGZMYmRiSTBNamdxSDBFU0JjYjBiV2pQbzd4Zk1RaVNveVd0amhKa0RMRHR1?=
 =?utf-8?B?cGk1TEhxbXhtMkRJUVZoQ2tYZU9tQUlZbHUyQlM0TVgvbGxTVHc5OGlraHI0?=
 =?utf-8?B?WVpzSkp3OHlZQWNCZjFCRHFncm1SYnFLNVdDRUxnSmttV0NXVkd5RVkrYVd1?=
 =?utf-8?B?S3owUE81Q0JRYUxacUt2NGJZQ1NkemxFc1RYbE9uSjhUa0hZRUt5eUhRTFVY?=
 =?utf-8?B?d29SMEJQRmZsUmo5S2ttUkxvR0sxTEZrLzVIYXExSFBGclc0dlcweStZbUU3?=
 =?utf-8?B?NHpZZ0xLSW90ajc0MGZoSVVBYStjYS9lWFpnZ3VUbjVIMjVUZGxnWXhJYzJV?=
 =?utf-8?B?Z0REV1MranZ5VWtVcjdpZTc2clJUbnN0Z2xtdERPU3FvSFpteFpYTVJ5L29n?=
 =?utf-8?B?V3ZBK2t2ZCtQT2gzTHBvUjh0K25HdlBkNld2SUMxTWtUWlBNZWNsZlh4V3VZ?=
 =?utf-8?B?aHN4SE5qY0hNd1FmQ0dGbG5id25yT3VscjlBalZ0RDI3d08yVWtSay8xQTVX?=
 =?utf-8?B?T0dWUThNMXJnSTJhemk0VmxnblZUaWNKRVNqMitudW1MdzNvTmhVTE1acDJQ?=
 =?utf-8?B?QjBTZjVVMzVCL2FGMjZhTnVkalZDZHorMzB0T2tjZjBQeFdGZTVvOG0wdFp4?=
 =?utf-8?B?Vzk3S2lNKzJqWVZVaG9qZVlMc3dZWi8rTnZHNmwxandHYmsxVGdFN1VldCtK?=
 =?utf-8?B?TXRBSCs2MEJ1SG01cEhZWUdhMXRBbERJQXJaNTVteXZUWU11QmVVUUxEVzZx?=
 =?utf-8?B?cGMvL1Y1Vll5c2Vac1FOREtnZk5RMXF1LzNFSHVvTW1GTXFtK3ZMc3pHUjNI?=
 =?utf-8?B?bGkydjIvY3NPVURneVVXdy9FM3RLMGg2SkhVQUhhekw3VGJLWlQwc01hQklW?=
 =?utf-8?B?OHZvdHZQVjhmMEw4M3R5bDNRQzNaVDU5dEE3d2tYaGloRkRUU0J2QnA1MktQ?=
 =?utf-8?B?Vkk0QmtLdWE4YVd3U2gzVERQMHh3TDJOSUcrM2dGSTJsUDhCSEZZa1kyUm1v?=
 =?utf-8?B?MWlmVVVMNG8rRE9rOXFGaUtRZ3UwSkpVNC9BczRYbkZNMmNhaUZkb3V4bXdK?=
 =?utf-8?B?Q2JCVzhpalkwV3FTSktlWS9OVGx0eGRTd1hLUlRjWm5qV251UXFRQVdoUjlv?=
 =?utf-8?B?WHB6eUlwOXZmWHVleVFoY01Zc2UwZkNMRit3cUM3dkhSQ2FRbFFBOU0xNUk2?=
 =?utf-8?B?akpidW9XRDFmZURZVm9McUkvM3ZJWmZxcWwwUGdqdENsSHJCWW9SeWVCZnBD?=
 =?utf-8?B?OGtvVUVhamV1S0VsdHJuckh5R2RBV3lmRXU4MzRiQ2JuZ0swYW90TkNQcndj?=
 =?utf-8?B?eTZzc3ZJdGRia2NKMUZhYmE5ZmZkeHdPTU1YbHgxQThjMXc4YStTQzY4ZVM1?=
 =?utf-8?B?NWtOZmcyWmQ0SzcwSkVhakk3ejRXVU9mYWlmZDNVOEZtUEY2d2x2V3VxZkZ3?=
 =?utf-8?B?dEpmRkI5eVRKNFhFZTlYT2F0Y28rSWVicjlRRklrcExBdWYxOExVd1JmNm00?=
 =?utf-8?B?NjBBZnNrL00yL0cxYmxzcUh2OFdWUnMvQlVQaStoQU4zRUVFWGRCRWdyTnVI?=
 =?utf-8?B?eGlrR3ZGd2VOVTFWMjYyMlc2bkgwS3pCY1B3SnFkOWVXMEdYTkJ0c0JOMkRM?=
 =?utf-8?B?Q0FUbmdHTThiTktrOEtQNkhkWWpRQjFsQ04yY3JhMDZiVGhwSURHZXpKdVVk?=
 =?utf-8?Q?W5iRVu2ta4jN8AFpyEO0/vhxe?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b02b644-dda0-4433-6dd2-08dda3a7848d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 20:36:43.5063 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pwa03bvK0pRo0t3DJuT6aYMR7LNny13O+8CeeRpGyc85CgJbNRWAzzoBfVEmq0O1bIhNsRXrqGjRoQyckYWsE2X/k9bXmRzJwQQ/ZGB3ZEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7539
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFdhamRlY3prbywgTWljaGFsIDxNaWNo
YWwuV2FqZGVjemtvQGludGVsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIEp1bmUgNCwgMjAyNSAx
OjM0IFBNDQpUbzogQ2F2aXR0LCBKb25hdGhhbiA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT47
IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogR3VwdGEsIHNhdXJhYmhnIDxzYXVy
YWJoZy5ndXB0YUBpbnRlbC5jb20+OyBadW8sIEFsZXggPGFsZXguenVvQGludGVsLmNvbT47IEsg
ViBQLCBTYXR5YW5hcmF5YW5hIDxzYXR5YW5hcmF5YW5hLmsudi5wQGludGVsLmNvbT47IENlcmFv
bG8gU3B1cmlvLCBEYW5pZWxlIDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPjsgRGUg
TWFyY2hpLCBMdWNhcyA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPjsgRHVnYXN0LCBGcmFuY29p
cyA8ZnJhbmNvaXMuZHVnYXN0QGludGVsLmNvbT47IFZpdmksIFJvZHJpZ28gPHJvZHJpZ28udml2
aUBpbnRlbC5jb20+OyBIYXJyaXNvbiwgSm9obiBDIDxqb2huLmMuaGFycmlzb25AaW50ZWwuY29t
Pjsga2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbQ0KU3ViamVjdDogUmU6IFtQQVRDSCB2
M10gdGVzdHMvaW50ZWwveGVfZmF1bHRfaW5qZWN0aW9uOiBJZ25vcmUgYWxsIGVycm9ycyB3aGls
ZSBpbmplY3RpbmcgZmF1bHQNCj4gDQo+IE9uIDA0LjA2LjIwMjUgMjI6MDYsIENhdml0dCwgSm9u
YXRoYW4gd3JvdGU6DQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBD
YXZpdHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPiANCj4gPiBTZW50OiBX
ZWRuZXNkYXksIEp1bmUgNCwgMjAyNSAxMDowNiBBTQ0KPiA+IFRvOiBpZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiA+IENjOiBDYXZpdHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRA
aW50ZWwuY29tPjsgR3VwdGEsIHNhdXJhYmhnIDxzYXVyYWJoZy5ndXB0YUBpbnRlbC5jb20+OyBa
dW8sIEFsZXggPGFsZXguenVvQGludGVsLmNvbT47IEsgViBQLCBTYXR5YW5hcmF5YW5hIDxzYXR5
YW5hcmF5YW5hLmsudi5wQGludGVsLmNvbT47IFdhamRlY3prbywgTWljaGFsIDxNaWNoYWwuV2Fq
ZGVjemtvQGludGVsLmNvbT47IENlcmFvbG8gU3B1cmlvLCBEYW5pZWxlIDxkYW5pZWxlLmNlcmFv
bG9zcHVyaW9AaW50ZWwuY29tPjsgRGUgTWFyY2hpLCBMdWNhcyA8bHVjYXMuZGVtYXJjaGlAaW50
ZWwuY29tPjsgRHVnYXN0LCBGcmFuY29pcyA8ZnJhbmNvaXMuZHVnYXN0QGludGVsLmNvbT47IFZp
dmksIFJvZHJpZ28gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+OyBIYXJyaXNvbiwgSm9obiBDIDxq
b2huLmMuaGFycmlzb25AaW50ZWwuY29tPjsga2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNv
bQ0KPiA+IFN1YmplY3Q6IFtQQVRDSCB2M10gdGVzdHMvaW50ZWwveGVfZmF1bHRfaW5qZWN0aW9u
OiBJZ25vcmUgYWxsIGVycm9ycyB3aGlsZSBpbmplY3RpbmcgZmF1bHQNCj4gPj4NCj4gPj4gRnJv
bTogU2F0eWFuYXJheWFuYSBLIFYgUCA8c2F0eWFuYXJheWFuYS5rLnYucEBpbnRlbC5jb20+DQo+
ID4+DQo+ID4+IEN1cnJlbnRseSwgbnVtZXJvdXMgZmF1bHQgbWVzc2FnZXMgaGF2ZSBiZWVuIGlu
Y2x1ZGVkIGluIHRoZSBkbWVzZw0KPiA+PiBpZ25vcmUgbGlzdCwgYW5kIHRoaXMgbGlzdCBjb250
aW51ZXMgdG8gZXhwYW5kLiAgRWFjaCB0aW1lIGEgbmV3IGZhdWx0DQo+ID4+IGluamVjdGlvbiBw
b2ludCBpcyBpbnRyb2R1Y2VkIG9yIGEgbmV3IGZlYXR1cmUgaXMgYWN0aXZhdGVkLCBhZGRpdGlv
bmFsDQo+ID4+IGZhdWx0IG1lc3NhZ2VzIGFwcGVhciwgbWFraW5nIGl0IGN1bWJlcnNvbWUgdG8g
bWFuYWdlIHRoZSBkbWVzZyBpZ25vcmUNCj4gPj4gbGlzdC4NCj4gPj4NCj4gPj4gSG93ZXZlciwg
d2UgY2FuIHNhZmVseSBhc3NlcnQgdGhhdCBhbGwgZG1lc2cgcmVwb3J0cyB0aGF0IGNvbnRhaW4N
Cj4gPj4gKkVSUk9SKiBpbiB0aGVpciBtZXNzYWdlIGNhbiBiZSBpZ25vcmVkLCBzbyBhZGQgdGhl
bSB0byB0aGUgZG1lc2cgaWdub3JlDQo+ID4+IGxpc3QuICBUaGlzIHVuZm9ydHVuYXRlbHkgZG9l
cyBub3QgaW5jbHVkZSB0aGUgZGV2aWNlIHByb2JlIGVycm9yDQo+ID4+IGl0c2VsZiwgc28gdGhh
dCBtdXN0IGJlIGFkZGVkIHNlcGFyYXRlbHkuDQo+ID4gDQo+ID4gWW91IGtub3csIEkganVzdCB0
aG91Z2h0IG9mIHNvbWV0aGluZy4uLg0KPiA+IEFyZW4ndCB3ZSBzcGVjaWZpY2FsbHkgaW5qZWN0
aW5nIEVOT01FTSBhcyBhIHBhcnQgb2YgdGhlc2UgdGVzdHM/DQo+ID4gSWYgd2UgZ2V0IGFueXRo
aW5nIG90aGVyIHRoYW4gRU5PTUVNIGFzIHRoZSBlcnJubyByZXR1cm4gdmFsdWUsIHRoZW4NCj4g
PiB0aGF0IHNob3VsZCBiZSB1bmV4cGVjdGVkLiAgU28sIGFyZSB3ZSBjZXJ0YWluIHRoYXQgd2Ug
Y2FuIHNhZmVseSBpZ25vcmUNCj4gPiBhbGwgZXJyb3ItbGV2ZWwgZG1lc2cgcmVwb3J0cyBoZXJl
Pw0KPiANCj4gb3VyIGdvYWwgaXMgdG8gZXh0ZW5kIHRlc3RpbmcgYW5kIGluamVjdCBtb3JlIGZh
dWx0cyBsaWtlIGluIFsxXSBzbw0KPiBkaWZmZXJlbnQgZXJyb3IgbWVzc2FnZXMgd2lsbCBiZSBz
aG93aW5nIHVwIGluIGRtZXNnDQo+IA0KPiBbMV0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0
b3Aub3JnL3Nlcmllcy8xNDk1MDEvDQoNCk9rYXksIGZhaXIgZW5vdWdoLg0KRG8gdGhlIGNoYW5n
ZXMgaW4gdGhpcyBwYXRjaCBhbGlnbiB3aXRoIHRoYXQgcHVycG9zZT8gIE9yLCBJIGd1ZXNzIG1v
cmUgZGlyZWN0bHksDQphcmUgd2UgZ29vZCB0byBwdXNoIHRoaXMgcGF0Y2g/DQotSm9uYXRoYW4g
Q2F2aXR0DQoNCj4gDQo+IA0K
