Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB52CA0EE6
	for <igt-dev@archiver.kernel.org>; Tue, 19 Aug 2025 06:05:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B74610E103;
	Tue, 19 Aug 2025 06:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="elSXZfhc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8435310E103
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Aug 2025 06:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755583510; x=1787119510;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ldPRCgLGwUtilXr6TI0u+kgNnlEixFHSqn/XMBAwtlA=;
 b=elSXZfhcZePFxDMrxlBUONTJVIS3vlijz6p+eRWt1kWp7yk9Isyjayrq
 4Irx29jy6SD+1fXsQkwuyMx3G6aFMkF86o8CMYFLMvaJNW1VZmJy7G07Z
 cfpW4jIQ9kzvKAFCyIzqMExJqHLhJevQBqckTupukYQrVoQ9ur1Y3NmHY
 rITx7Hms9aPHfcMm5xX7iAMeqEbb8/AModzbIXMMOcF/Q3erP2/RjOBwZ
 Qpd+2M6FEY6gvZ1Yssa7BEeKXYnvtsGQ4kanHnwpTPtQ+0Vjag1UlvLZ0
 0xrMw8Zkp+REzu9xquBouZlph1UAaW7Ux0zS/pLLvmDCEgN9UQb2DM79l A==;
X-CSE-ConnectionGUID: PvDllU50S+uDRdDEKxuq9g==
X-CSE-MsgGUID: 0ONVmfApSGajuFupttGGhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="68526455"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="68526455"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 23:05:09 -0700
X-CSE-ConnectionGUID: FDVOF0+UT3ODptwuOzvFTQ==
X-CSE-MsgGUID: sPG8TCeqSmqGGQWLaeHYmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="173112910"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 23:05:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 23:05:08 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 18 Aug 2025 23:05:08 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.80) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 23:05:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVKhU9hXCcaRChdZFtaWF31ECjnUTG75DlKlLgizQBUInZ6udrEDvoId1xjPdr0y2z9qD/tUvJjg+ixfbuZBGwhWIQ/UKvahmW01nv1wxT7pzwYgWRfSNQyKwzCjNnM4zUicnGHn8d7iYNubhp1/KzSJwDFX3NXBDAoL4P7rtBuQfqfof/SBLrjn60EWNj2KveoJ+CpHSVsA/yK72kB6ByawTms48M1LnsdRVQRpWpHFjFfUUknJWI7KEKZEbXb36qQPi5PBM7D+RKNDw5ZZTnNV+m2HeBt90Ybde4KLujSv0qBS/6kS3c/SYG3mpVHi/HhDKtDxjHUlEifcoLVP+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ldPRCgLGwUtilXr6TI0u+kgNnlEixFHSqn/XMBAwtlA=;
 b=aFPrdhOTcbYoCN982ww1WhSvlfK6JtJNIu/+IapOO1r6x8iwWCds0SAkpPWeTD4quYr02nv+cHnHfgXieZI1bEYXwC+lOlexzQX1srobg0bRNlPXf+oNaYJBe1ap4XzMBEYrSNsBINQCgD75BRcwg2H7ziUPgMXJPhOICuY99mTtr/vIYSMusMAvBNx8Qvd1Cot57edkGcQN7ojtJ84Pc4MnLdV33Xpw5KafKC5/M9cxmFlyLZIf9sEW2MA85Kotn42RP0p7pPmM8RCI83+90SqcenOCfUNgwlZO/eA499UIiOn5nlx2STjqzPKIQ/WRbVwj1dwv3Eeu095XbyDl4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by PH7PR11MB7451.namprd11.prod.outlook.com (2603:10b6:510:27b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 06:04:59 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%5]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 06:04:59 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Dugast, Francois" <francois.dugast@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/intel/xe_vm: Add bind-array-flag-invalid
 subtest
Thread-Topic: [PATCH i-g-t 1/2] tests/intel/xe_vm: Add bind-array-flag-invalid
 subtest
Thread-Index: AQHcC4lcPrloqlf840Cs1VzrmdwZ27Rf9OvQgABPLICACUMUsA==
Date: Tue, 19 Aug 2025 06:04:59 +0000
Message-ID: <CH3PR11MB84343672C2A6685A9B42F7A58D30A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250812130142.37988-1-christoph.manszewski@intel.com>
 <20250812130142.37988-2-christoph.manszewski@intel.com>
 <CH3PR11MB8434AAE76F6D92CDA09C1E528D2AA@CH3PR11MB8434.namprd11.prod.outlook.com>
 <993eed9c-c84d-47c2-9bca-8d30839750ea@intel.com>
