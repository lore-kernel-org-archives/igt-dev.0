Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BC6C02192
	for <igt-dev@archiver.kernel.org>; Wed,  5 Feb 2025 10:27:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479E1899E9;
	Wed,  5 Feb 2025 10:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UmDat9Dn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35AF6899E9
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Feb 2025 10:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738751269; x=1770287269;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CecoRLF/GI3sociJXgaY0X5a7sVtnjwBNQ1ZkAC4/gI=;
 b=UmDat9Dn2ijqUZzHqtLswHf9fdXHZIlo9MI9GZebQTL5chdiJgZpzLF6
 kRjhitMJzRrNhTT7PE1v1BHG6Yu3wp5YA9ZTCcjekTVTiWssxgoQGTU70
 3CbV/VsmDbMoWDWFs84mUxbsepdWFR5T6oRpT3fcew7TDY1U0AT1swhh5
 qFumIS8N2z2iu/MIGsRPH8sOV2ZzgOpx8uHLbVcElWpfOwiXBnYHlgwUh
 fM/AF7Ori+9b1DQgKzRLzodjJ90+AfXAvK3aIZiPL71STUoF2yp+nHQyn
 mYGXdL9axwF7gYfBfAm8i69hqngN8fwXgt/eDLkL5a0rISlc55Iom/FiK w==;
