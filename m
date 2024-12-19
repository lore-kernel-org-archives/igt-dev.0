Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EF0E7718B
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 15:27:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739F010E4A1;
	Thu, 19 Dec 2024 15:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I6TESudJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A821F10E33B;
 Thu, 19 Dec 2024 07:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734593330; x=1766129330;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=L1U+mC3B/CBlj63z9MaJ6d1vjNGSFE5m1yRacGz5IVM=;
 b=I6TESudJhLiujqUxfqBsDNb6/C0xcEA6ze2+unFvTh4A+FEdaB9PfBWr
 D9IeW1C8agBLanJIYG4vErKsgJWP1vBoOP2JIKgJP1dHttFhCFgvHAq7f
 IZfaECwCpo5mtUAKcdfggNjlDOmcDfS5Y2cYUOpWZy2cH04vgfU5GVAJ2
 eA/efedw6XbhiDm9HCiwlJL2J43xwQ3XBIDemAgl7cWEOi3HMDZ8+b4ny
 GM5CuXMjcW9qaT8m0y/lpRL3hNIpQrI0vYGQpSy2fzy7nE/dDm2Ms260x
 3kwQYkDV5mpKATWlXeOgdRT8Mu/IrfSs8tQadqODqD/ohzLSUcg0OYZvl g==;
X-CSE-ConnectionGUID: QEqsfWR4S3u4WcTwOktcRQ==
X-CSE-MsgGUID: 6F2oNRpXR1etYx6tlgeVeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="46099593"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; d="scan'208";a="46099593"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 23:28:50 -0800
X-CSE-ConnectionGUID: KLezcmCdRlGy5VCU1mKaQQ==
X-CSE-MsgGUID: bbMcmEo6TOiAWhh0DHP+4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; d="scan'208";a="102965276"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 23:28:50 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 23:28:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 23:28:48 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 23:28:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bxD0UrW7pghiB7Kjz0c3y2EuAMuWE+SHTB5VyftpPJSmN6j1gHhj+WFpLXlxHPaTJQRbPoXIJudiw99azMiaEBvII3ZvnnJAaOxjBIGHsK58sJptJdTvt3git6scbJa4wuPNVA1wHIjyTgss8Rln4oSfzgKcX5qWXWJr/VnBsHd6g8DNQjgeeCJQkuKVTMcMm1ZzcXlP62fxMcpAshjLDsRCX6mO9S8/7xdQpaabIjgCoh5m23fmfN1LoKIfcayWDEmn4tYk7+CTZ2M9CiSs8zu0yb6z0IZ45xWspbfngSekVKDWI98nw2P8iaDVWIfqArs91CA5/CMirUf45kSUig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1U+mC3B/CBlj63z9MaJ6d1vjNGSFE5m1yRacGz5IVM=;
 b=EGPg8kKm+80DKpaytstijCTL/Q9+ndEDlc4aw2R0tsfua0jYX7LhipTKBrLtw7l/dRYUCXID7C7HV6zoEWUnzrIrw0bb1MNyasMlAAjjXFpHjnlhBJrMsuFjbUg9weXlzdap/AD2AuJS3PoliPrTVMImdCANCKyuYHRv14eOEb6wX7AKuFXfTaBZ0mzd2hGW83cu9m37n+wEPNqX4MJDAh7oGna25ySqSVhcGc7gQdWVsfDPhYq4L1eK4OVI1O1IUzfzaRJ0+ZqwUeEPbZ2usSXpssJdBgnXXOVD+hC1mahZaIz86YO4UPishKJIhgeOUXN9P6pGCPSg7tcDCyBMQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by CO1PR11MB5028.namprd11.prod.outlook.com (2603:10b6:303:9a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.17; Thu, 19 Dec
 2024 07:28:05 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a%5]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 07:28:05 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIGlndF9mYWN0cyBm?=
 =?utf-8?Q?or_fact_tracking_(rev2)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgaWd0X2ZhY3RzIGZvciBm?=
 =?utf-8?Q?act_tracking_(rev2)?=
