Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BF3C282EC
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 09:57:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7FD810E92E;
	Thu,  6 Mar 2025 09:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cEImzarL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD75410E92F
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 09:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741255041; x=1772791041;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MM6HfVQC+5hVZbRMVvOpMcARVuZiqU1niI56oJqxvR8=;
 b=cEImzarLWajFmqJ/he0W1WhEF8eyQx7vHmwGZIziTVf0Rd3Y0gBeEP43
 HQcJ/urVOioFJfv5MIeUi3Y8Zh00DfB2Wb2EeaGjasQRT9P7b4suzueqh
 r6nwNMeJUWungmTh8SU9OlWPPEMM1mDNkxejxbmOgWn5E+bqSuuIEVFRR
 7XzEapPGWnf87S77o7rOBoFY74+msv+XhOqhX7OZjxZmtrzt8pyaZBj4P
 E5hRujrIZ6j2nJIETLpSILlHevImTa21jEXnDsELy6inipnQ6/hlsyXWU
 Ju7xYBJhIwPkDsGd8rRq8saEDCRRvcV6/nZfPoxzxakJzfroNQV3YlSwL g==;
X-CSE-ConnectionGUID: Wj6T/qWIT+G8s6kdA4yfnQ==
X-CSE-MsgGUID: roOzcbgITT2753RbtCl6Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42170390"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="42170390"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 01:57:21 -0800
X-CSE-ConnectionGUID: 4ZdBkpW4SSWy11QZXGih2A==
X-CSE-MsgGUID: LZFSyMxYRoaIAtwPyDES5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="123558615"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 01:57:22 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 6 Mar 2025 01:57:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 01:57:20 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 01:57:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D7EgVOSF1gjpYaPUQMobedmVzlVB1ixl0/Cm2e5OgJd4OW++CZFqHi4+trJrYbNYZTGkXf8ivzV9JX0XEfig0wAcNWECGPXj6kkpvpLakpEeXl4kUh8u3n9o/mwL2ozMEC1Lw6K+m1aw4ORCwx7mfb1A2CTj3hFdxy3C5IxV0vEnA37BEtsQi2kdXCZmDCm+2faHadTb27jIWeHH3YIcBX9QQWTHHLOPrAuqn64bIhpf+v7zoXIWR/pTHMIWIHGcOrqpbSZceuiLpWJ6G6AQACMjsIHsxTel81Yqe2cxIrZaL+kAQJOqvdM/4D8MGAScQpBSTZt9vm9iVqgX0eqHZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MM6HfVQC+5hVZbRMVvOpMcARVuZiqU1niI56oJqxvR8=;
 b=RxWZSsQMwmKpc2XuLRy2iZrsGEcPLdxNY7N5svpD8zzvZYXC6Brux8MsU9WNx+Y5cOmPn+hbb2wOKfDQkWiiJOtMdugIrSMaVQAQTOqSQpXvfzAOkdlesO/DPTbA7NfFtmX3DMXwb3+gqEJTTAP7qsrD2j8BfsJojV7NTzByDL7IxD0+3V0OqkX2mQo8rq6s4vyq1NBKnbtlRIL1NvlWAWofCvfvv+Q9IH/BOxIOr3jB5ohXv3Deykx4o4bIGvfftlwXZzlo/4OTFhJ9B3B2kr8X0vlGJSIFfxNQORvu9GqrJ+r+b9H3jN0+3rFIsD71hTaZrnK5Z/alOL+9X9j2Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 09:57:13 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8489.028; Thu, 6 Mar 2025
 09:57:13 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Dugast, Francois" <francois.dugast@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH i-g-t v2 5/5] tests/intel/xe_fault_injection: Do not
 assert if the captured error is not same as injected error.
Thread-Topic: [PATCH i-g-t v2 5/5] tests/intel/xe_fault_injection: Do not
 assert if the captured error is not same as injected error.
Thread-Index: AQHbgp6jhVg/3cNlYUitillTaTYfx7NkhR2AgAFxzwA=
Date: Thu, 6 Mar 2025 09:57:13 +0000
Message-ID: <LV3PR11MB8695A1624917187731922F24F9CA2@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250219073445.31423-1-satyanarayana.k.v.p@intel.com>
 <20250219073445.31423-6-satyanarayana.k.v.p@intel.com>
 <Z8g7K-Mvf5yGptuK@fdugast-desk>