In-Reply-To: <993eed9c-c84d-47c2-9bca-8d30839750ea@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|PH7PR11MB7451:EE_
x-ms-office365-filtering-correlation-id: b4d8bdb5-2293-445a-4c38-08dddee6546a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?VVludTgxR3FiekVWSExxRmxwanU4MTBDQWhrUFBiS0xZZld0bjVKUmE2dEd2?=
 =?utf-8?B?dEMzVlIxWTA4Mi9ibys3d2Y4SWUzRmFSV3QwME1OWEU2aWs2NWJqcmQzK01P?=
 =?utf-8?B?L3Vkd2lJakZCSzRQZUExYXBhdlM5R2pxdmROTkdZYWhnaUE5RUt5VW9Wc0Jt?=
 =?utf-8?B?TWdTRmVpRTVJNkpiMmVZcG5BM0hIeHFwdWJtUi9ucko2U1JSallqS0g1aktw?=
 =?utf-8?B?NFQ5VnBQWFRtZHFNRlpnMW50WmVPVThoSmdNR3RJdkFBcGRycXBTQiswS2Y2?=
 =?utf-8?B?Ry9IOUNTQVR4RFlBS0xQd2duRDFFM0M3dDgxN1luQjk3RHpaay9CSytjcStk?=
 =?utf-8?B?M3h6enBCWDFTNkpVUi85aUw0LzFjNEpxazk4NkoxVXJicGZXcGhSYUJua0l5?=
 =?utf-8?B?dHFyTCtXWjVzQUtvandsdTZxZDRCUEU4Qk9EKytmclAyZys4OXhLWUFDK2Rh?=
 =?utf-8?B?U3lkL1pRRzdEQ2s5eU5SZVd6VmdqWXl1SUIvbmZGYWl5UGMzU0lMSEN3RlUw?=
 =?utf-8?B?c0dvc2NqZlltN3VReHZSL1ViWjNQcE9jdjlXYlQyeTl3T3JLOUlzNWRFbFFS?=
 =?utf-8?B?SS9aWGFna0Q1eEpXMHZKakN0L2thWTVUMWEyeitWb0sxeHJwQVRoRVo4THhC?=
 =?utf-8?B?eTNZR3g3M0NPeWhQSVNCeDJ6a1BGUlMva29yZHBwUnNKNDgxTUdUWXByV2Nr?=
 =?utf-8?B?eTlhYTF5WkJFaDFaaFNQUnNUV2EwNXJHNEkydmsyOE9JWXU2TkorSE9BS3RC?=
 =?utf-8?B?QURlVG01VlBHYjdFdU1GeXhhQmFGTHM2b0U1SUI5ZGRGYmNOS01ZdXVDQWF4?=
 =?utf-8?B?Y3pMeC9FZWxGY1orLzNsYnRmMEVKWm9kMzFsdkVPbGFRY1ltM1ZhMXF0VWc4?=
 =?utf-8?B?WkQyaWY4TEpuV25LRkhPbVBkT0R0U0p4ZHIvNWt5YmpXNzlsTThaYjdOK2pO?=
 =?utf-8?B?S2ZKVTFkVSt3YWpRQzdSeDg1MDFET0FpeU0zUnlvdW9DOHJFZXpFMDM1Rkxk?=
 =?utf-8?B?Nk11eTY1NUhXaE0xSzR4VHh1TXh0bWhlQUZwVmtuSTlrOUdxdExoZEhTRDR1?=
 =?utf-8?B?ZTJlMHRFQkNGTHQvaGVwZy9yYUN2QTl3SVVRaTEwM2hoanBWSjQrMmVlMGxx?=
 =?utf-8?B?bFRrOTljZ3FwZFJhSGxEM2ZuRXV6ZTduQ21SYmFHYW9QdldXYnlmcDhZcHZ1?=
 =?utf-8?B?Z1k5M21EN1FVK282YVdIT0k3aWpybVNINFliMnRUZzdUQThqVXlDbFROSTln?=
 =?utf-8?B?S2s1Z2w3UkJBcVRabUcreHNXWjJrczNXUjZUVXhqWDU4VUJqNzhySUF4WlZJ?=
 =?utf-8?B?eTd5MUNISlVqc3lPd3lscWpFYlQzUXdXczlvNTl1VUtSMDZadU5hNlNuMVJz?=
 =?utf-8?B?WnFKOEY0MHkxTmJnYjErSEFySWozN1ZnN0NKNTIwaHVLUW9rWHdIZ09PSDA2?=
 =?utf-8?B?UTJpcWlaNjJvWjlpUFk5Nlg1SXAyK2ozZDRkNUJLWHhWb2RlRzV0TEtRSi9J?=
 =?utf-8?B?WW55cXNsUGN3MHp3aDdNQmJ0K3VqcCt6SVp2bHlOclJ3VWdSZDI0NlA5SXBm?=
 =?utf-8?B?LzhxenQrMFpzdnl5MVFQRFhQRFhCc1lRUDNKenpGVUVPMWRCUnJwb09xZjA5?=
 =?utf-8?B?ckE0bG0zU3U5N20xVXZvck1Wbmpwb21SUmxLNFZnclBXczV5bDNjM2FHc0dG?=
 =?utf-8?B?OGFRYWVKQkZqUjJLOG1BSkZXZUFWbit6NDUvenlKRDh1eFFlZUtkQkxmeVd2?=
 =?utf-8?B?dG9JdUVMRFlpb2F1MUgyQTBLeDhKbkk2QU8yUHhDUXR0dmdnRDNRNEJxbStk?=
 =?utf-8?B?dTlXSUtvY3g1Z0t6bXdVS1hURUErN2Z1NlU0MFhKRi9ad0xPUGRDYjFtelZ5?=
 =?utf-8?B?WGQrNU1yMUlxQktVVFpNOGp3YVJTUlNwZllpbllGejJIa1hyeVAyQWNsTFFK?=
 =?utf-8?Q?RWeNIWXH/zc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0dIbTVIazBCZHI4OUZpNjJQc3BHR0QzOC9yZUtmNHhZdWRCYjA1S0d0eXlo?=
 =?utf-8?B?dVo2T05tZHJMV1ZVK2FsVDY0VEVtb2EvOS92VU5zQVRZektmVVBOemFvU1Nq?=
 =?utf-8?B?YkYrZEE2RFY3Y2VnbGpEdE8waTlqbWZ6V0lCYitxL3lISHZuZzQyRk1od2Zk?=
 =?utf-8?B?Nkg3WWs4ZWdsNFRXdDhwTERmUTE2OVdBeUZDYTc2ckNzdmphdG5jbU9Ma21M?=
 =?utf-8?B?ZEt6K0MxYy9ZbGVhREIxZmo4bzJNSzh4NEhmL2RhbFoyOUExVnlnanAxbkZn?=
 =?utf-8?B?dURHOWVzcnI3eVJXNG9UZ08yc3A3WkZUZnNNZXBkQUlac2ZqaTBCSDU2MWVW?=
 =?utf-8?B?NGRpbDhkVWVwN2ZGN09DdCt3NWJwMy9KQjljMlN0UDNQZTlxSFFvUDRjUFNQ?=
 =?utf-8?B?Ly9FMVBzQi9JbkFBU3RWQ1BVYjBRdldHNy9jNkZYeVZzTkRyT3lHVmRLT0V3?=
 =?utf-8?B?NkJIR01HQVdVQitIS2Zxby84VEQzYjFhYi9RTzhpMGd4WFFMcUIwUmtGaVdm?=
 =?utf-8?B?WXBwOVpZSkhtbC8xNHRGSytaKzBvTlladmZDMlFJcFlKT29CbVhwUVg3aUdz?=
 =?utf-8?B?WC9ORit1UCtyOHkwUmJOTFp0bUMyTFFIcWxDUDE0TktyVFJ4bGFCOWRVUm5M?=
 =?utf-8?B?SjZ3TUszOVJiRk9qd3hCMU50aEk1K0pDZUlyNm5wVzBwOEM3UlNuQkppUEFi?=
 =?utf-8?B?aTg0cE80QXlTQndTeVR3ZTA3MlcwelYrOFEyeHZkRG9DbEVvNG9OMUVsbnRw?=
 =?utf-8?B?RzhpMEN0cGhudzF6ejErQVJtako4dWpLWk8zUHY1UTFXY2pRV0xqME8xTHQw?=
 =?utf-8?B?NnRkaDByeVRXTUFmc0dQT1BFODRWZjhuekR2c2hFdzFjd2tsZFNPd2hFRnNR?=
 =?utf-8?B?TXVuMURaOWN2T3lreXdHSVdISEw5YzhRMHZWOVFDMXc5STFDV3MveWhocXY3?=
 =?utf-8?B?clUxSzhDNHhKSnpYeDFzUGovS295NkxIV0tEbnkyZSs5MURObytxMWZEVGcz?=
 =?utf-8?B?YUNqQVBkQnU4S1c1STc2UDBEVm91Q25BYWxmM00xb0VtakF0dEtON21tQ2x1?=
 =?utf-8?B?OHF1V0psckRGeWhIUUNJd01LbTRITkx1aWtaejVaUVJNdG1YMVpvU2VDQ0Zi?=
 =?utf-8?B?RGY3RHFoekcrUTRrT1Q1TUtZYkJ5QlBVVDhvVXFiaE05OFd3aFpYR0VNZ3lM?=
 =?utf-8?B?SGRlcGZkbkx4UWxsRUZ3OFg4WnlzNzFQY3E3WWhZamZWTXhXNjI3UUI5cDZk?=
 =?utf-8?B?NUlCM29jVTF6bUgxUVV5eUg2NE9MS2ZZVWZIVnQ5SDQvdUJ3ODZHbUhTQXBm?=
 =?utf-8?B?em9VRUg2VFNCUkxGUmxxcnQ4a2NMeFoxS1Z0bmxlR2ZYdUJqV3l0MHFNMUdD?=
 =?utf-8?B?U0diV2QramFwMXRQdlQ3Yk05bjZqZDFRN1N2RnRLQlRNNlJpRGFWb3VNb3FN?=
 =?utf-8?B?ODV1VmZjb3VzWVBDYmJBYTBNYy9aNnloaVVreXhNbjVLRFZqSUtYTlBoSWU0?=
 =?utf-8?B?WEVmTjdZZ0dUQWZ2MCtteEV2TFE4dlc4RVNTekZqRW1LL0JPMGVNQWlCS3lp?=
 =?utf-8?B?Ym95bVBxMzJyQjRwY3RuNkRVcnY4VGJYZ3BUN3BSL2VyZHBITU5DdWpJcW9H?=
 =?utf-8?B?ZnVuYTNzbHQ2SXJySDNwSnphOWwybTBONjJmeVJjcHhaNlFoenVybXpJV1Rz?=
 =?utf-8?B?QnU3Y0NLUTRydHl5OEVJU3U3U216eDZJT0Z4ZnN2UmlOTk9tQ1ZRUUtXTXNI?=
 =?utf-8?B?MWU3dHFITVFqZW1yNUh1enlBUEx3b0c5eWFOMmN6TW14VjkvMEdQWmRvM2tj?=
 =?utf-8?B?bG43ZVVBaWtCR2orMlo5cGluajZOelNUMU4yL2RZa3lCQzBMREhXaCtGN1Ir?=
 =?utf-8?B?QjR2ZWUwME14S080Ny9wbE42UFQvT1YzQjdwY3dIRGNoN2xMZENPYUt6emNH?=
 =?utf-8?B?QlpwaDBIc01GNkRBMG9oMnpJY2JwV1ZIR3VrMy9EeVZXdlVhK2MvWEh5ZUVM?=
 =?utf-8?B?L1dLYlQzVG1xd1dnTGxHcis3a0FLaG1DdWJHVkpOU05UREV1QnIzRjZNYzJy?=
 =?utf-8?B?L2JkSDdzV0JIc2ZGVnNXZlo2RERia21nV0ZEQ2RmbkJLcGtCMFA4MjZDQnVy?=
 =?utf-8?B?ZkF5NWx6bm11TEZHejJzYkc5bUdqU2Qyc0pocXFDM1pFcXdWWmJ5cTdjNUs2?=
 =?utf-8?B?Zmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4d8bdb5-2293-445a-4c38-08dddee6546a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2025 06:04:59.5987 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YLHCytXWPIoSxA2yD8sYM2Wx+uHrWuKeoFVQEmCxA/QUdfvSN91o0XE36o3LIJpYY5d6iQlLISzmKo5D4bWD29CfAL6HtLhmjOATtY6kTq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7451
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFuc3pld3NraSwgQ2hy
aXN0b3BoIDxjaHJpc3RvcGgubWFuc3pld3NraUBpbnRlbC5jb20+DQo+IFNlbnQ6IDEzIEF1Z3Vz
dCAyMDI1IDAyOjA4IFBNDQo+IFRvOiBEYW5kYW11ZGksIFByaXlhbmthIDxwcml5YW5rYS5kYW5k
YW11ZGlAaW50ZWwuY29tPjsgaWd0LQ0KPiBkZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENj
OiBEdWdhc3QsIEZyYW5jb2lzIDxmcmFuY29pcy5kdWdhc3RAaW50ZWwuY29tPjsgQnJvc3QsIE1h
dHRoZXcNCj4gPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IGktZy10IDEvMl0gdGVzdHMvaW50ZWwveGVfdm06IEFkZCBiaW5kLWFycmF5LWZsYWctaW52YWxp
ZA0KPiBzdWJ0ZXN0DQo+IA0KPiBIaSBQcml5YW5rYSwNCj4gDQo+IE9uIDEzLjA4LjIwMjUgMDU6
NTcsIERhbmRhbXVkaSwgUHJpeWFua2Egd3JvdGU6DQo+ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJvdW5jZXNAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gPj4gQ2hyaXN0b3BoIE1hbnN6ZXdz
a2kNCj4gPj4gU2VudDogMTIgQXVndXN0IDIwMjUgMDY6MzIgUE0NCj4gPj4gVG86IGlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4+IENjOiBEdWdhc3QsIEZyYW5jb2lzIDxmcmFuY29p
cy5kdWdhc3RAaW50ZWwuY29tPjsgQnJvc3QsIE1hdHRoZXcNCj4gPj4gPG1hdHRoZXcuYnJvc3RA
aW50ZWwuY29tPjsgTWFuc3pld3NraSwgQ2hyaXN0b3BoDQo+ID4+IDxjaHJpc3RvcGgubWFuc3pl
d3NraUBpbnRlbC5jb20+DQo+ID4+IFN1YmplY3Q6IFtQQVRDSCBpLWctdCAxLzJdIHRlc3RzL2lu
dGVsL3hlX3ZtOiBBZGQNCj4gPj4gYmluZC1hcnJheS1mbGFnLWludmFsaWQgc3VidGVzdA0KPiA+
Pg0KPiA+PiBBZGQgYSBjb21wbGVtZW50YXJ5IHN1YnRlc3QgdG8gJ2JpbmQtZmxhZy1pbnZhbGlk
JyB3aGljaCBjaGVja3MNCj4gPj4gdm1fYmluZCBpb2N0bCBiZWhhdmlvciB3aGVuIHByb3ZpZGVk
IGEgaW52YWxpZCBmbGFnIHZhbHVlIHdoZW4NCj4gPj4gc3VibWl0dGluZyBhbiBhcnJheSBvZiBi
aW5kIG9wZXJhdGlvbnMuDQo+ID4+DQo+ID4+IENjOiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJy
b3N0QGludGVsLmNvbT4NCj4gPj4gQ2M6IEZyYW5jb2lzIER1Z2FzdCA8ZnJhbmNvaXMuZHVnYXN0
QGludGVsLmNvbT4NCj4gPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIE1hbnN6ZXdza2kgPGNo
cmlzdG9waC5tYW5zemV3c2tpQGludGVsLmNvbT4NCj4gPj4gLS0tDQo+ID4+ICAgdGVzdHMvaW50
ZWwveGVfdm0uYyB8IDkwDQo+ID4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKw0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCA5MCBpbnNlcnRpb25zKCspDQo+ID4+
DQo+ID4+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV92bS5jIGIvdGVzdHMvaW50ZWwveGVf
dm0uYyBpbmRleA0KPiA+PiAzY2U1NDA1M2MuLjIzNjQ5NDQwNyAxMDA2NDQNCj4gPj4gLS0tIGEv
dGVzdHMvaW50ZWwveGVfdm0uYw0KPiA+PiArKysgYi90ZXN0cy9pbnRlbC94ZV92bS5jDQo+ID4+
IEBAIC0yMjcxLDYgKzIyNzEsOTMgQEAgc3RhdGljIHZvaWQgYmluZF9mbGFnX2ludmFsaWQoaW50
IGZkKQ0KPiA+PiAgIAl4ZV92bV9kZXN0cm95KGZkLCB2bSk7DQo+ID4+ICAgfQ0KPiA+Pg0KPiA+
PiArc3RhdGljIHZvaWQgX19iaW5kX2ZsYWdfdmFsaWQoaW50IGZkLCB1aW50MzJfdCBibywgc3Ry
dWN0DQo+ID4+ICtkcm1feGVfdm1fYmluZA0KPiA+PiBiaW5kLA0KPiA+PiArCQkJICAgICAgc3Ry
dWN0IGRybV94ZV92bV9iaW5kX29wICpiaW5kX29wcywgaW50DQo+ID4+IG51bV9iaW5kcykgew0K
PiA+PiArCXN0cnVjdCBkcm1feGVfc3luYyAqc3luYyA9IGZyb21fdXNlcl9wb2ludGVyKGJpbmQu
c3luY3MpOw0KPiA+PiArCXVuc2lnbmVkIGludCB2YWxpZF9mbGFnc1tdID0gew0KPiA+PiArCQkw
LA0KPiA+PiArCQlEUk1fWEVfVk1fQklORF9GTEFHX1JFQURPTkxZLA0KPiA+PiArCQlEUk1fWEVf
Vk1fQklORF9GTEFHX0lNTUVESUFURSwNCj4gPj4gKwkJRFJNX1hFX1ZNX0JJTkRfRkxBR19OVUxM
LA0KPiA+PiArCQlEUk1fWEVfVk1fQklORF9GTEFHX0RVTVBBQkxFLA0KPiA+PiArCQlEUk1fWEVf
Vk1fQklORF9GTEFHX0NIRUNLX1BYUCwNCj4gPj4gKwl9Ow0KPiA+PiArDQo+ID4+ICsJZm9yIChp
bnQgaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHZhbGlkX2ZsYWdzKTsgaSsrKSB7DQo+ID4+ICsJCWlm
ICghcHhwX2ludGVyZmFjZV9zdXBwb3J0ZWQoZmQpICYmIHZhbGlkX2ZsYWdzW2ldID09DQo+ID4+
IERSTV9YRV9WTV9CSU5EX0ZMQUdfQ0hFQ0tfUFhQKQ0KPiA+PiArCQkJY29udGludWU7DQo+ID4+
ICsNCj4gPj4gKwkJZm9yIChpbnQgaiA9IDA7IGogPCBudW1fYmluZHM7IGorKykgew0KPiA+PiAr
CQkJYmluZF9vcHNbal0uZmxhZ3MgPSB2YWxpZF9mbGFnc1tpXTsNCj4gPj4gKwkJCWJpbmRfb3Bz
W2pdLm9iaiA9IHZhbGlkX2ZsYWdzW2ldID09DQo+ID4+IERSTV9YRV9WTV9CSU5EX0ZMQUdfTlVM
TCA/IDAgOiBibzsNCj4gPj4gKwkJfQ0KPiA+PiArDQo+ID4+ICsJCWlndF9pb2N0bChmZCwgRFJN
X0lPQ1RMX1hFX1ZNX0JJTkQsICZiaW5kKTsNCj4gPj4gKwkJaWd0X2Fzc2VydChzeW5jb2JqX3dh
aXQoZmQsICZzeW5jWzBdLmhhbmRsZSwgMSwgSU5UNjRfTUFYLCAwLA0KPiA+PiBOVUxMKSk7DQo+
ID4+ICsJCXN5bmNvYmpfcmVzZXQoZmQsICZzeW5jWzBdLmhhbmRsZSwgMSk7DQo+ID4+ICsJfQ0K
PiA+PiArfQ0KPiA+PiArDQo+ID4+ICsvKioNCj4gPj4gKyAqIFNVQlRFU1Q6IGJpbmQtYXJyYXkt
ZmxhZy1pbnZhbGlkDQo+ID4+ICsgKiBGdW5jdGlvbmFsaXR5OiBiaW5kDQo+ID4+ICsgKiBEZXNj
cmlwdGlvbjogRW5zdXJlIGludmFsaWQgYmluZCBmbGFncyBhcmUgcmVqZWN0ZWQgd2hlbg0KPiA+
PiArc3VibWl0dGluZyBhbg0KPiA+PiBhcnJheSBvZiBiaW5kcy4NCj4gPj4gKyAqIFRlc3QgY2F0
ZWdvcnk6IG5lZ2F0aXZlIHRlc3QNCj4gPj4gKyAqLw0KPiA+PiArc3RhdGljIHZvaWQgdGVzdF9i
aW5kX2ZsYWdfaW52YWxpZChpbnQgZmQsIGludCBudW1fYmluZHMpIHsNCj4gPj4gKwlzdHJ1Y3Qg
ZHJtX3hlX3ZtX2JpbmRfb3AgKmJpbmRfb3BzOw0KPiA+PiArCXN0cnVjdCBkcm1feGVfdm1fYmlu
ZCBiaW5kOw0KPiA+PiArCXVpbnQzMl90IHZtOw0KPiA+PiArDQo+ID4+ICsJdWludDMyX3QgYm8s
IGJvX3NpemUgPSB4ZV9nZXRfZGVmYXVsdF9hbGlnbm1lbnQoZmQpOw0KPiA+PiArCXVpbnQ2NF90
IGFkZHIgPSAweDFhMDAwMDsNCj4gPj4gKwlzdHJ1Y3QgZHJtX3hlX3N5bmMgc3luY1sxXSA9IHsN
Cj4gPj4gKwkJeyAudHlwZSA9IERSTV9YRV9TWU5DX1RZUEVfU1lOQ09CSiwgLmZsYWdzID0NCj4g
Pj4gRFJNX1hFX1NZTkNfRkxBR19TSUdOQUwsIH0sDQo+ID4+ICsJfTsNCj4gPj4gKw0KPiA+PiAr
CWlndF9hc3NlcnQobnVtX2JpbmRzID4gMSk7DQo+ID4+ICsNCj4gPj4gKwl2bSA9IHhlX3ZtX2Ny
ZWF0ZShmZCwgMCwgMCk7DQo+ID4+ICsJYm8gPSB4ZV9ib19jcmVhdGUoZmQsIHZtLCBib19zaXpl
LCB2cmFtX2lmX3Bvc3NpYmxlKGZkLCAwKSwgMCk7DQo+ID4+ICsJc3luY1swXS5oYW5kbGUgPSBz
eW5jb2JqX2NyZWF0ZShmZCwgMCk7DQo+ID4+ICsNCj4gPj4gKwliaW5kX29wcyA9IGNhbGxvYyhu
dW1fYmluZHMsIHNpemVvZigqYmluZF9vcHMpKTsNCj4gPj4gKwlmb3IgKGludCBpID0gMDsgaSA8
IG51bV9iaW5kczsgaSsrKSB7DQo+ID4+ICsJCWJpbmRfb3BzW2ldLmFkZHIgPSBhZGRyICsgaSAq
IGJvX3NpemU7DQo+ID4+ICsJCWJpbmRfb3BzW2ldLnJhbmdlID0gYm9fc2l6ZTsNCj4gPj4gKwkJ
YmluZF9vcHNbaV0ub2JqID0gYm87DQo+ID4+ICsJCWJpbmRfb3BzW2ldLm9wID0gRFJNX1hFX1ZN
X0JJTkRfT1BfTUFQOw0KPiA+PiArCQliaW5kX29wc1tpXS5wYXRfaW5kZXggPSBpbnRlbF9nZXRf
cGF0X2lkeF93YihmZCk7DQo+ID4+ICsJfQ0KPiA+PiArDQo+ID4+ICsJbWVtc2V0KCZiaW5kLCAw
LCBzaXplb2YoYmluZCkpOw0KPiA+PiArCWJpbmQudmVjdG9yX29mX2JpbmRzID0gdG9fdXNlcl9w
b2ludGVyKGJpbmRfb3BzKTsNCj4gPj4gKwliaW5kLm51bV9iaW5kcyA9IG51bV9iaW5kczsNCj4g
Pj4gKwliaW5kLnN5bmNzID0gdG9fdXNlcl9wb2ludGVyKHN5bmMpOw0KPiA+PiArCWJpbmQubnVt
X3N5bmNzID0gMTsNCj4gPj4gKwliaW5kLnZtX2lkID0gdm07DQo+ID4+ICsNCj4gPj4gKwkvKiBV
c2luZyB2YWxpZCBmbGFncyBzaG91bGQgd29yayAqLw0KPiA+PiArCV9fYmluZF9mbGFnX3ZhbGlk
KGZkLCBibywgYmluZCwgYmluZF9vcHMsIG51bV9iaW5kcyk7DQo+ID4+ICsNCj4gPj4gKwkvKiBV
c2luZyBpbnZhbGlkIGZsYWdzIHNob3VsZCBub3Qgd29yayAqLw0KPiA+PiArCWZvciAoaW50IGkg
PSAwOyBpIDwgbnVtX2JpbmRzOyBpKyspIHsNCj4gPj4gKwkJYmluZF9vcHNbaV0uZmxhZ3MgPSBC
SVQoMzApOw0KPiA+PiArCQliaW5kX29wc1tpXS5vYmogPSBibzsNCj4gPj4gKwl9DQo+ID4+ICsN
Cj4gPj4gKwlkb19pb2N0bF9lcnIoZmQsIERSTV9JT0NUTF9YRV9WTV9CSU5ELCAmYmluZCwgRUlO
VkFMKTsNCj4gPj4gKw0KPiA+PiArCS8qIFVzaW5nIHZhbGlkIGZsYWdzIHNob3VsZCBzdGlsbCB3
b3JrICovDQo+ID4+ICsJX19iaW5kX2ZsYWdfdmFsaWQoZmQsIGJvLCBiaW5kLCBiaW5kX29wcywg
bnVtX2JpbmRzKTsNCj4gPj4gKw0KPiA+PiArCXN5bmNvYmpfZGVzdHJveShmZCwgc3luY1swXS5o
YW5kbGUpOw0KPiA+PiArCWdlbV9jbG9zZShmZCwgYm8pOw0KPiA+PiArCXhlX3ZtX2Rlc3Ryb3ko
ZmQsIHZtKTsNCj4gPj4gK30NCj4gPj4gKw0KPiA+PiAgIC8qKg0KPiA+PiAgICAqIFNVQlRFU1Q6
IGludmFsaWQtZmxhZy0lcw0KPiA+PiAgICAqIEZ1bmN0aW9uYWxpdHk6IGlvY3RsX2lucHV0X3Zh
bGlkYXRpb24gQEAgLTI2NTgsNiArMjc0NSw5IEBAIGlndF9tYWluDQo+ID4+ICAgCQl4ZV9mb3Jf
ZWFjaF9lbmdpbmUoZmQsIGh3ZSkNCj4gPj4gICAJCQl0ZXN0X2JpbmRfYXJyYXlfY29uZmxpY3Qo
ZmQsIGh3ZSwgZmFsc2UsIHRydWUpOw0KPiA+Pg0KPiA+PiArCWlndF9zdWJ0ZXN0KCJiaW5kLWFy
cmF5LWZsYWctaW52YWxpZCIpDQo+ID4+ICsJCXRlc3RfYmluZF9mbGFnX2ludmFsaWQoZmQsIDE2
KTsNCj4gPiBSZW1haW5pbmcgY29kZSBsb29rcyBmaW5lIGZvciBtZSwgYW5kIG9uZSBtb3JlIHlv
dSBtZW50aW9uZWQgdGhhdCB5b3UNCj4gbm90aWNlZCBhIGRvdWJsZSBmcmVlIHdoZW4gdGhlIHZt
IGJpbmQgaW9jdGwgZmFpbGVkLCBkbyB5b3UgbWVhbiBpdHMgZm9yDQo+IG5lZ2F0aXZlIGZsYWcg
Pw0KPiANCj4gVGhlIGRvdWJsZSBmcmVlIHBhdGggZXhlY3V0ZXMgd2hlbiB0aGUgYXJndW1lbnQg
Y2hlY2sgZm9yIGFuIGFycmF5IGJpbmQNCj4gZmFpbHMsIHNvIHllcywgYW4gaW52YWxpZCBmbGFn
IHRyaWdnZXJzIGl0LiBZb3UgY2FuIGNoZWNrb3V0IHRoZSBmaXggZm9yIG1vcmUNCj4gZGV0YWls
czogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNTI4MzUvDQo+IA0K
PiA+IFdoYXQgaXMgdGhlIHJlYXNvbiBiZWhpbmQgZml4aW5nIHRoZSBudW1iZXIgb2YgYmluZHMg
dG8gMTYuIENvdWxkIHlvdQ0KPiBleHBsYWluPw0KPiANCj4gTm8gZ29vZCByZWFzb24sIEkganVz
dCBzYXcgc29tZSBvdGhlciBzdWIgdGVzdCB0aGF0IHBhc3NlcyAxNiBmb3IgdGhlIG51bWJlcg0K
PiBvZiBiaW5kIG9wcy4gSXQgY2FuIGJlIGFueXRoaW5nIGdyZWF0ZXIgb3IgZXF1YWwgMi4NCj4g
DQo+IFRoYW5rcywNCj4gQ2hyaXN0b3BoDQo+IA0KPiANCj4gPiBUaGFua3MsDQo+ID4gUHJpeWFu
a2ENCj4gPj4gKw0KPiA+PiAgIAlmb3IgKGJpbmRfc2l6ZSA9IDB4MXVsbCA8PCAyMTsgYmluZF9z
aXplIDw9IDB4MXVsbCA8PCAzMTsNCj4gPj4gICAJICAgICBiaW5kX3NpemUgPSBiaW5kX3NpemUg
PDwgMSkgew0KPiA+PiAgIAkJaWd0X3N1YnRlc3RfZigibGFyZ2UtYmluZHMtJWxsZCIsDQo+ID4+
IC0tDQo+ID4+IDIuNDcuMQ0KPiA+DQpMR1RNLA0KUmV2aWV3ZWQtYnk6IFByaXlhbmthIERhbmRh
bXVkaSA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbT4NCg0K
