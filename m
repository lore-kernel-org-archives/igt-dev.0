Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AABCA5FD7
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 18:15:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0EA10E647;
	Tue, 20 Jan 2026 18:15:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QcNeSS+i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1091410E647
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 18:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768932941; x=1800468941;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sQVQT7JosAkyzGmLAWFsUa5SgPqC4YGy6QWkavpSCq8=;
 b=QcNeSS+iKA2oYyM5ygtb1DtHPHw5jbNCoNhni3uqaXS+h5LAiwtbejnS
 bSQZE8pxUkqtBai/rrE8bPnnaSqNVoUWZie7Fo17sDBm10NWTL8eRj/ed
 /ykKyoFv8XoD1FUkfKnWR5rm2kMOwU+O1aHtwD/Y8jk0ujY5e4dvdHVU9
 tv8ymWOSEorrG4R6gSGeOPv1RH/dhwBC/viY72jLhO7oIGYC308yQMTWf
 qL8Y+uT+znuOoP3vmhxd9GbAghHT0bwiJKokN3ex8NS4jV4wM022LK/o+
 IJC3gbH6P0mPmSvSL86Q7ZKo1VIQaOwit7x8TF7L6PXtMP3eo6mG7RUNt A==;
X-CSE-ConnectionGUID: 46nqa8pQScKrLLra8Q630A==
X-CSE-MsgGUID: 1Yeff/DlTM2WwO5URRppBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="87730691"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="87730691"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 10:15:39 -0800
X-CSE-ConnectionGUID: HpE/mHeBTfyNQUz4nN2MUw==
X-CSE-MsgGUID: 7BJXlMVCSc2b1d1dyd4qJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="206242718"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 10:15:38 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 10:15:37 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 10:15:37 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.41) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 10:15:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hIa9sd41n5UWS4PHFOsReld1KsabXAcH8EwgnV6I+WzatoVCWl/WEpE4OvVRNlgGLIAPqwnwRNw30ssklySiX4OBFtnDyKiuyrPCc0IkitjlPgooCOwOrqZR7/2LqJTRze1VPaVzW2IMmRdug7sCvdqqFs4LQ9WS2G9ZZutVjyyCXQST+2mu07zyxmBlvh21+qEtNZq4fzk09gRMPfeqvE02voysEtEwYi0Rpyyio57j9WX4dItybRlEupvPNp1LDQcmSgyu5mlR0gc2kK6VneQxMMGvjjxQYB0KCoejWuovnkdMu/7BhJSJfyJlMEF9jyO699qIsKwgzaBxR0hcPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQVQT7JosAkyzGmLAWFsUa5SgPqC4YGy6QWkavpSCq8=;
 b=UCutwnKovuCdTRhBb7UW2CK2Hktum8W/3RSKYiaMhFe0V5hNOHNBqBFqlCG1grGUF3bCMixa0B79Srj8/7H9FbXKEHOfStcx8jWxrfm/Idqf0YVB2iZQHzdDCR/9Kf/3ApBllT4tUQml44+nmZPLkWM9K9Tsqi4Mv0GQpYPADk3DygTrSbOLdVSa+mt65a4Q2YBJWI4knLvgiO8ziRj2XEdqEEHZnzevbalasngD9wfuORjSuKz30i0+fShqCmng5+k78c8WYJpyAI/nAGb3IIEKT564af9zNvlMsbtzzQnKCIsBAt1cnAr/hGocJ88tg0OF3ZLtoDztrmhSgyNNRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by IA1PR11MB8829.namprd11.prod.outlook.com (2603:10b6:208:59b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 18:15:33 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 18:15:33 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v2] lib/xe/xe_legacy: Cleanups in xe_legacy_test_mode()
Thread-Topic: [PATCH v2] lib/xe/xe_legacy: Cleanups in xe_legacy_test_mode()
Thread-Index: AQHchm5345AiEPrsJEqnslIrC6un0bVXXNAAgAQGU9A=
Date: Tue, 20 Jan 2026 18:15:33 +0000
Message-ID: <DM4PR11MB5456015CABEA7D0DEE768330EA89A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260115222938.330490-1-shuicheng.lin@intel.com>
 <aWxksBjMDVhWIm+Z@lstrano-desk.jf.intel.com>