Thread-Index: AQHbUQxWknzT2LGeGkimVp7/Zxloj7LtJDzg
Date: Thu, 19 Dec 2024 07:28:05 +0000
Message-ID: <CH0PR11MB5491094D5BFE495C375C045DEF062@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20241216151420.43042-1-peter.senna@linux.intel.com>
 <173444554570.3847390.6842367390907416387@b555e5b46a47>
 <472d9a63-8ab9-435c-9a7b-48865ca617d0@linux.intel.com>
In-Reply-To: <472d9a63-8ab9-435c-9a7b-48865ca617d0@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|CO1PR11MB5028:EE_
x-ms-office365-filtering-correlation-id: ed15725d-e014-4f89-287d-08dd1ffeadbd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Y0NtdHFvazkyQkViVTJ6di9BTkw4UDdLb21LeEpoczJaNWFqOFJhVmRZaDNC?=
 =?utf-8?B?dXlEWGM4WTllUXltNjkyaVQxbjlEMXdVWGFxcmFRaUd2a25DNC9IUWpDTWNn?=
 =?utf-8?B?K0t4UFlXdjY5SitFaFYxVnEya0N6emlMNWQyYngwc0NjNEJjRlBoWEg2bEpN?=
 =?utf-8?B?VWlqdjY0bjVRRitCSWdjUzBrT1l5eWpyS29hT3dPUXVpSUw2Yms1LytFaks0?=
 =?utf-8?B?cWl6ZDhURTFETFdRRXkvVzFhdUUzZW1UK1JON2ZPWnBOU01uL2hlL3hkNWMx?=
 =?utf-8?B?eE9teDNRWUZHMWNsMU9PaW1HbkNRV3RCNlAzV3l6Yjc3b3pGaWd2NWpXQkov?=
 =?utf-8?B?ZlFwamFPcTBmVkRwT2lYREdzQkgwK09WTTZvS0VWenE0d0lKMVJ2djhMYUxk?=
 =?utf-8?B?VVppdzFRbnhZaVR6bllET3p4SnFRSCsyS0NhZGE3cVRmalozYThaRC8ra08v?=
 =?utf-8?B?NlY2MmNIRUZDbWNrVmI2dDlRVC8vN21IREZJSGtrd3Q5VC81QVJ3cTNrU21Q?=
 =?utf-8?B?NkViMGVxLzR5dUYzTjRsVkJWR2FyUENWYUZKRkNJdGRXZWpsa21TYjZrQWJD?=
 =?utf-8?B?VjczR2tEakFMYlI2R2JZM3Z4clhXTGJxL3ZJbENRUVd5d0I3N0FUYTdaLzRq?=
 =?utf-8?B?bmZYeVdrOUU1bUo0dnRnZ0w3enViTkVhYnlFRmNFNnMxdys4bnFva0pxeENs?=
 =?utf-8?B?aUJVYUpDRFRManI4bjZ0ZTdYNDBtUFNlSXVsUlBsY2VCUll1MjVwMDVMVmtP?=
 =?utf-8?B?SUxZeUcyTGl1WmwvaUNsRmlXc0Q5S0pLNXRobDFRb3orRGpRQTNPZmQwVTNO?=
 =?utf-8?B?YWZicW9VY3laNWYvM2xtTm1YQkhWWkVqbHJ1RnYwb3EzbVdBYnV3NVg5RDFD?=
 =?utf-8?B?eWtIQ0YwZWpyNVc5TVNla0hOZElTc2haeVVSdTRYblFiYWhJNmJsOGNVcEJo?=
 =?utf-8?B?WEx5Ymd5Q3JlRnBCRHYrMTN2b0N5THEwOEIyT0kzM3JoM09OcWRMWFdNQnps?=
 =?utf-8?B?akNIcnI5b1M0MVVWNUZHTmljSzZ2bDYyRTI5cDNuSlVFcWZFOUUyOGViWTBx?=
 =?utf-8?B?aXBBc0s4WkdJOTIwMG1jNndqbWFmQk0zOC90SDl4Vjd6dnpKcEJSQ1NXTWVP?=
 =?utf-8?B?R2xFdVNMaG92aVFqUllQb3EzYkNDZ3BFR2VhNXh4U3BIcDQ2ZjhaMmw2WGhq?=
 =?utf-8?B?b1ZEcEVEMGRDV2d2akVEdkhaNCsyN3FyNHdYTktiWFU4dEhLUlZrZUIrb2Fh?=
 =?utf-8?B?UWVNc2E3enBIMGpIVXBwcUJFTUx4MkZQcit3bWdPeEtoQVFoRDhYOUNPSEpG?=
 =?utf-8?B?eVorcU0vUkNsRWFlNXphczFpYXAwWEdKanczcFd4djY4dXRQYStsZ3FUMTRS?=
 =?utf-8?B?YkdSU0tXTTZ4MmdkaCtTSk93eWZzK3Fkd2ltMjYrR3hMRjNueWNKcmFIWWlZ?=
 =?utf-8?B?OHloTVE3enVWUWJUWm50L3dGOHBnUkgweUZQUVZkZEVKNWZhajZEbEFmUVZy?=
 =?utf-8?B?L1NIR05ITmQ0Mnk2a1Flc1YwNDBuNVYyUTRJcE9uM2VZZ3ROcmNYS3JpM3BU?=
 =?utf-8?B?Q0hZeWFjNFlzRE84VlZpQm1wWVVacE5uaDNOcUdmWlRLRUpTSlBIYTJVY1Qx?=
 =?utf-8?B?UnFrMGtjWGtTWmJVSUVWWlFkdXAzdTZFYW9aQmx3QXYxM1d0d1BRcmpYdmx6?=
 =?utf-8?B?YTAvekVWK2FIZTNvY3VqYUtwVWQvVEUrelEvWGJxZzN4Y3N3Wi9zc1hkdkVR?=
 =?utf-8?B?cVZzQWxQdXQyOW5uM0JqYXFUNEgvR3NxOVdtb3VHSlZ5Q2hGVlJUZW9YdXlr?=
 =?utf-8?B?ZHZSUlF1L1RXN2lWR1hNL2QvTVJhRWlvYUkyQm1vNnJ4ZndldHpDMjhmK2Yy?=
 =?utf-8?B?aHZZR3V0SVhSWmVMOXNyUG5pNUVkdVpVdDVzQndDM0gzVmc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WENjcmdoeW9vMVZBdWVocTNZcFVFQU1KVjBKNlNBbzFpbEx6MEF4UkNWYTFL?=
 =?utf-8?B?bVhFbkFvLzJnaThxUnV1aDBJV1JmTFo5Q29JQWxoV05CNERpRXE1TmlLa09l?=
 =?utf-8?B?eEN0eE5KcU40Nzd6Nk9OMXlmejNCZi9xZURHK1Z2Q29oTWxqODBDNUs5Tmhl?=
 =?utf-8?B?K2RSSUZERm93R2FhT0pNSlJkVDEwdUpGYVJFK3ExeWdwNXlKYjdXdVVmV2RL?=
 =?utf-8?B?Nm1HUURxbGZZOFdMUGkwd2JCbWtaMzRzUlZKOVcxNlliV0Jma0ZESUExYWpa?=
 =?utf-8?B?Z0Q1V0krQzJLdHF6SGUwayt6UGRwNnJVc1lRVVJRa2M4a0swMjJCOGJna2x3?=
 =?utf-8?B?dWllQ1NZU0FiS29mTmxHNHA0cjVEVU42bHNrdk4xRm9TUm1VQWQ2dzdZKzBR?=
 =?utf-8?B?ZUduSW5PMmQxcVc4S01vOUFTYlVJUkVQYTMrWHVWZFZSOXIvdytKT2ExbzZ0?=
 =?utf-8?B?ME0xbG1MK1poV2tBSGFWdXRpdk43R05JaCtubEw3dWQ0YnYzamV2Yk9aQ0k2?=
 =?utf-8?B?eExnWGhkMWRMZk9UVDVKYzFhbXdIZGRCRk94eWE3RVVCdXhwYmYyNWVKaFZa?=
 =?utf-8?B?dXYyTHp3NmN3a0JGVzRVVC9MaWxzaTFLbmswQXExaWkrUmN1bFdMSENSVmRH?=
 =?utf-8?B?UVJUcTdIa3FWWDhQaSswNTE5TjJ1SW53Q25XMkdXMHNmdEx1dno5UjFPdUFT?=
 =?utf-8?B?QTBKZ2IySktyOGtsR00vZ1BZQ3pUNDdqUUNOQUlPV2xUOFpJclBMWmdTNVJT?=
 =?utf-8?B?QWtYNk1taGZja0grd3p3NmZxdkQ1ZXR1U3pGWW01ZGUrOEV4TDk0bE5UUmlH?=
 =?utf-8?B?dWQ0YmE1Y0JMMDBOVUF6UTZtUUFwS2IyRjN4aDdJQ1BvSW45Kzh2NkkzUzg3?=
 =?utf-8?B?WEMwRFluRzA5TEZrZE9SdWhVM2pVUUMrM1BYNEJIRHFZdE8yUVA1eDZwd0Jl?=
 =?utf-8?B?T2txYXo1SnQ2bGp1WVRrUFpkeGNpcHJXQlBIMmExRHBzdnhJTXhmck0vaWs2?=
 =?utf-8?B?ZU1sYWltT0hRTlBOT0RHRi9mRmQ4ZjZVWTRPUE5YVFJ0RE9pRDd2RngwbVlw?=
 =?utf-8?B?M1dsejAvOHd5M1llY2xtMDBzbmljV0RmWDRHVnNaSlAzb3BkQUFVQ0lZak56?=
 =?utf-8?B?alQ3T0xuVHdCMzdTc3IrUlhSNGNYRW82M1FoOEV6VEdSUkVNNUo4N25QUFFQ?=
 =?utf-8?B?MzdXd0tzRXVZajAwbkVhc2VxMHZVVFYxUHYwVkhKYmpGYW43bG11MzBoMjhw?=
 =?utf-8?B?a01nS1V2TURmSVlPc2xjWGVRMUNHd3Yzc05Yd3QzRHZrOWt6THk4VkpKN2dG?=
 =?utf-8?B?UlFUd1Y0RlR3eU9STENlK1lRbjJDaFBpMXczK24xemp0T0E3eTdEWWtKbVNT?=
 =?utf-8?B?UmhCQXc1cWlhMitnWkhFSXRFbHY4cEEzS2dCYUxKWEJPWVJWNnVSWGJvdzd5?=
 =?utf-8?B?N3JoZGl3K2tRZktNckw0cHpoYWJxZEJ1NnlLbkpTRkJnSE1UTmM2SUlzT3Y5?=
 =?utf-8?B?Y2lKRjN2UVRxWnRKcWZTSHNmQ2V4TFhHdTRIS3llbUFvM2VCNjFuK01Ua1NM?=
 =?utf-8?B?MGlXYVM1TXJpZ2pDaFh2WDlFemttdGxrWWw3eHhVaXRHeVN0RHFWL0I2RGNL?=
 =?utf-8?B?V0JsMzdMWUNhWmQyWGlPL3dZZnc5Q2pKa05VY1Awa2lMK1pqS3B3Sm92VzN4?=
 =?utf-8?B?ZmpUeGdVdHBxUVpPdSsrSDNiV2srSkhoUFRKZmxWZDR3bWg5TzdmM3FVQWx0?=
 =?utf-8?B?Y2d3OURvU1dGSXptY1dTbTY2bmFWaEZVeUVKanBPNjVCS2Jab0lZYXNMOVZR?=
 =?utf-8?B?Tm9pdVY1T1hEZnh6Q3lSZ0FvOFgwRUw5TVFTOUQyRjBaYURLaDlaR3UwN3Ri?=
 =?utf-8?B?UjhKNm1LcTZpaSttdjBFa3A0SWNhOHJqRnNnU0ZaSEpJNGdwcTlSblVTbUdY?=
 =?utf-8?B?NUxMY24wWk9VMXB5WmY4VThBeEhsRjN4NC9HalY0MjFTdDhHTm5PUmwxbys4?=
 =?utf-8?B?OEF2dkVuY3JRcWtGZ215dHlnandDVGtaMW1zbGN2QVRYZklXbUlWY2NYcEN1?=
 =?utf-8?B?RnhZb0tCaHFEN2t6L1NBdDJpSlBySkJXQkFQSXd1cUtqSzNJaDVzdkFKcnNE?=
 =?utf-8?Q?fHhSnA48RDk6C4NpYZNi7slZU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed15725d-e014-4f89-287d-08dd1ffeadbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2024 07:28:05.3413 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NPI6TgHZ0uvkOsvFwhzwEZgvp0Oe8Fl8SELnsfRrR1xwLLlwUgWT9PwGAJOW+jCa4PARQd8qaBRtBBQ+qibvOu6OWKcfdYRV5AiA4mkZJ3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5028
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Thu, 19 Dec 2024 15:27:47 +0000
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

SGksDQogDQpodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE0MjYyOC8g
LSBSZS1yZXBvcnRlZA0KIA0KaTkxNS5DSS5GdWxsIC0gUmUtcmVwb3J0ZWQuDQogDQpUaGFua3Ms
DQpSYXZhbGkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEk5MTUtY2ktaW5m
cmEgPGk5MTUtY2ktaW5mcmEtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFs
ZiBPZiBQZXRlciBTZW5uYSBUc2NodWRpbg0KU2VudDogMTggRGVjZW1iZXIgMjAyNCAxMDo0OQ0K
VG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBJOTE1LWNpLWluZnJhQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KU3ViamVjdDogUmU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9y
IGlndF9mYWN0cyBmb3IgZmFjdCB0cmFja2luZyAocmV2MikNCg0KRGVhciBJOTE1LA0KDQoNCk9u
IDE3LjEyLjIwMjQgMTU6MjUsIFBhdGNod29yayB3cm90ZToNCj4gPT0gU2VyaWVzIERldGFpbHMg
PT0NCj4gDQo+IFNlcmllczogaWd0X2ZhY3RzIGZvciBmYWN0IHRyYWNraW5nIChyZXYyKQ0KPiBV
UkwgICA6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQyNjI4Lw0K
PiBTdGF0ZSA6IGZhaWx1cmUNCj4gDQo+ID09IFN1bW1hcnkgPT0NCj4gDQo+IENJIEJ1ZyBMb2cg
LSBjaGFuZ2VzIGZyb20gQ0lfRFJNXzE1ODU0X2Z1bGwgLT4gSUdUUFdfMTIzMjVfZnVsbCANCj4g
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiAN
Cj4gU3VtbWFyeQ0KPiAtLS0tLS0tDQo+IA0KPiAgICoqRkFJTFVSRSoqDQo+IA0KPiAgIFNlcmlv
dXMgdW5rbm93biBjaGFuZ2VzIGNvbWluZyB3aXRoIElHVFBXXzEyMzI1X2Z1bGwgYWJzb2x1dGVs
eSBuZWVkIHRvIGJlDQo+ICAgdmVyaWZpZWQgbWFudWFsbHkuDQo+ICAgDQo+ICAgSWYgeW91IHRo
aW5rIHRoZSByZXBvcnRlZCBjaGFuZ2VzIGhhdmUgbm90aGluZyB0byBkbyB3aXRoIHRoZSBjaGFu
Z2VzDQo+ICAgaW50cm9kdWNlZCBpbiBJR1RQV18xMjMyNV9mdWxsLCBwbGVhc2Ugbm90aWZ5IHlv
dXIgYnVnIHRlYW0gKEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnKSB0byBhbGxv
dyB0aGVtDQo+ICAgdG8gZG9jdW1lbnQgdGhpcyBuZXcgZmFpbHVyZSBtb2RlLCB3aGljaCB3aWxs
IHJlZHVjZSBmYWxzZSBwb3NpdGl2ZXMgaW4gQ0kuDQo+IA0KPiAgIEV4dGVybmFsIFVSTDogDQo+
IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTIzMjUvaW5k
ZXguaHRtbA0KPiANCj4gUGFydGljaXBhdGluZyBob3N0cyAoMTEgLT4gMTIpDQo+IC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBBZGRpdGlvbmFsICgxKTogc2hhcmQtZGcy
LXNldDINCj4gDQo+IFBvc3NpYmxlIG5ldyBpc3N1ZXMNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
PiANCj4gICBIZXJlIGFyZSB0aGUgdW5rbm93biBjaGFuZ2VzIHRoYXQgbWF5IGhhdmUgYmVlbiBp
bnRyb2R1Y2VkIGluIElHVFBXXzEyMzI1X2Z1bGw6DQo+IA0KPiAjIyMgSUdUIGNoYW5nZXMgIyMj
DQo+IA0KPiAjIyMjIFBvc3NpYmxlIHJlZ3Jlc3Npb25zICMjIyMNCj4gDQo+ICAgKiBpZ3RAZ2Vt
X2Vpb0Bpbi1mbGlnaHQtY29udGV4dHMtMTBtczoNCj4gICAgIC0gc2hhcmQtc25iOiAgICAgICAg
ICBOT1RSVU4gLT4gW0ZBSUxdWzFdDQo+ICAgIFsxXTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNp
LjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTIzMjUvc2hhcmQtc25iNy9pZ3RAZ2UNCj4gbV9l
aW9AaW4tZmxpZ2h0LWNvbnRleHRzLTEwbXMuaHRtbA0KPiANCj4gICAqIGlndEBnZW1fZWlvQGlu
LWZsaWdodC1zdXNwZW5kOg0KPiAgICAgLSBzaGFyZC1nbGs6ICAgICAgICAgIE5PVFJVTiAtPiBb
SU5DT01QTEVURV1bMl0NCj4gICAgWzJdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3Jn
L3RyZWUvZHJtLXRpcC9JR1RQV18xMjMyNS9zaGFyZC1nbGs3L2lndEBnZQ0KPiBtX2Vpb0Bpbi1m
bGlnaHQtc3VzcGVuZC5odG1sDQo+IA0KPiAgICogaWd0QGttc19jb2xvckBpbnZhbGlkLWRlZ2Ft
bWEtbHV0LXNpemVzOg0KPiAgICAgLSBzaGFyZC1zbmI6ICAgICAgICAgIE5PVFJVTiAtPiBbSU5D
T01QTEVURV1bM10NCj4gICAgWzNdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3Ry
ZWUvZHJtLXRpcC9JR1RQV18xMjMyNS9zaGFyZC1zbmIxL2lndEBrbQ0KPiBzX2NvbG9yQGludmFs
aWQtZGVnYW1tYS1sdXQtc2l6ZXMuaHRtbA0KPiANCj4gICAqIGlndEBwZXJmX3BtdUBidXN5LWFj
Y3VyYWN5LTk4QHZjczE6DQo+ICAgICAtIHNoYXJkLW10bHA6ICAgICAgICAgW1BBU1NdWzRdIC0+
IFtGQUlMXVs1XQ0KPiAgICBbNF06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2Ry
bS10aXAvQ0lfRFJNXzE1ODU0L3NoYXJkLW10bHAtOC9pZ3RAcGVyZl9wbXVAYnVzeS1hY2N1cmFj
eS05OEB2Y3MxLmh0bWwNCj4gICAgWzVdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3Jn
L3RyZWUvZHJtLXRpcC9JR1RQV18xMjMyNS9zaGFyZC1tdGxwLTUvaWd0QA0KPiBwZXJmX3BtdUBi
dXN5LWFjY3VyYWN5LTk4QHZjczEuaHRtbA0KPiANCj4gICAqIGlndEBwZXJmX3BtdUBidXN5LWFj
Y3VyYWN5LTk4QHZlY3MxOg0KPiAgICAgLSBzaGFyZC1kZzI6ICAgICAgICAgIFtQQVNTXVs2XSAt
PiBbRkFJTF1bN10gKzEgb3RoZXIgdGVzdCBmYWlsDQo+ICAgIFs2XTogaHR0cHM6Ly9pbnRlbC1n
ZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9DSV9EUk1fMTU4NTQvc2hhcmQtZGcyLTcvaWd0QHBl
cmZfcG11QGJ1c3ktYWNjdXJhY3ktOThAdmVjczEuaHRtbA0KPiAgICBbN106IA0KPiBodHRwczov
L2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEyMzI1L3NoYXJkLWRnMi0x
MC9pZ3RADQo+IHBlcmZfcG11QGJ1c3ktYWNjdXJhY3ktOThAdmVjczEuaHRtbA0KDQpUaGVzZSBh
cmUgbm90IHJlbGF0ZWQgdG8gbXkgY2hhbmdlLg0KDQo+IA0KPiAgIA0KPiAjIyMjIFdhcm5pbmdz
ICMjIyMNCj4gDQo+ICAgKiBpZ3RAZ2VtX3RpbGVkX3N3YXBwaW5nQG5vbi10aHJlYWRlZDoNCj4g
ICAgIC0gc2hhcmQtdGdsdTogICAgICAgICBbRkFJTF1bOF0gKFtpOTE1IzEyOTQxXSkgLT4gW0ZB
SUxdWzldDQo+ICAgIFs4XTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRp
cC9DSV9EUk1fMTU4NTQvc2hhcmQtdGdsdS0zL2lndEBnZW1fdGlsZWRfc3dhcHBpbmdAbm9uLXRo
cmVhZGVkLmh0bWwNCj4gICAgWzldOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3Ry
ZWUvZHJtLXRpcC9JR1RQV18xMjMyNS9zaGFyZC10Z2x1LTYvaWd0QA0KPiBnZW1fdGlsZWRfc3dh
cHBpbmdAbm9uLXRocmVhZGVkLmh0bWwNCj4gDQo+ICAgKiBpZ3RAa21zX2FzeW5jX2ZsaXBzQGNy
Yy1hdG9taWM6DQo+ICAgICAtIHNoYXJkLWdsazogICAgICAgICAgW0lOQ09NUExFVEVdWzEwXSAo
W2k5MTUjMTMyODddKSAtPiBbSU5DT01QTEVURV1bMTFdICsxIG90aGVyIHRlc3QgaW5jb21wbGV0
ZQ0KPiAgICBbMTBdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0NJ
X0RSTV8xNTg1NC9zaGFyZC1nbGsxL2lndEBrbXNfYXN5bmNfZmxpcHNAY3JjLWF0b21pYy5odG1s
DQo+ICAgIFsxMV06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlw
L0lHVFBXXzEyMzI1L3NoYXJkLWdsazYvaWd0QGttDQo+IHNfYXN5bmNfZmxpcHNAY3JjLWF0b21p
Yy5odG1sDQoNClRoZXNlIGFyZSBub3QgcmVsYXRlZCB0byBteSBjaGFuZ2UuDQoNClBsZWFzZSBm
aXggYW5kIHJlLXJ1bi4NCg0KVGhhbmsgeW91LA0KDQpQZXRlcg0KDQpbLi4uXQ0K