In-Reply-To: <Z8g7K-Mvf5yGptuK@fdugast-desk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|SA1PR11MB8393:EE_
x-ms-office365-filtering-correlation-id: 7e605d3f-f5e0-450a-1d0a-08dd5c9544ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?U0RuT3BuYVl6VlM4RTU4QnlXenVFeHZMWHgvQ0phK0tJRzlTakhxbXY4TXpP?=
 =?utf-8?B?dVRqTE5ja1VRZVVuMUwyLzQvU1ptT2pOYSt6Sm5ZeDJtcWtxUkZDK2RYR1lR?=
 =?utf-8?B?cm94cDhLQnNqdlh4VEh2Z1I0OGlNVUFSbjYzalN3NklDcy9LcHRWRFNwN0po?=
 =?utf-8?B?TU90d1VOTHluSVdSaVFtTngrdHN6N0RPS1VNQWNSZ1NrVllGQk9BMGlxZTV4?=
 =?utf-8?B?QXN2bW5ZTDM3OEh0MHUzSVdSWk4zL2FFVlltb0ZPd1V2ZzFORWZNcnVIWGky?=
 =?utf-8?B?OUYydkk4bkVHazhqZUZXN1VoVWdBbGlYa2M4Ly9rNmdGK01kSmJscExnaGk1?=
 =?utf-8?B?Z0VXWk9EaFlVV0dDU3pvVyswSzJsbU9uQUZvSGRGekkyajNYdmdDTXVEUHBM?=
 =?utf-8?B?Uk11SVlZMlhLcW4xc3l5cGU1S1dFNHROTzRsUkhIcGo0RmY3bXVKSk5QWitO?=
 =?utf-8?B?M24wcjVCTXdmZCtON1VwNTVGcGp4TTBzamxCZGphaDhLOHdhWUhCUVF6N1hS?=
 =?utf-8?B?cEs0azRLdVhOZVFYczlRRVdzOGFBSlVhaHFqVmhmZFIxTVhTWGRNTlc4VGFL?=
 =?utf-8?B?cVQ5SlF4NGo2R1Z5aHRkVkpYRHJEa1lzV3FFOEdSWnV0NEdmK1pmdktGeXdk?=
 =?utf-8?B?WmFGeEZ4MHo4ZlBTaGRILzJvLzBkVTU0dDJPNTVCcVlYR0pBVWFmdGRxa2pw?=
 =?utf-8?B?ZFhLUjZuTVFqdGQzTFhhV1NjaUhhM3ZNOHNvUWtLQzFHWkhuYnFqMGIxcHkz?=
 =?utf-8?B?NVZSR1AxVitJVFV5azFWd3hGZ3NTYis2TlNtYTBLTml3bWJhcWpBQXc4Smlk?=
 =?utf-8?B?d3Y1dDByMzIrRWVkQnhCbWZRbVpwM1NYeXZIWDhkUTltU3BsWHd3bE94amJR?=
 =?utf-8?B?ZlBiZGc2SlhaSFQxR3NkU1h3QmdhMGRjekZxcnVlREJYY2N3aTFEQW9CdTdK?=
 =?utf-8?B?S2thNm5PMVRKeEtRUUhmcDVtL2gyMlVpcU4wcWNJdFJ0M0wzYkFWOG0zVXpr?=
 =?utf-8?B?eW9TdWs0RmEvb2tycG5qUlo1RllmaThmMThESTJxYVUrYTQ5Y285OEdyWDEx?=
 =?utf-8?B?UkRWTXkyVDVjb254d0FJZDduSFV3YmY2bEJsMWxTUTBPWHdmR3BQY3pCRDFi?=
 =?utf-8?B?YUtVWVo0U1NhRjB3S2Z3V3NuMXJRU1Zqd0ZFdG5JYXAwa0dncUljL1VwQ2x1?=
 =?utf-8?B?Vk4zdXlkcldOYWEvc3B6Q0FkNGhUTFo5eDdwMVl1T2NOejdnbkozTlNXeDZq?=
 =?utf-8?B?TmFEam1PSjJrNUpLUm5DQklHWWppTzlKNE9sd3Z4aDBKMlc5RG1KcGJxQjRz?=
 =?utf-8?B?Njc1YnY3aEJ6b2hYVUFWd3c3TDg3VTNleUdjYktEYldnc1lLdGo1T0duL3ps?=
 =?utf-8?B?QXhpQVJlcVJ0TzQwcmNvMTNsRGxvU0Raa1B0Uk4wWmFrL0ljMmpiSmZTKy9q?=
 =?utf-8?B?Qzl4NkFiaUZBeWczb3lqdUd0UmVFU2h1SXVtRTNJa0NVOVgvR2IzYU5CdU9K?=
 =?utf-8?B?MTVrZEJsU3RNaEdlV21KeHZpbEJabkFsQ1NNNTZzM2tPZktoU1E1YlJER3B4?=
 =?utf-8?B?ZXZzL09KTUcxaFRlNnNxam0xWEcrMzNNOVpkb2FaQXFwalVnQmVWL24zSTh1?=
 =?utf-8?B?MDdLeHgrOGJMazdLRHoraUkxVHVlaU1kWW5wTGo3am9oMUZoU0kvSzFoSm40?=
 =?utf-8?B?UTB0dHlVd1JablFuZWI5NFVYVk16bzRLR25tZWUvMFZOZHJtTDFZQmtBUDQz?=
 =?utf-8?B?SVNPMkVFai9TQk5yVnRjWXhmVDRCVVF3OTdjeFNSQWl0R1Zham9ZeEhPbzY1?=
 =?utf-8?B?NXdBU1VwSDZNMzhpN0Y4a1FZRUZVMUNLZ0dJZ0FQNHlaWnNYdGhRaHpsdDBJ?=
 =?utf-8?B?cVZxcnhRUUVlUW5MeUJTKzFZQkxkMzVUZG52OG03K053b0hVTkVVa0w4aENi?=
 =?utf-8?Q?/sFp7hBiDtThb0Ni2L/76XZ8ecw+hVQx?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFpodFZNNFU4YmFHTDlWMjJpNWVxK0wrcTRIWk02Tm1zQzIwL1o1b1NVa2xO?=
 =?utf-8?B?bE9ZcXlZcmJHbTVpSU5tV1Y0MWZQTVJkdDlmbC9CeVVVb1hoQTdSNzNyZ2s5?=
 =?utf-8?B?TFg4M2QyZk1tWnlYNXlBTlpyZnQrNFBLRVNucFF3bC94eTdHY2JEUW5saDY5?=
 =?utf-8?B?aFhTUUxoWmV1akxKeGJBQnlyTTBpYkoySUxBVDRORm02TDlDVGZoQXpWb0Ev?=
 =?utf-8?B?YTFUY21vbmZaRlJwMU9CRkdKc0pjS3ZwSnVnVFZhQlBKc1pyczVRN01EUXZs?=
 =?utf-8?B?bmZOeTFvcUpIZ2FsdzdrMm5YdkNKb25yOHYzTjF4RnF3ME5IQ3VDMC9QS3Ex?=
 =?utf-8?B?V1ZmU1RvMGdxRFVLeWM2ZWVGNUEreEhmbzZ4T2ZuakVKZkVwR2ZreGtIZGtw?=
 =?utf-8?B?dlNTSVRoQXhuMCtaTnAvc2VWb05tdENIb29YTlduWSsrVGFuRVFjVUpObnpP?=
 =?utf-8?B?Tm45N3NnNlQ4U1NBYVFFYTRRSDY5eGpNWTBMcU9KREc2UjVQazBtYTd3ZWhz?=
 =?utf-8?B?czJ3Y2UwU0Nva1NmdFNjNzE1cUdKaWd3MFRmQVFxT3FGOFlHUGU0eVQwOWlp?=
 =?utf-8?B?SklLV1BUODdtY0tNeUdnK2hPcnFLMHE3L1VZYWZic25udmNxSXBWOGplcDdR?=
 =?utf-8?B?KzhPOVN4L2JjNnFsb3IreFRqeU53bnVrV3J1SU5OOEFKaDRUNWl2ams3OGZR?=
 =?utf-8?B?MDViZ2dDZzAyODFYbUw4Z0E3NjJMZUNpM0FkTjJtQW4zczZrL2hqWmErVWc4?=
 =?utf-8?B?OG8xWjNUMHNTR0ZucURmK2o5VkdyNHBvU04rSkRxVW80MXIyb016anFjaS92?=
 =?utf-8?B?bUNMb3VmUU15cno0b09uaTRuSGd5dW5VY004QnVPWDNyTWVqQ2RvRURuWFJD?=
 =?utf-8?B?dloxc21BbjkxYjhXY25UZUhrNHRHSlpvZThEdkVCa1BPQUxkTENlb05NTlhz?=
 =?utf-8?B?dEoybmdrWlJ4dHRYYStIVGlQa2NWb05KT0FZRXNLYXJjMnRGelZ3ckhnR0lE?=
 =?utf-8?B?czhBUHJlOVVnVkNycjNCREh1YUNYeEpVNDhLaDJ5bXZhVzNZOUpadkpud0hk?=
 =?utf-8?B?ZHErOFpvMkJobmxweWxiS1JHOFpqanNWOHpKQ0QwU29FUmwySVpiWHlJMDU2?=
 =?utf-8?B?K01ObUl0L1lydWVlWXdudGhYcjlZTWhqenpjcjVQeTBVYU52N3kxYTc5Vnd4?=
 =?utf-8?B?SWZvRm5jb0V6Vm5HRWMvUjROaDFsN2Q5TEFCZUwwbHQrZVRUOERuZUdwendW?=
 =?utf-8?B?UGZIQzJERGJmeEZKbjl4RkIrRG9wZlBHU2FtUU0wbm0zWXZ4WFdTNFNwWlg0?=
 =?utf-8?B?Q2ZTNys3UlBBRTVucjBVT2pMbmpubmg2cG1DVllGenAzWW9BelFHRnhER0Fo?=
 =?utf-8?B?ZExpbVhWYTdWemwvZjhzU2x6YzBiZ2lNZm5vRjN2b2wwMWtRSmFvRDl2N2ND?=
 =?utf-8?B?cmw0RVhYMlNvWTdFK2I4aUJUOUpwb2hLZnlwSEQxRU4ybkI4TVJGTThieXBI?=
 =?utf-8?B?MTZ6ODdjcHVqZGtlOWNmb2MwL09OV3FrVkhRTFZNbTBGNUZSejdRS3BxcTFD?=
 =?utf-8?B?TnFBM0pZenNLY0xqYUZMbks4RWM1dmlWQjRycDFpVGU0R1h1RHgxemhhNk9M?=
 =?utf-8?B?VGVYSlBFVXB5N3VnQ2plbG5STVJyc0VJcmtCWW4ra21qQXd1R3BDalBLU2lH?=
 =?utf-8?B?cDhNek1MNlBWZXB4aFVRT2ppcFVGQ2t5UXd1enZnbkw5NUpmci8vbWtBQ0Nv?=
 =?utf-8?B?SFEzNUN2Ti9EcDFwWEVuOTRwbGxVdUdNLzhuemhoK1dUbCtWV3dwcm5MUzMw?=
 =?utf-8?B?bkl3aVFsM3Z2Q3RYV2p1ZWZBUDB6dUNVNlJiaGg5RzJkL1YyUUxKY0RleHNV?=
 =?utf-8?B?ZXJscXJ5c2l2czBjdzZQRXN2ZzlEcmZONFhpQnNCeVM4RmU4a3JrR1J3MmpD?=
 =?utf-8?B?MExzWjlKSFNqWlF4UllFQS9NVEpzejlSek02Ky9UWGM2NjY0K2xNeG5ucVhB?=
 =?utf-8?B?Y3M3ZmdQQ1VtS3l4NGhpSXpRMUtJTW1VSDU0WDdJQzl6MlIrYnlQOFQ4dE9r?=
 =?utf-8?B?YXJza3RtOGxUUExEbHVONWRybjVQOTZqOXZIc0pCclZJSkNkT3FwZHN3cFhL?=
 =?utf-8?B?THE3U1VFbHhrb09vMk9qcU41RmtBZVpwN0lXYzdHN1JVSnRzbFdlVXY3MTlO?=
 =?utf-8?B?OHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e605d3f-f5e0-450a-1d0a-08dd5c9544ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 09:57:13.2247 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kIh9el+MqB1YWO09XBJDA3yGGt/ZiFOdewoH5EPW2HbLx4f1vZE5wl3aRtlTx+UwplWHp5YPTjndle1P0Qo/yTvNs4RH2xfFkNT4iisCBac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8393
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEdWdhc3QsIEZyYW5jb2lzIDxm
cmFuY29pcy5kdWdhc3RAaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDUsIDIw
MjUgNToyMyBQTQ0KPiBUbzogSyBWIFAsIFNhdHlhbmFyYXlhbmEgPHNhdHlhbmFyYXlhbmEuay52
LnBAaW50ZWwuY29tPg0KPiBDYzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFdhamRl
Y3prbywgTWljaGFsDQo+IDxNaWNoYWwuV2FqZGVjemtvQGludGVsLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCBpLWctdCB2MiA1LzVdIHRlc3RzL2ludGVsL3hlX2ZhdWx0X2luamVjdGlvbjog
RG8gbm90IGFzc2VydCBpZg0KPiB0aGUgY2FwdHVyZWQgZXJyb3IgaXMgbm90IHNhbWUgYXMgaW5q
ZWN0ZWQgZXJyb3IuDQo+IA0KPiBPbiBXZWQsIEZlYiAxOSwgMjAyNSBhdCAwMTowNDo0NVBNICsw
NTMwLCBTYXR5YW5hcmF5YW5hIEsgViBQIHdyb3RlOg0KPiA+IEluIHRoZSBjdXJyZW50IGltcGxl
bWVudGF0aW9uLCB0ZXN0IGFzc2VydHMgaWYgdGhlIGNhcHR1cmVkIGVycm9yIGlzIG5vdCBzYW1l
DQo+IGFzDQo+ID4gaW5qZWN0ZWQgZXJyb3IuIEl0IGlzIGEgcG9zc2libGUgdGhhdCB0aGUgZXJy
b3IgcmVjZWl2ZWQgaXMgdHJhbnNsYXRlZCB0byBvdGhlcg0KPiA+IGVycm9yIHdoaWNoIGNhbiBi
ZSByZXR1cm5lZCB0byBhcHBsaWNhdGlvbi4NCj4gPg0KPiA+IFRyeSB0byB1bmJpbmQgdGhlIGRl
dmljZSBhdCB0aGUgZW5kIG9mIGluamVjdF9mYXVsdF9wcm9iZSgpIGFzIHRoaXMgY2FuIGJlDQo+
ID4gZXhlY3V0ZWQgaW4gYSBsb29wIGlmIElHVF9GQVVMVF9JTkpFQ1RfSVRFUkFUSU9OIGVudmly
b25tZW50IHZhcmlhYmxlIGlzDQo+IHNldC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNhdHlh
bmFyYXlhbmEgSyBWIFAgPHNhdHlhbmFyYXlhbmEuay52LnBAaW50ZWwuY29tPg0KPiA+IENjOiBN
aWNoYcWCIFdhamRlY3prbyA8bWljaGFsLndhamRlY3prb0BpbnRlbC5jb20+DQo+ID4gQ2M6IEZy
YW5jb2lzIER1Z2FzdCA8ZnJhbmNvaXMuZHVnYXN0QGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAg
dGVzdHMvaW50ZWwveGVfZmF1bHRfaW5qZWN0aW9uLmMgfCAyICstDQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBh
L3Rlc3RzL2ludGVsL3hlX2ZhdWx0X2luamVjdGlvbi5jIGIvdGVzdHMvaW50ZWwveGVfZmF1bHRf
aW5qZWN0aW9uLmMNCj4gPiBpbmRleCBjZjAzMzc3MzMuLjgyZTMzODk2NSAxMDA2NDQNCj4gPiAt
LS0gYS90ZXN0cy9pbnRlbC94ZV9mYXVsdF9pbmplY3Rpb24uYw0KPiA+ICsrKyBiL3Rlc3RzL2lu
dGVsL3hlX2ZhdWx0X2luamVjdGlvbi5jDQo+ID4gQEAgLTIyNyw4ICsyMjcsOCBAQCBpbmplY3Rf
ZmF1bHRfcHJvYmUoaW50IGZkLCBjaGFyIHBjaV9zbG90W10sIGNvbnN0IGNoYXINCj4gZnVuY3Rp
b25fbmFtZVtdKQ0KPiA+ICAJaW5qZWN0aW9uX2xpc3RfZG8oSU5KRUNUSU9OX0xJU1RfQURELCBm
dW5jdGlvbl9uYW1lKTsNCj4gPiAgCXNldF9yZXR2YWwoZnVuY3Rpb25fbmFtZSwgSU5KRUNUX0VS
Uk5PKTsNCj4gPiAgCXhlX3N5c2ZzX2RyaXZlcl9kbyhmZCwgcGNpX3Nsb3QsIFhFX1NZU0ZTX0RS
SVZFUl9UUllfQklORCk7DQo+ID4gLQlpZ3RfYXNzZXJ0X2VxKC1lcnJubywgSU5KRUNUX0VSUk5P
KTsNCj4gPiAgCWluamVjdGlvbl9saXN0X2RvKElOSkVDVElPTl9MSVNUX1JFTU9WRSwgZnVuY3Rp
b25fbmFtZSk7DQo+ID4gKwl4ZV9zeXNmc19kcml2ZXJfZG8oZmQsIHBjaV9zbG90LCBYRV9TWVNG
U19EUklWRVJfVFJZX1VOQklORCk7DQo+IA0KPiBUaG9zZSBzaG91bGQgYmUgMiBzZXBhcmF0ZSBw
YXRjaGVzLg0KPiANCj4gMS4gVHJ5IGRyaXZlciB1bmJpbmQgYWZ0ZXIgZmF1bHQgaW5qZWN0aW9u
IGR1cmluZyBwcm9iZQ0KPiAyLiBBY2NlcHQgcmV0dXJuZWQgZXJyb3IgZGlmZmVyZW50IHRoYW4g
aW5qZWN0ZWQgb25lDQo+IA0KPiBJIGFtIGZpbmUgd2l0aCAxLiBhcyBpdCBpcywganVzdCB0aGUg
b25lIGxpbmUuDQo+IA0KPiBIb3dldmVyIHJlbW92aW5nIHRoZSBhc3NlcnQgaW4gMi4gaXMgbm90
IGFjY2VwdGFibGUuIFRoaXMgYXNzZXJ0ICpJUyoNCj4gdGhlIHJlYWwgdGVzdCBwZXJmb3JtZWQg
Zm9yIGV4aXN0aW5nIGZhdWx0IGluamVjdGlvbiB0ZXN0cy4gSWYgd2UNCj4gcmVtb3ZlIGl0IHRo
ZW4gd2Ugd2lsbCBub3QgYmUgYWJsZSB0byBkZXRlY3Qgd2hlbiBwcm9iaW5nIGRvZXMgbm90DQo+
IGJlaGF2ZSBhcyBleHBlY3RlZCBpbiBjYXNlIG9mIGZhaWx1cmUuDQo+IA0KPiBXZSBuZWVkIGEg
bW9yZSBmbGV4aWJsZSBzb2x1dGlvbiB0byB5b3VyIHByb2JsZW0sIHN1Y2ggYXMgYWRkaW5nIG9u
ZQ0KPiBwYXJhbWV0ZXIgdG8gaW5qZWN0X2ZhdWx0X3Byb2JlKCkgd2l0aCB0aGUgZXhwZWN0ZWQg
cmV0dXJuZWQgZXJyb3INCj4gY29kZS4NCj4gDQo+IEZyYW5jb2lzDQo+IA0KVXBkYXRlZCBwYXRj
aCB3aXRoIHJldmlldyBjb21tZW50cy4NCi1TYXR5YS4NCj4gPiAgfQ0KPiA+DQo+ID4gIC8qKg0K
PiA+IC0tDQo+ID4gMi4zNS4zDQo+ID4NCg==