In-Reply-To: <aWxksBjMDVhWIm+Z@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|IA1PR11MB8829:EE_
x-ms-office365-filtering-correlation-id: 9a98c886-5e93-4967-e40c-08de584fe6d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?K2FHSjlZRG9TWDV5NncweEV3VGZTcURHWThlZzNLMkEzdGg1T1F2aDNTSWdj?=
 =?utf-8?B?YTlnQnhranczYVFHZXpHdVlNdTZqQTRSUVhlN1VKUUxDQTZYbmI0UTlCeEc1?=
 =?utf-8?B?ZWFUQ0dub2toRzdnOGIvTTZwRDhWTFdzd2hlMEgrOW82aGRQRDZNcnV2WEMr?=
 =?utf-8?B?OFROV2I0R3ErdGxPVTZBOEI3MVlMR1ZxWkhvWlNOMmw0TDJ3ZWU5MG9DYkRp?=
 =?utf-8?B?cFdMcm41SnhQTkRDR0xsdUdzSlFmd1YydUlNbnlKQ04rNVMwQ3JucWJmcjFa?=
 =?utf-8?B?TjNVbGZlaGNCRzBud09nTWMrRmQzMktJdTdEOWtEc05mSFpjdWhBekFPbnRj?=
 =?utf-8?B?S2RjdHhyT3lVZVMvYkJDQmlNTVpoU3lNSkNhZjlzdG5USHN0c3lSRlZUd0dE?=
 =?utf-8?B?aElxMHlaSmg1WFkreWc4RHI1VjhGYWd0amFOdjNFNWVGaFZudnNvTVZGQTFu?=
 =?utf-8?B?bGZhWVZjVlBTbDhOVDBRZitVRlBUUFR5NUlyeXAzNC9EdHFsaFVlYWR2RFU0?=
 =?utf-8?B?anZXZ09TU1EwbTRWWFV5aXpkb2R2aGM4L3MvV2hialdPS2RQVVdDaytzbGpt?=
 =?utf-8?B?aWFHQ2wzWXNCZ3l5UWNQMFdKMElMZGV4enoxaW5ZOVV3QkZRcE5KanI2UlRu?=
 =?utf-8?B?MkRKeitsYmlaZkJiYU5ZWkxoR085cmpUd0RIZVRWSC9ZME5qUzMrME5teHB4?=
 =?utf-8?B?WmVka0ZCZGNuV0RDWGZ1MjIySnJpUWdGZDNpUUJrQTVIc1RmU0Q5RDdBRU1X?=
 =?utf-8?B?UnVaT2lwMnpHSmhTVG9lanhrZVkvTEc3eDZ6VkZralJ0RndLNWI2eVBPZHVU?=
 =?utf-8?B?ckZOUGJ0Wm9sTE9mR1pUdzZJOVYyeFVtSWZxNnRyVVVMVVk3N2IySk0wanY4?=
 =?utf-8?B?cXUxdDQ3ZE51Tk1VejV3RjR5TDA3UUJkdEljYk90WVZXVi9rZ2swR21uUFRM?=
 =?utf-8?B?RkY2RXBpSHhuOU91a3d1bC9XU0ZSN3lwcDRRSUFwMkxZdmhoS2Uzb3NzQXBB?=
 =?utf-8?B?blZSVmF2c2lvYUc3M3p0cUwrQWloWXowZHpTTyt2Szc2cUlJQ1dubkppcVlM?=
 =?utf-8?B?b0JmT3Q0U0pxRUozNEcveERFZkZKbDZUYzJsbFQzRnVGSlc5N09tQm5DdVpV?=
 =?utf-8?B?cmVYMmEwaEdSOXpDcGVOYmZnM2dkQ3N6SGV2c2tiZVBkenV0dVNQYi83dG9q?=
 =?utf-8?B?Mm1EV0Z3V25CbFlrY1IxUGV2bTVaSy9jOE5SR2NHZmxOSkNOdUx1Q2pGQ3ZY?=
 =?utf-8?B?b0hJTVVacVN1dVFqYkFXUzlzNHBWT1VTdWVFcldNWk5qMElKRUFvWldmUUxW?=
 =?utf-8?B?UmJHalNUemlPZEVsTDU0UEtIcTU0TENRcXYxdk5hWU90NXdpZnJXYUpEbWVw?=
 =?utf-8?B?R3JhSStpdmRuNEJUdzM1ODEzNzVYdGJrK2gxejlEUzVsUG5wdGJLekNVcm9H?=
 =?utf-8?B?S2NuTWVTVlcxV1FrYzlVNG5nSUUwTnZVYjY5ZGY2eEVhWHd1RlZxb1FGcUl6?=
 =?utf-8?B?ZGJxRHFSRmxHYjlsSFZKUDQ1L3pFTElTdkhsYyszeHl5Znl1RGVONm1DanJr?=
 =?utf-8?B?MERTd1VyMEVpV1F6MFd4Q1g3U3FkWTJUdmFGdGZ5L05TYVQyZk84R2Q2ZVZP?=
 =?utf-8?B?SFZnWWNHUTEvTEV6MktYQklFcW12c3VxMDdaRk02ZjMvdkpKQ0dKM054UnEz?=
 =?utf-8?B?cWFieTBKbDV3NDlUaEpLKzFqdHMxdTg5L05HcUxzNm5veTI0YVFXVzNWOUwv?=
 =?utf-8?B?RjAxdU9sOWRnVXlnMitxcGtRdVFJZjZFbkZ1cUFMdEpybDh0NkZNSnI0bm5n?=
 =?utf-8?B?clF3OWJYcloyYUQ3eE1CY29Xb3VlRVJBZlNreUNnNDRMbk1DcnFVcFNJbXR0?=
 =?utf-8?B?RWRCMUgrWElZQkhNQlA5dzVEM2ZOUEo1aDNNK0ZDeDg0VEdaUXNpNlNSZWox?=
 =?utf-8?B?aTByUkJhR1pNdzdYTkF1Z2dEdUk4S3Z6bFpja1FBeGptYjNFaE5ldDlWVWdV?=
 =?utf-8?B?RTFCNERWaTIwanRiTFIwRXp3enRsVnJaYnh2ei9MV0c5K0I5ZVJubWVzZEgr?=
 =?utf-8?B?U1VsSGZYVEFpK01mZHllc0lVVmVhK3VSa1FaSkxYQ1NiSkJmQ1ZIUWRDcWVB?=
 =?utf-8?B?S0xpbTFkZ3k1SXFKZ0QrRzRtWHlqWnF2bkw0UUNkdHRsY2pHeSt5Z28rTnZ1?=
 =?utf-8?Q?GoEVvV2HKEsDNYgDHiCuyas=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ui8wSGJMYUFGc2sxYmxzcVBaMFpSYVFaeHREN0JES2RGY3VSeWpiYzhUa3Mw?=
 =?utf-8?B?TjRXN1I4SXhUQ1ZtaTArb2pSNlBLVk1TN1F3OHUxZXU1QXRYaDRNVTNybGNR?=
 =?utf-8?B?TllYaE0wdHozN243bGt5eGpGaks1SmdhUGY5cTRldXk5aC9mdFBvRGhES3JM?=
 =?utf-8?B?MmRTY25kdFJLWlBEbXJDRjJOSlFOaEhXMVBGY0ZqN1laS052NnBuQzJKTVpI?=
 =?utf-8?B?dnJMaWphYXczQmt3UStTdXA5emJNRVVwc0VLa21mT0Z3SGVrMVUxanp3bjlD?=
 =?utf-8?B?R3YyUFJZZ0prb0d0WnlVWlN2WkRvczhkZTJ0akFWdm5QZzVKU015UTQzMkNp?=
 =?utf-8?B?UGFKamcvYmV3dU9kNEdGV0Evd3NNNmN5eHpxZjV5RG5hd2o2UTh1S2pkdlhV?=
 =?utf-8?B?cTIzL2t2OXp3TUlwZDhMa09YTjJIZ1p6SHpSenZ0QXJRcDJiN2VCY3d6aExk?=
 =?utf-8?B?ZWRIcm13RVpCdHp1cmluR280Rm9YOW5DNUg4U0hhekVucHFjamwyR0JQRENU?=
 =?utf-8?B?VFJPVkpTMzk1dDNSU3MzQlJLY0RwWE5PRE52aUs5aEswMFExUkVvZ3hqRmNm?=
 =?utf-8?B?N3RsYXYrWUtZYVZjMFptLzhXbkpobFlkSTRXLzNYelh0OWN0RVkyTmR5R1Jw?=
 =?utf-8?B?bjl2Z0JlUmtIK1JDZGxkdDJ2V2FuTDhJRk80dTgycGpjdmNMYVM0RUhEWllO?=
 =?utf-8?B?T0NiaWRXYW42NkFUQXJXYmZzSCsxOUtmN1FpbWFFVmxGUmx3U3h1ZmpHMTFI?=
 =?utf-8?B?Tk1YWHl5YmxZckRWUDZjY0U0MWkwQUJ1SDRUZHVGWHJYSWt3Q0MvR3hPbzg3?=
 =?utf-8?B?QVhyTGE3Zk0wZVZMWWhCeFFvSzByaVVlbVpaQUpLdXE3MWI4SmpIMkR5ZVpa?=
 =?utf-8?B?TUNjL1RDcHdYaGpMNkUxRzVudzMrYis4c1dIK3FxMW84bzV0cGxkSjhaRWFo?=
 =?utf-8?B?VFg4ZzRQNVRFOStZWTczVnU4dXhYS2ppcEdEVkxUdlZZZTRBTWhkeTNJRTVU?=
 =?utf-8?B?UmIwWlZLMHpKUzh6T0kxOUptSmFPNFAvRzBGRFV0dEk3dVB2RGQxNTlHdXBL?=
 =?utf-8?B?ekVPOXVNZmVmT0tna2hQOFd2cEFOUTMyOGZaUnJGQ2xONi9KYWlHMkRDM0pT?=
 =?utf-8?B?eFFISlFlSE9VbDZpRUtRYjBrRjR6QTdBM2p1cVpENDZRVmtWUTl4VDFUOGlQ?=
 =?utf-8?B?R1ZSclZ2bXp3UUFncW5rOXBENDlURFZyeXliVnJ0aTVvNTJmS2tTZWdlbnVV?=
 =?utf-8?B?V1BoMkxvUG9BcHVENlAvMHIyYzdQU3I4bEJCQXJQM2V3YzN6ZTRpRldsWVEr?=
 =?utf-8?B?TnlDaVVYOEVPRGczSEJvZVZVZldBbUdzWEl6STlabHQ2M2lvL1RQM2V6RFQ4?=
 =?utf-8?B?dlRrOXAxcW5DQmNobVRtU1lYU082dlcxSnRDMlNsMFNRKzVHNDJGSGZBQmN2?=
 =?utf-8?B?bmRlMUN6Y1JLWDdhR1k3VU5aZERGLzYvRTBGRHhoRDU5a0xHa2RDRmhoTzVi?=
 =?utf-8?B?Z3RNNEJDRGJiTDUySUdJU2Rwemtha3dCTlhvc01GUjQzK2s3Q3F6Z1hZdStB?=
 =?utf-8?B?dy9uNmk5Tlg0N0xvN2MrWU1CZUZOMDFNdVpoK3ZKYkVFM2JPTExoaDB1UWNM?=
 =?utf-8?B?Z2tQM0pldHY4MlM1by9xeURJaisrQTdQSnZ0Q2hJR09VUnA2RlZKekZkMyt1?=
 =?utf-8?B?K0FYc0YxSGJGWWI2Nmx2RkxaY2wvWHRpNW5aZmN4MVNpYmFPUis3VGd2eUpI?=
 =?utf-8?B?UjlUM2E5WlNDd2FRbkI3QUd0WDZwQXd1Zy9wM3ZVaVIzbkRjMjRpQmdaNVcx?=
 =?utf-8?B?bEZoaUtrdHFObnFZTkl6RWYvaWJpdmovQU5QZXBOczAxUHlzeFk0MGZzaDY1?=
 =?utf-8?B?Lyt3bzQybE5DTEZjMUFxRG52Ymd5MHNuWFRMN2NlRm5BS3grQUV5WmFjVUlR?=
 =?utf-8?B?a0VERzJkRml5M05zWnlDNUFMcW5SZWdjTEpMcGdNVnJzK3RRSE0zZHNlM1Fi?=
 =?utf-8?B?S0J0bWJNSlFNTi9rZDgzeUliV1huS2xsUTRiaEVxSHBMOEVqZXJNcHhCVi9n?=
 =?utf-8?B?NlArbUc4SlpoTFhSWGRaU3U5dTA2VEw4TGRJaFZ3VkgxNGkrVlVwejZDOVYz?=
 =?utf-8?B?QS8yM0pJRm9lZVlPZFovSnNtcWQ3N2FVeCtMMVFWbytWbnpDOXNXZzJvU0t1?=
 =?utf-8?B?eWtSMWw1S1FMaG9qYm9YaFFQU3BHNnpiNGVXcllodVpCZWQyaDd5OU4vb2R6?=
 =?utf-8?B?WWl5LzFXVThlVUtkTnhsa3Rob1VsaTlnS3VkWUZxcUtJSFFDRFZoa3ZaRmhm?=
 =?utf-8?B?NEl1RmxVNnR2L0Zqdkt3TFFRZ1MwOW52N0FJcGdqUnNMdlZRTlZJZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a98c886-5e93-4967-e40c-08de584fe6d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 18:15:33.0791 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 049cmguHs0uEz2GC4mZILR4ABM/JSAt/ThaUyOgTYAWqYPT8cyr1YBDU+71/m1fuV2IQMOOGVc9fORNMQrnR+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8829
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