X-CSE-ConnectionGUID: S9P7dzyYSIOZehwQ/UZU2A==
X-CSE-MsgGUID: oWYaLY/JSmqlvZeHM/oyQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38543522"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; d="scan'208";a="38543522"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 02:27:49 -0800
X-CSE-ConnectionGUID: yeZLBKLPQ2ez3ybzHgtwug==
X-CSE-MsgGUID: jBOQAHU9RzCEP/AU2LqgyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114936239"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2025 02:27:49 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 02:27:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 02:27:48 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 02:27:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QkMe60KzJol7twyG0NVchaOjHtPjm87FFzE1convMiVqc7+GqFv6TgeMy7ZU1kdqHYiHjMdFeP6gINeaMF80GdmQKBxKg/e12OeIisN/71zYkc8JdDBG0oTquuOZ8ioW11bx9L02ddfwhUu4EkIDQlvryN9PNNwF5EO9yG0hot57p/oXts5k7qYynhaLxUR9gceR6WPGSqyxKCLsgpjkCzI71KMQoieF6o0F93q7R8j7HLWiUfuYgKY+3/5d9UmogBSVuxljlc8Ri88Hv/JnPZNEvkXR96onmAZtSEa15nMbMQH4rrsHB/nOIEExktDI1JzIrd3I81Fz0eTK1b9XHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CecoRLF/GI3sociJXgaY0X5a7sVtnjwBNQ1ZkAC4/gI=;
 b=w0d0giBEjnbyVhuM6WxxbENX4cIJYuqAFBSG/3sBZHpzdff9t2EReykNcq5iS13xL2rH1AefCmUFJLyxbYreA4QjtmzGLHVPKoD7Ehbm8nepdH5lSdKXiB338JBJDfDd1MakDZvVKnolpQeW4MkJDF7betQMuSqbxN6nhi6joq0Q7vijj5erp1c8cE0a34Oz8z7OL+CC0oQfL5wbjXdClMn3AlFnXSO31i+L7AJ+IK6L7+riE1hLE/FMZ9B8BMLhzDlFkYbvrwfps7SynvRhw8uAFyBlG1fr6zZ6Ldrdiw6PZ8AUsniqc0rKSX8+Sna4hLDE9wChGpZYYwoLWvWaAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5819.namprd11.prod.outlook.com (2603:10b6:510:13b::9)
 by DM4PR11MB6405.namprd11.prod.outlook.com (2603:10b6:8:b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Wed, 5 Feb
 2025 10:27:05 +0000
Received: from PH7PR11MB5819.namprd11.prod.outlook.com
 ([fe80::dfc9:d5e9:2cd4:8d2]) by PH7PR11MB5819.namprd11.prod.outlook.com
 ([fe80::dfc9:d5e9:2cd4:8d2%7]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 10:27:05 +0000
From: "Sokolowski, Jan" <jan.sokolowski@intel.com>
To: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>, "Manszewski,
 Christoph" <christoph.manszewski@intel.com>, "Piatkowski, Dominik Karol"
 <dominik.karol.piatkowski@intel.com>
Subject: RE: [PATCH i-g-t 1/1] tests/intel/xe_eudebug: Add
 discovery-race-sigint test
Thread-Topic: [PATCH i-g-t 1/1] tests/intel/xe_eudebug: Add
 discovery-race-sigint test
Thread-Index: AQHbcYjZhmnU8i9JQUaH4ezSbXpSF7M4jNLA
Date: Wed, 5 Feb 2025 10:27:05 +0000
Message-ID: <PH7PR11MB58198B190309DB8129F9653799F72@PH7PR11MB5819.namprd11.prod.outlook.com>
References: <20250128132930.4778-1-dominik.karol.piatkowski@intel.com>
 <20250128132930.4778-2-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20250128132930.4778-2-dominik.karol.piatkowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5819:EE_|DM4PR11MB6405:EE_
x-ms-office365-filtering-correlation-id: 2490527c-db58-4845-e290-08dd45cfa32a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NklOaVB1NVdqS1FOSEpOVkZHZlZ3VzFwK3k1cjB4QnpJQVZmRUVwdkJxbXNX?=
 =?utf-8?B?Y0pnTXZUNXdBR29SR1FnV1pnL3NtZW5IMytHNXhUN09wM0FKaWR0bm5DZ0xk?=
 =?utf-8?B?bm1Bd0ZFd1lnaEUwbDJpWklnbGFmSU8xMlVvZThyeHdQVHdHQmtoTStiM0R0?=
 =?utf-8?B?cDZ3am5TNEdlMzNUOVhpRndMMk8wcDNKTjRmWXpWU3BKU2V1OE5acXNYcXls?=
 =?utf-8?B?azJIZU9kWDh2T21TVE50VERTUTFGSGZ1NnlJTnhsbVd6OWtjdEFBREZCZTk0?=
 =?utf-8?B?engrZmNadmNWV3F1Y2xSYjlaeHdLOW5NUUJDODZYSEdxcDRMRDZHRjhIT2Fk?=
 =?utf-8?B?QmdkQzAwT0kyaWhGUnlXTHJtYUg3QkFMVnRiSVg4NmZGc3dBd1JCZVhsY2FL?=
 =?utf-8?B?d2dXSmVIaWZIL05KckRHK2dyUEVwbTdWa3JvRm9KbmorVmNUVk53Z0dBRTNN?=
 =?utf-8?B?enQrSEF1MlVmbTJFNldRU29OdXUvUVArTlhGK2JoMlZNdmZlS3RPRU41UWJU?=
 =?utf-8?B?TndMQVh1VFg3ZVhmb3dVeFQ0Y1c4UUIveVdQYytBazJBdUM2U2tPNEZmL21F?=
 =?utf-8?B?bWdlb3BNRFNPV0tERGQ0Njd1b1g0ODNueHp0MGZ3SDBrRGg1b0o2bnp1T0ll?=
 =?utf-8?B?am55VEY0K3F6NG82ZmJXT3VRNXZlMlM1WlZJZjFmbGw4MGhyMFpGbDZNTDhF?=
 =?utf-8?B?VG5jazNvVU9IUTlCbSt6RGx1UHg0T281OUh2ZFYzMnlGcFppNkJZWkYzUE13?=
 =?utf-8?B?b1pWUHRwaXlrdlFOMno0QXZUUmNrMk52ai9reUkrSDZLYUUzZWVML3VlNkln?=
 =?utf-8?B?dEJuaUkycWkwRTFMWTk5bXNOcjAwZUo4VytheTVGMy9odDBQSkhSbUVXMEFm?=
 =?utf-8?B?NE5IOGNaYUhMZ0lHdGR3QW9DRnBna1QxVG5nYlBzRnJ3enliYUIrSzVvUU9s?=
 =?utf-8?B?b1lOcytDdzlTWXFkVFlnbitXdnpaUWxrRTFUVXg1R0p6SjQ3VVRJLzQvMTMx?=
 =?utf-8?B?c3BRckd3OVQ3T1ltZWlOY3dZd2pMY1QzQnR4ZmpMY3dEZHZyVW9SbDcxWEZC?=
 =?utf-8?B?MElwU0hIak9nQmV4ellDazcvUVVqL1RwTmhub1pOaEVLRllzK2J4RHRsTE9L?=
 =?utf-8?B?ZUlaS1ZncjJFUU56WWJlN1Fuem4xczZMWWRMcG5RRWZBa00wVk9neWN3bEZm?=
 =?utf-8?B?TGNNVjQ1c3lyRXVKUU0xcUxxdi96T1NYWWFaenBwaUJ3RmtVazM5ZGxWbm9N?=
 =?utf-8?B?Mm51MTY2RjlXSW0wN1hDL1QvL1FVZTVFU08xOVF5dGNPRGtaM2t3WlY0Vmo0?=
 =?utf-8?B?M1hzU3BSZFYyVlZLM1hZWTF0OGg4eWRDTVhiSTNqbHBDZzEweExiN3VXYytk?=
 =?utf-8?B?T2ppSHpLMjNUd3l0QktURzg3YjZmTVA3Sm5KRUY1akJJOEJZTit2QUlsbzZh?=
 =?utf-8?B?elZPdk1QMjU5c0o1YXRMb1VxRTlwcWNuVXNYMUlyenBzRW5pd2k4c0RpS3NB?=
 =?utf-8?B?bTdCcVBhT1ppUU5PWDhOTm9tREdJRSt5a0J3d1p1VWs3QU9xcFptb0Q4RW1Z?=
 =?utf-8?B?VWJ3NHlQTTROZkVHalVnNU5XWFY1a3VIenNRZDRhKzFQMGVhbVUxWThnMzR2?=
 =?utf-8?B?VysrcldzUEJzcnV5WlFiZjJXUHdudWxnMytUakJLUm8ySHZTY09BbzNIQWoy?=
 =?utf-8?B?UFBzd2R3ZXd1d0Y0d2p1S1NucWJ1YjV3V0dtQ1NxdEJaWURvenFYU1J1TVIr?=
 =?utf-8?B?bGVFT3FoYktvM05VSXRVaWRwSk5sRmw2elNpL2JDVktVUzB0ZGU0ZVY5dzFK?=
 =?utf-8?B?K2o5cWFVbTNSQjdlU29DRGxMUEZKZ1p3RElNMlRIc3pPOExTSDA5bjMwN254?=
 =?utf-8?B?Nkl3TFQ1TVRyNFZUb1I3UnloQ0hMcHpBOXZCcjRsSVhuQzg5ajVmdEp5YjZ5?=
 =?utf-8?Q?MDTLHZ/h6+KxYEhJQvM6PachuFriRl7e?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5819.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXQ3dHRxRnhzQU45RXI3ZkVicWppMmMvZ1RxVktoT2RMeWo2V0dCUDBmaHc4?=
 =?utf-8?B?YmVVaFRucndPdUo2Y3pBeThGUk1LeTVCRExqTm5ScW44dUpHeTFmbEtRMlM1?=
 =?utf-8?B?L1VjNTIrSXdlaXRKL2ZiWm9Ba2NLYnB6ZDc3NDZFZUxaaGd1S29ldU9Ia2dv?=
 =?utf-8?B?aURTQXZQVGtTSHFxS09qYmxNNWtlVTk0d2dmZUU1bS81UHpjSlFWTEhzS1BR?=
 =?utf-8?B?a0VKU3gzY3h5L0cra1crMmgxTkFQdmh1dTJCdjR3U1JZY0h5c3U2M1JuSG1o?=
 =?utf-8?B?ZzVLclI2d1NKdnExdEE5OHdESjBXa2libllzUWlwY256L1lFZ2hIekdiMUdS?=
 =?utf-8?B?aElSV3BHblNQTEJuMWU4aVI2VThWN1U2OEVHbklMZlRnR3A3THVaNGZsWjN1?=
 =?utf-8?B?dDhQcmJXR0JDaGRPYnlldXVTUVNTVHpSR2doQ3F2SDF0eG94NlM4MVJpaXRk?=
 =?utf-8?B?d1BrT0JRWmd2dnhVcml1TTJlejF4UUVCdFZ5TG93TVlVekpZSUdjQlZNQldk?=
 =?utf-8?B?dk9QMklBNzdPWXdFdTZuWkRmaWVvdHh6NDNjQkdvZW1Mbk9BdnRHMGs4aVVW?=
 =?utf-8?B?SzBpem5iN1d3aU9FK3hIRGZieGR6L0k2NEh1NDFid3dOTnFvSVY2OHplU0x0?=
 =?utf-8?B?YUlBbHFaaE1jOU5nbWFFbG5jTVdJNXM4andHcWpxSFc3OS8rWnNkbXlZYWc5?=
 =?utf-8?B?ZTBuaFFpdGZuVXc5LzlsWUZtdUdESTY4NFBMTlIxUXRRZVYrOW5wazdiRW0r?=
 =?utf-8?B?eDUybTlkUWxCTmZhL1JxdUtuQjE5eE1uN2Z0djdCcm12eHZaekk4YmFjZXBE?=
 =?utf-8?B?alBuWjh2YU5lVEVSS21NSlBkZVh2VG0veXFnUkczNEhxZWtabUlYN0hucWd6?=
 =?utf-8?B?RG1QZ25Tend6ck00bktMWG1EUXMxRDBBVTRTK2gxeDZNMUY1Q3hZb2VJNkps?=
 =?utf-8?B?djFEajJGVE5BWVIwZVdmUWtLUHpTNWthbmdrSDJZdS9sdExRMkRBdDZEY3k0?=
 =?utf-8?B?VG12OUlmTmdPRVliVEJBb2x6OUJTbnp2dkVxcHJQcTdHTkIrelFldU9YRkxh?=
 =?utf-8?B?MnEybjZLTEtPSURWdGduY1BVRmN0eDlyZTF2ZWFqTUlFcXFlTXVrM2JGeU9o?=
 =?utf-8?B?MDhRV0t4NHhmZE1TSmh5RGYwMkhmb2tDVlB1R2FCQ09KS3RkTWlHR056RnRM?=
 =?utf-8?B?aWVieXZuQ25FanFKdDNXY2t4UzdpMkNpdExMZ0NTQzNmVUxHSnBubXpveTFx?=
 =?utf-8?B?cnl5RCtiN0ovSE9Jd0J6TUVWVUpzSWczT3J2Wk1DKzNXcVFtWmRIN2x0eFdJ?=
 =?utf-8?B?TVFnSHJZZjI5aXM3RmFOOWFsNmhFaVN0ZUdoOFk4R2NCZXVWS0FSdTVKSmF3?=
 =?utf-8?B?UWQvZW9SY1lZSWJJb0JRaytTUlNUOFpFdXpEQm9MRWo0dUN0eld5YTllOTZn?=
 =?utf-8?B?RGZ4Sm9VUy9TdnF4NWFBWnAyWjJLWElwWUdUTlRKNS9JRW1YMjNoVUtoMlk0?=
 =?utf-8?B?YjlZQ3ZFd2trYS9keGRiR0RKZzMxK0dCcTlQcVdrUzJBd0ltWW1pUnh0YUtp?=
 =?utf-8?B?NTJ2SG5MTjFPSW5wbkpWUUk5bkUzK0hsa3JFYzc3NW01RzBjeGlCYzZwSk5r?=
 =?utf-8?B?Q3hWSTI2U2ZYMmRRUGxyWGlEYmk0bzhNWGV0QzVORGlHSm43WlF2cXIrZXdH?=
 =?utf-8?B?NVBZNGdIMzJpUTBvc1FEUVVEcjk3K2VwR1A1TkNwdTl5VHJrTUVXWXlHMHlx?=
 =?utf-8?B?QURGNEhGdERPNi9TWEwrdGUvMWtad1BzMzVNRUp1L1Awb3NycUxSbTI4M3lU?=
 =?utf-8?B?WjlSTEl3VkNuV1BudVR0cXA1ZWZhVXpQS25GazdpRTdQOStrL0dWbURzNWV4?=
 =?utf-8?B?TWIra2MvUjNielgxdTV2bFlVRGRTaG1QMmtHUTd1VVlJTFRSK0x3K0wvZjJ2?=
 =?utf-8?B?VjVGWGpaUVJNM3Z3bmM5YTBGaFlmbWo1Q253Y3ZiM21pSGZZYW5TT1N2WGlu?=
 =?utf-8?B?cVg0V0doTUsyUm5uRCtDWnQrRG9UUko0UUtKZlZjQlEvVjFiOVl6Z2tkbFha?=
 =?utf-8?B?NkNSWUVVMGJBcWFCd2VQQTVIVXhnZXorMGY1S05zUDJldms4b3ZPeVJCM1do?=
 =?utf-8?Q?sI4zz2/rwa2ZUXzFiw6R2BUXd?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5819.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2490527c-db58-4845-e290-08dd45cfa32a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2025 10:27:05.4053 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6iY0Qao5CX/O+m/ZeY7GZq0dHlht3CYILWM6CZy2d6wdXKu9OM2xRqB9LbAVilI1+IOqQ7SY2J/Pv/FXZP5hYFrJDA2DG14AdjF7GW8cbAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6405
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

TEdUTQ0KUmV2aWV3ZWQtYnk6IEphbiBTb2tvbG93c2tpIDxqYW4uc29rb2xvd3NraUBpbnRlbC5j
b20+DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2
LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgRG9taW5payBLYXJv
bCBQaWF0a293c2tpDQpTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDI4LCAyMDI1IDI6MzAgUE0NClRv
OiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IEdyemVnb3J6ZWssIERvbWluaWsg
PGRvbWluaWsuZ3J6ZWdvcnpla0BpbnRlbC5jb20+OyBNYW5zemV3c2tpLCBDaHJpc3RvcGggPGNo
cmlzdG9waC5tYW5zemV3c2tpQGludGVsLmNvbT47IFBpYXRrb3dza2ksIERvbWluaWsgS2Fyb2wg
PGRvbWluaWsua2Fyb2wucGlhdGtvd3NraUBpbnRlbC5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggaS1n
LXQgMS8xXSB0ZXN0cy9pbnRlbC94ZV9ldWRlYnVnOiBBZGQgZGlzY292ZXJ5LXJhY2Utc2lnaW50
IHRlc3QNCg0KQWRkIGEgdGVzdCB0aGF0IGV4dGVuZHMgZGlzY292ZXJ5LXJhY2UgdGVzdCBieSBp
bnRlcnJ1cHRpbmcgdGhlIGNsaWVudA0KYW5kIGNoZWNraW5nIGlmIGFueXRoaW5nIGJyZWFrcy4N
Cg0KU2lnbmVkLW9mZi1ieTogRG9taW5payBLYXJvbCBQacSFdGtvd3NraSA8ZG9taW5pay5rYXJv
bC5waWF0a293c2tpQGludGVsLmNvbT4NCi0tLQ0KIHRlc3RzL2ludGVsL3hlX2V1ZGVidWcuYyB8
IDg5ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0NCiAxIGZpbGUgY2hh
bmdlZCwgNTMgaW5zZXJ0aW9ucygrKSwgMzYgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS90
ZXN0cy9pbnRlbC94ZV9ldWRlYnVnLmMgYi90ZXN0cy9pbnRlbC94ZV9ldWRlYnVnLmMNCmluZGV4
IDkxZTlhZTg4NS4uZGE1M2FhODgxIDEwMDY0NA0KLS0tIGEvdGVzdHMvaW50ZWwveGVfZXVkZWJ1
Zy5jDQorKysgYi90ZXN0cy9pbnRlbC94ZV9ldWRlYnVnLmMNCkBAIC0xMDkzLDYgKzEwOTMsNyBA
QCBzdGF0aWMgdm9pZCB0ZXN0X2Jhc2ljX2Rpc2NvdmVyeShpbnQgZmQsIHVuc2lnbmVkIGludCBm
bGFncywgYm9vbCBtYXRjaF9vcHBvc2l0ZQ0KICNkZWZpbmUgRElTQ09WRVJZX0NMT1NFX0NMSUVO
VAkJKDEgPDwgMSkNCiAjZGVmaW5lIERJU0NPVkVSWV9ERVNUUk9ZX1JFU09VUkNFUwkoMSA8PCAy
KQ0KICNkZWZpbmUgRElTQ09WRVJZX1ZNX0JJTkQJCSgxIDw8IDMpDQorI2RlZmluZSBESVNDT1ZF
UllfU0lHSU5UCQkoMSA8PCA0KQ0KIHN0YXRpYyB2b2lkIHJ1bl9kaXNjb3ZlcnlfY2xpZW50KHN0
cnVjdCB4ZV9ldWRlYnVnX2NsaWVudCAqYykNCiB7DQogCWludCBmZFtSRVNPVVJDRV9DT1VOVF0s
IGk7DQpAQCAtMTE2NSw2ICsxMTY2LDcgQEAgc3RhdGljIHZvaWQgcnVuX2Rpc2NvdmVyeV9jbGll
bnQoc3RydWN0IHhlX2V1ZGVidWdfY2xpZW50ICpjKQ0KICAqIGFyZ1sxXToNCiAgKg0KICAqIEBy
YWNlOgkJcmVzb3VyY2VzIGNyZWF0aW9uDQorICogQHJhY2Utc2lnaW50OglyZXNvdXJjZXMgY3Jl
YXRpb24gd2l0aCBjbGllbnQgaW50ZXJydXB0aW9uDQogICogQHJhY2Utdm1iaW5kOgl2bS1iaW5k
IG9wZXJhdGlvbnMNCiAgKiBAZW1wdHk6CQlyZXNvdXJjZXMgZGVzdHJ1Y3Rpb24NCiAgKiBAZW1w
dHktY2xpZW50czoJY2xpZW50IGNsb3N1cmUNCkBAIC0xMjAwLDU2ICsxMjAyLDYxIEBAIHN0YXRp
YyB2b2lkICpkaXNjb3ZlcnlfcmFjZV90aHJlYWQodm9pZCAqZGF0YSkNCiANCiAJCQl4ZV9ldWRl
YnVnX2RlYnVnZ2VyX3N0YXJ0X3dvcmtlcihzLT5kZWJ1Z2dlcik7DQogDQotCQkJLyoNCi0JCQkg
KiBUaHJlYWQgY2FuIHN0YXJ2ZSBmb3IgbW9yZSB0aGFuIG9uZSBzZWNvbmQuIE1ha2UNCi0JCQkg
KiBzdXJlIHdlIGdldCBhdCBsZWFzdCBvbmUgZXZlbnQgYmVmb3JlIHN0b3BwaW5nLg0KLQkJCSAq
Lw0KLQkJCWRvDQotCQkJCXNsZWVwKDEpOw0KLQkJCXdoaWxlICghUkVBRF9PTkNFKHMtPmRlYnVn
Z2VyLT5ldmVudF9jb3VudCkgJiYNCi0JCQkgICAgICAgLS1tYXhfd29ya2VyX3dhaXRzKTsNCisJ
CQlpZiAoIXMtPmNsaWVudC0+ZG9uZSkgew0KKwkJCQkvKg0KKwkJCQkgKiBUaHJlYWQgY2FuIHN0
YXJ2ZSBmb3IgbW9yZSB0aGFuIG9uZSBzZWNvbmQuIE1ha2UNCisJCQkJICogc3VyZSB3ZSBnZXQg
YXQgbGVhc3Qgb25lIGV2ZW50IGJlZm9yZSBzdG9wcGluZy4NCisJCQkJICovDQorCQkJCWRvDQor
CQkJCQlpZiAocy0+Y2xpZW50LT5mbGFncyAmIERJU0NPVkVSWV9TSUdJTlQpDQorCQkJCQkJdXNs
ZWVwKDEwMDAwMCk7DQorCQkJCQllbHNlDQorCQkJCQkJc2xlZXAoMSk7DQorCQkJCXdoaWxlICgh
UkVBRF9PTkNFKHMtPmRlYnVnZ2VyLT5ldmVudF9jb3VudCkgJiYNCisJCQkJICAgICAgIC0tbWF4
X3dvcmtlcl93YWl0cyk7DQogDQogCQkJaWd0X2Fzc2VydChSRUFEX09OQ0Uocy0+ZGVidWdnZXIt
PmV2ZW50X2NvdW50KSk7DQorCQkJfQ0KIA0KIAkJCXhlX2V1ZGVidWdfZGVidWdnZXJfc3RvcF93
b3JrZXIocy0+ZGVidWdnZXIsIDEpOw0KIA0KIAkJCWlndF9kZWJ1ZygiUmVzb3VyY2VzIGRpc2Nv
dmVyZWQ6ICVsdVxuIiwgcy0+ZGVidWdnZXItPmV2ZW50X2NvdW50KTsNCisJCQlpZiAoIXMtPmNs
aWVudC0+ZG9uZSkgew0KKwkJCQl4ZV9ldWRlYnVnX2Zvcl9lYWNoX2V2ZW50KGUsIHMtPmRlYnVn
Z2VyLT5sb2cpIHsNCisJCQkJCWlmIChlLT50eXBlID09IERSTV9YRV9FVURFQlVHX0VWRU5UX09Q
RU4pIHsNCisJCQkJCQlzdHJ1Y3QgZHJtX3hlX2V1ZGVidWdfZXZlbnRfY2xpZW50ICplbyA9ICh2
b2lkICopZTsNCiANCi0JCQl4ZV9ldWRlYnVnX2Zvcl9lYWNoX2V2ZW50KGUsIHMtPmRlYnVnZ2Vy
LT5sb2cpIHsNCi0JCQkJaWYgKGUtPnR5cGUgPT0gRFJNX1hFX0VVREVCVUdfRVZFTlRfT1BFTikg
ew0KLQkJCQkJc3RydWN0IGRybV94ZV9ldWRlYnVnX2V2ZW50X2NsaWVudCAqZW8gPSAodm9pZCAq
KWU7DQotDQotCQkJCQlpZiAoaSA+PSAwKSB7DQotCQkJCQkJaWd0X2Fzc2VydF9lcShjbGllbnRz
W2ldLnZtX2NvdW50LA0KLQkJCQkJCQkgICAgICBSRVNPVVJDRV9DT1VOVCk7DQotDQotCQkJCQkJ
aWd0X2Fzc2VydF9lcShjbGllbnRzW2ldLmV4ZWNfcXVldWVfY291bnQsDQotCQkJCQkJCSAgICAg
IFJFU09VUkNFX0NPVU5UKTsNCisJCQkJCQlpZiAoaSA+PSAwKSB7DQorCQkJCQkJCWlndF9hc3Nl
cnRfZXEoY2xpZW50c1tpXS52bV9jb3VudCwNCisJCQkJCQkJCSAgICAgIFJFU09VUkNFX0NPVU5U
KTsNCiANCi0JCQkJCQlpZiAocy0+Y2xpZW50LT5mbGFncyAmIERJU0NPVkVSWV9WTV9CSU5EKQ0K
LQkJCQkJCQlpZ3RfYXNzZXJ0X2VxKGNsaWVudHNbaV0udm1fYmluZF9vcF9jb3VudCwNCisJCQkJ
CQkJaWd0X2Fzc2VydF9lcShjbGllbnRzW2ldLmV4ZWNfcXVldWVfY291bnQsDQogCQkJCQkJCQkg
ICAgICBSRVNPVVJDRV9DT1VOVCk7DQotCQkJCQl9DQogDQotCQkJCQlpZ3RfYXNzZXJ0KCsraSA8
IFJFU09VUkNFX0NPVU5UKTsNCi0JCQkJCWNsaWVudHNbaV0uY2xpZW50X2hhbmRsZSA9IGVvLT5j
bGllbnRfaGFuZGxlOw0KLQkJCQkJY2xpZW50c1tpXS52bV9jb3VudCA9IDA7DQotCQkJCQljbGll
bnRzW2ldLmV4ZWNfcXVldWVfY291bnQgPSAwOw0KLQkJCQkJY2xpZW50c1tpXS52bV9iaW5kX29w
X2NvdW50ID0gMDsNCi0JCQkJfQ0KKwkJCQkJCQlpZiAocy0+Y2xpZW50LT5mbGFncyAmIERJU0NP
VkVSWV9WTV9CSU5EKQ0KKwkJCQkJCQkJaWd0X2Fzc2VydF9lcShjbGllbnRzW2ldLnZtX2JpbmRf
b3BfY291bnQsDQorCQkJCQkJCQkJICAgICAgUkVTT1VSQ0VfQ09VTlQpOw0KKwkJCQkJCX0NCiAN
Ci0JCQkJaWYgKGUtPnR5cGUgPT0gRFJNX1hFX0VVREVCVUdfRVZFTlRfVk0pDQotCQkJCQljbGll
bnRzW2ldLnZtX2NvdW50Kys7DQorCQkJCQkJaWd0X2Fzc2VydCgrK2kgPCBSRVNPVVJDRV9DT1VO
VCk7DQorCQkJCQkJY2xpZW50c1tpXS5jbGllbnRfaGFuZGxlID0gZW8tPmNsaWVudF9oYW5kbGU7
DQorCQkJCQkJY2xpZW50c1tpXS52bV9jb3VudCA9IDA7DQorCQkJCQkJY2xpZW50c1tpXS5leGVj
X3F1ZXVlX2NvdW50ID0gMDsNCisJCQkJCQljbGllbnRzW2ldLnZtX2JpbmRfb3BfY291bnQgPSAw
Ow0KKwkJCQkJfQ0KIA0KLQkJCQlpZiAoZS0+dHlwZSA9PSBEUk1fWEVfRVVERUJVR19FVkVOVF9F
WEVDX1FVRVVFKQ0KLQkJCQkJY2xpZW50c1tpXS5leGVjX3F1ZXVlX2NvdW50Kys7DQorCQkJCQlp
ZiAoZS0+dHlwZSA9PSBEUk1fWEVfRVVERUJVR19FVkVOVF9WTSkNCisJCQkJCQljbGllbnRzW2ld
LnZtX2NvdW50Kys7DQogDQotCQkJCWlmIChlLT50eXBlID09IERSTV9YRV9FVURFQlVHX0VWRU5U
X1ZNX0JJTkRfT1ApDQotCQkJCQljbGllbnRzW2ldLnZtX2JpbmRfb3BfY291bnQrKzsNCi0JCQl9
Ow0KKwkJCQkJaWYgKGUtPnR5cGUgPT0gRFJNX1hFX0VVREVCVUdfRVZFTlRfRVhFQ19RVUVVRSkN
CisJCQkJCQljbGllbnRzW2ldLmV4ZWNfcXVldWVfY291bnQrKzsNCiANCi0JCQlpZ3RfYXNzZXJ0
X2x0ZSgwLCBpKTsNCisJCQkJCWlmIChlLT50eXBlID09IERSTV9YRV9FVURFQlVHX0VWRU5UX1ZN
X0JJTkRfT1ApDQorCQkJCQkJY2xpZW50c1tpXS52bV9iaW5kX29wX2NvdW50Kys7DQorCQkJCX07
DQogDQorCQkJCWlndF9hc3NlcnRfbHRlKDAsIGkpOw0KKwkJCX0NCiAJCQlmb3IgKGludCBqID0g
MDsgaiA8IGk7IGorKykNCiAJCQkJZm9yIChpbnQgayA9IDA7IGsgPCBpOyBrKyspIHsNCiAJCQkJ
CWlmIChrID09IGopDQpAQCAtMTMxNyw4ICsxMzI0LDE1IEBAIHN0YXRpYyB2b2lkIHRlc3RfcmFj
ZV9kaXNjb3ZlcnkoaW50IGZkLCB1bnNpZ25lZCBpbnQgZmxhZ3MsIGludCBjbGllbnRzKQ0KIAkJ
cHRocmVhZF9jcmVhdGUoJnRocmVhZHNbaV0sIE5VTEwsIGRpc2NvdmVyeV9yYWNlX3RocmVhZCwg
JnNlc3Npb25zW2ldKTsNCiAJfQ0KIA0KLQlmb3IgKGkgPSAwOyBpIDwgY291bnQ7IGkrKykNCisJ
aWYgKGZsYWdzICYgRElTQ09WRVJZX1NJR0lOVCkgew0KKwkJc2xlZXAoMik7DQorCQlzZXNzaW9u
c1swXS5jbGllbnQtPmRvbmUgPSAxOw0KKwkJa2lsbChzZXNzaW9uc1swXS5jbGllbnQtPnBpZCwg
U0lHSU5UKTsNCisJfQ0KKw0KKwlmb3IgKGkgPSAwOyBpIDwgY291bnQ7IGkrKykgew0KIAkJcHRo
cmVhZF9qb2luKHRocmVhZHNbaV0sIE5VTEwpOw0KKwl9DQogDQogCWZvciAoaSA9IGNvdW50IC0g
MTsgaSA+IDA7IGktLSkgew0KIAkJaWYgKHNlc3Npb25zW2ldLmZsYWdzICYgUFJJTUFSWV9USFJF
QUQpIHsNCkBAIC0yOTEzLDYgKzI5MjcsOSBAQCBpZ3RfbWFpbg0KIAlpZ3Rfc3VidGVzdCgiZGlz
Y292ZXJ5LXJhY2Utdm1iaW5kIikNCiAJCXRlc3RfcmFjZV9kaXNjb3ZlcnkoZmQsIERJU0NPVkVS
WV9WTV9CSU5ELCA0KTsNCiANCisJaWd0X3N1YnRlc3QoImRpc2NvdmVyeS1yYWNlLXNpZ2ludCIp
DQorCQl0ZXN0X3JhY2VfZGlzY292ZXJ5KGZkLCBESVNDT1ZFUllfU0lHSU5ULCAxKTsNCisNCiAJ
aWd0X3N1YnRlc3QoImRpc2NvdmVyeS1lbXB0eSIpDQogCQl0ZXN0X2VtcHR5X2Rpc2NvdmVyeShm
ZCwgRElTQ09WRVJZX0NMT1NFX0NMSUVOVCwgMTYpOw0KIA0KLS0gDQoyLjM0LjENCg0K