T24gU2F0LCBKYW4gMTcsIDIwMjYgODo0MiBQTSBNYXR0aGV3IEJyb3N0IHdyb3RlOg0KPiBPbiBU
aHUsIEphbiAxNSwgMjAyNiBhdCAxMDoyOTozOFBNICswMDAwLCBTaHVpY2hlbmcgTGluIHdyb3Rl
Og0KPiA+IFRoaXMgY29tbWl0IHBlcmZvcm1zIGEgc2V0IG9mIHNtYWxsIGNsZWFudXBzIGluIHhl
X2xlZ2FjeV90ZXN0X21vZGUoKToNCj4gPiAxLiBSZW1vdmUgYSBkdXBsaWNhdGUgY29tbWVudCBm
b3IgQkFUQ0hfRFdfQ09VTlQuDQo+ID4gMi4gTW92ZSBMT05HX1NQSU4gY3R4X3RpY2tzIGluaXRp
YWxpemF0aW9uIHRvIGFmdGVyIHRoZSBmZCBpcyBvcGVuZWQuDQo+ID4gMy4gQWRkIGFuIGFzc2Vy
dGlvbiBmb3IgQ0xPU0VfRkQgdG8gcHJldmVudCBmZCBsZWFrcy4NCj4gPiA0LiBVbm1hcCBkYXRh
IGJlZm9yZSByZXR1cm5pbmcgdG8gYXZvaWQgYSBWTSBsZWFrLg0KPiA+IDUuIEFzIGkgc3RhcnQg
ZnJvbSBuX2V4ZWNzLCB3aGljaCBhbHdheXMgd2lsbCBiZSBub24temVybywgYmFzZV9hZGRyIGFs
d2F5cw0KPiA+ICAgIHdpbGwgYmUgYXNzZ2luZWQgd2l0aCBhZGRyLg0KPiA+DQo+ID4gRXhjZXB0
IGZvciBpdGVtIDQsIHRoZXNlIGNoYW5nZXMgc2hvdWxkIGhhdmUgbm8gZnVuY3Rpb25hbCBpbXBh
Y3QuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTaHVpY2hlbmcgTGluIDxzaHVpY2hlbmcubGlu
QGludGVsLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgdGhlIGNsZWFudXAuIEEgYmV0dGVyIGNsZWFu
dXAgd291bGQgYmUgdG8gbW92ZSB0aGlzIGxvZ2ljIGJhY2sgaW50bw0KPiB4ZV9leGVjX3Jlc2V0
LmMgYW5kIG1vdmUgYW55IHRlc3RzIHRoYXQgdXNlIHRoaXMgbG9naWMgdG8gdGhhdCB0ZXN0LiBJ
IG9yaWdpbmFsbHkNCj4gd3JvdGUgdGhpcyBsb2dpYyBpbiB4ZV9leGVjX3Jlc2V0LmMsIGFuZCBp
dCBsYXRlciBnb3QgbW92ZWQgd2l0aCBhbiBhY2sgZnJvbSBtZQ0KPiDigJQgYnV0IGl0IG1ha2Vz
IGFic29sdXRlbHkgbm8gc2Vuc2UgZm9yIGl0IHRvIGxpdmUgaW4gc29tZSBoZWxwZXIgbGlicmFy
eSwNCj4gZXNwZWNpYWxseSBzaW5jZSBmbGFncyBuZWVkIHRvIGJlIGR1cGxpY2F0ZWQgYWNyb3Nz
IGJvdGggdGhlIHRlc3RzIGFuZCB0aGlzIHNvDQo+IGNhbGxlZCBsaWJyYXJ5IGNvZGUuIEl0IGFs
c28gbWFrZXMgaXQgaGFyZGVyIHRvIG1vZGlmeSBhbnkgdGVzdHMgYmVjYXVzZSB5b3UNCj4gbm93
IGhhdmUgdG8gb3BlbiB0d28gZmlsZXMsIG1vZGlmeWluZyBib3RoLg0KDQpUaGlzIGZ1bmN0aW9u
IGlzIHVzZWQgYm90aCBpbiB4ZV9leGVjX3Jlc2V0LmMgYW5kIHhlX2V4ZWNfY2FwdHVyZS5jLg0K
U28sIGl0IHNlZW1zIGl0IGhhdmUgdG8gYmUgaW4gdGhlIGxpYiBmb2xkZXIgdG8gc2hhcmUgdGhl
IGNvZGUuDQpXaGF0IGlzIHlvdXIgaWRlYSBhYm91dCBpdD8NClRoYW5rcy4NCg0KU2h1aWNoZW5n
DQoNCj4gDQo+IEkga25vdyB0aGlzIGlzbuKAmXQgeW91ciBwcm9ibGVtOyBnaXQgYmxhbWUgd2ls
bCBwcm9iYWJseSB0ZWxsIG1lIHdobyB0byByZWVtDQo+IGhlcmUgLSBJIGhvcGUgdGhleSBhcmUg
bGlzdGVuaW5nLg0KPiANCj4gTWF0dA0KPiANCj4gPiAtLS0NCj4gPiAgbGliL3hlL3hlX2xlZ2Fj
eS5jIHwgMTYgKysrKysrKysrLS0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2xpYi94ZS94ZV9s
ZWdhY3kuYyBiL2xpYi94ZS94ZV9sZWdhY3kuYyBpbmRleA0KPiA+IDA4NDQ0NTMwNS4uZGNkN2Uy
MDc1IDEwMDY0NA0KPiA+IC0tLSBhL2xpYi94ZS94ZV9sZWdhY3kuYw0KPiA+ICsrKyBiL2xpYi94
ZS94ZV9sZWdhY3kuYw0KPiA+IEBAIC0yMiw3ICsyMiw2IEBADQo+ID4gICNkZWZpbmUgQ0FUX0VS
Uk9SCQkJKDB4MSA8PCA1KQ0KPiA+ICAjZGVmaW5lIENMT1NFX0VYRUNfUVVFVUVTCQkoMHgxIDw8
IDIpDQo+ID4gICNkZWZpbmUgQ0xPU0VfRkQJCQkoMHgxIDw8IDEpDQo+ID4gLS8qIEJhdGNoIGJ1
ZmZlciBlbGVtZW50IGNvdW50LCBpbiBudW1iZXIgb2YgZHdvcmRzKHUzMikgKi8NCj4gPiAgI2Rl
ZmluZSBHVF9SRVNFVAkJCSgweDEgPDwgMCkNCj4gPiAgI2RlZmluZSBNQVhfTl9FWEVDUVVFVUVT
CQkxNg0KPiA+DQo+ID4gQEAgLTY1LDkgKzY0LDYgQEAgeGVfbGVnYWN5X3Rlc3RfbW9kZShpbnQg
ZmQsIHN0cnVjdA0KPiBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2ksDQo+ID4gIAl9
ICpkYXRhOw0KPiA+ICAJc3RydWN0IHhlX3NwaW5fb3B0cyBzcGluX29wdHMgPSB7DQo+ID4gIAkJ
LnByZWVtcHQgPSBmbGFncyAmIFBSRUVNUFQsDQo+ID4gLSNkZWZpbmUgVEhSRUVfU0VDCSgzICog
MTAwMDAwMDAwMHVsbCkNCj4gPiAtCQkuY3R4X3RpY2tzID0gZmxhZ3MgJiBMT05HX1NQSU4gPw0K
PiA+IC0JCQl4ZV9zcGluX25zZWNfdG9fdGlja3MoZmQsIDAsIFRIUkVFX1NFQykgOiAwLA0KPiA+
ICAJfTsNCj4gPiAgCWludCBpLCBiOw0KPiA+ICAJaW50IGV4dHJhX2V4ZWNzID0gKGZsYWdzICYg
TE9OR19TUElOX1JFVVNFX1FVRVVFKSA/DQo+IG5fZXhlY19xdWV1ZXMgOg0KPiA+IDA7IEBAIC03
Nyw4ICs3MywxNCBAQCB4ZV9sZWdhY3lfdGVzdF9tb2RlKGludCBmZCwgc3RydWN0DQo+IGRybV94
ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVjaSwNCj4gPiAgCWlmIChmbGFncyAmIENPTVBSRVNT
SU9OKQ0KPiA+ICAJCWlndF9yZXF1aXJlKGludGVsX2dlbihpbnRlbF9nZXRfZHJtX2RldmlkKGZk
KSkgPj0gMjApOw0KPiA+DQo+ID4gLQlpZiAoZmxhZ3MgJiBDTE9TRV9GRCkNCj4gPiArCWlmIChm
bGFncyAmIENMT1NFX0ZEKSB7DQo+ID4gKwkJaWd0X2Fzc2VydF9lcShmZCwgLTEpOw0KPiA+ICAJ
CWZkID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9YRSk7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsj
ZGVmaW5lIFRIUkVFX1NFQwkoMyAqIDEwMDAwMDAwMDB1bGwpDQo+ID4gKwlpZiAoZmxhZ3MgJiBM
T05HX1NQSU4pDQo+ID4gKwkJc3Bpbl9vcHRzLmN0eF90aWNrcyA9IHhlX3NwaW5fbnNlY190b190
aWNrcyhmZCwgMCwNCj4gVEhSRUVfU0VDKTsNCj4gPg0KPiA+ICAJdm0gPSB4ZV92bV9jcmVhdGUo
ZmQsIDAsIDApOw0KPiA+ICAJYm9fc2l6ZSA9IHNpemVvZigqZGF0YSkgKiAobl9leGVjcyArIGV4
dHJhX2V4ZWNzKTsgQEAgLTE3NSw2ICsxNzcsNw0KPiA+IEBAIHhlX2xlZ2FjeV90ZXN0X21vZGUo
aW50IGZkLCBzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqZWNpLA0KPiA+ICAJ
CQlmb3IgKGkgPSAwOyBpIDwgbl9leGVjX3F1ZXVlczsgaSsrKQ0KPiA+ICAJCQkJeGVfZXhlY19x
dWV1ZV9kZXN0cm95KGZkLCBleGVjX3F1ZXVlc1tpXSk7DQo+ID4gIAkJfQ0KPiA+ICsJCW11bm1h
cChkYXRhLCBib19zaXplKTsNCj4gPiAgCQlkcm1fY2xvc2VfZHJpdmVyKGZkKTsNCj4gPiAgCQkv
KiBGSVhNRTogd2FpdCBmb3IgaWRsZSAqLw0KPiA+ICAJCXVzbGVlcCgxNTAwMDApOw0KPiA+IEBA
IC0xODcsOCArMTkwLDcgQEAgeGVfbGVnYWN5X3Rlc3RfbW9kZShpbnQgZmQsIHN0cnVjdA0KPiBk
cm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2ksDQo+ID4gIAlpZ3RfYXNzZXJ0KHN5bmNv
Ympfd2FpdChmZCwgJnN5bmNbMF0uaGFuZGxlLCAxLCBJTlQ2NF9NQVgsIDAsDQo+ID4gTlVMTCkp
Ow0KPiA+DQo+ID4gIAlmb3IgKGkgPSBuX2V4ZWNzOyBpIDwgbl9leGVjcyArIGV4dHJhX2V4ZWNz
OyBpKyspIHsNCj4gPiAtCQl1NjQgYmFzZV9hZGRyID0gKCF1c2VfY2FwdHVyZV9tb2RlICYmIChm
bGFncyAmDQo+IENBVF9FUlJPUikgJiYgIWkpDQo+ID4gLQkJCT8gKGFkZHIgKyBib19zaXplICog
MTI4KSA6IGFkZHI7DQo+ID4gKwkJdTY0IGJhc2VfYWRkciA9IGFkZHI7DQo+ID4gIAkJdTY0IGJh
dGNoX29mZnNldCA9IChjaGFyICopJmRhdGFbaV0uYmF0Y2ggLSAoY2hhciAqKWRhdGE7DQo+ID4g
IAkJdTY0IGJhdGNoX2FkZHIgPSBiYXNlX2FkZHIgKyBiYXRjaF9vZmZzZXQ7DQo+ID4gIAkJdTY0
IHNkaV9vZmZzZXQgPSAoY2hhciAqKSZkYXRhW2ldLmRhdGEgLSAoY2hhciAqKWRhdGE7DQo+ID4g
LS0NCj4gPiAyLjM0LjENCj4gPg0K
