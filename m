Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6582DEB28CB
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 06:38:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1500D10E395;
	Fri,  6 Feb 2026 06:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="binq22j2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2373610E395
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 06:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770359926; x=1801895926;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=lcsgsAWCgKk70K0uoYtCLQxJ5qZPU28cIV/dexDtvVk=;
 b=binq22j2Vtc+7OMIXdIY1w7wZb3Wk/A6OZa4obg6vmXjiYDYlhdu0gJM
 dgZZpZh7Ddd4lBgbMNDdquADnSI3o6sEMj4dvjYD5zFcHZUKi8dz9RU8D
 oNi0zMQxLnIzSrUnfFTXa0E3msC8Ro6H0POyjjH08/9rZCZFhVfrJOut4
 JofTiXdHbvUI3Q38M0LtfL6ZuVmW5ZGAFdvHcpjw1u/ZSJH2CD3FvuPCf
 Ky+c3rMVPmwB79LWbmJEaQtsAggFuVu9nX0frNZQHZR/awandPJfZyNeE
 q9AqYdWj4YphuputEroMJEshWzF7kWVkYbCAJbTl1JRnev+qQF+a6bfXB w==;
X-CSE-ConnectionGUID: q/+FDgjKTc6Qvj0BWAXQ0g==
X-CSE-MsgGUID: rRue6mu6S9qdjWSHAmeq5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="75422373"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="75422373"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 22:38:45 -0800
X-CSE-ConnectionGUID: rEmQ4dUtTEaq953aLiEAkw==
X-CSE-MsgGUID: 7EwPl6qZTQSSv09Dahj1lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="210156918"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 22:38:45 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 22:38:44 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 5 Feb 2026 22:38:44 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 22:38:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTkMaOb12+I9FPbQzmTWcj4f4Rk1JgoR2zPxs3Laiqer9Sel/xfWWCgeKBjZGLNsjP+llSWxjc7zh0xajR63toQRHGkMEzQD66qeUI4hrtN94MqaNoFHUfmzOwlNo3MKwkWl+dmzq5Lh226wm6/gOrXQBxqjYRgC+zocHytUJobUt2SJETvlFuQZUJS+9tfSrsXF+baeBp8Il/XL3/YpSfi8Vxu1m42dnfR+vjllal4vMYlQFnXuSwVQDZS3/E9w/LZuCwQenXEC42jzQEPKyg7YdgadHBt09NbGUhmh3bV985V4BcquBTA7FXOG1fjlDg90+Z0hzKETZSyFxsePdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcsgsAWCgKk70K0uoYtCLQxJ5qZPU28cIV/dexDtvVk=;
 b=OnagbsRHi7zgpTosKdAWZ8ad22eLiUKZwff2Mw64mm5/Q0Hfs2QVModXsFxa1hQNXRZNPmd6aLafyi5N2zp974qdmvh5816zuAqXOkZ+8GQGzITEKqfj+25P33GC4agu6F7g9eEvOY2fxdRjpzH3abOCOMx+tYQ41YFQsmFq10om+cIp9S3dZ8X/bWvSBd7Mn1GsIkm0Bi+ixMoUf92wkg7g0tX/9bpSdjWoDpqyyCcJwaRx8H5cBKG5UkZjrXaAN+Cxz/43MyPNk0rpEuSmvJud2ITaqQ2O6cH85VTPSKe+REAXoCjMzgWesHuOtja7Memhn9RoY3rcD1km1MLuyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SN7PR11MB8027.namprd11.prod.outlook.com (2603:10b6:806:2de::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Fri, 6 Feb 2026 06:38:36 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%2]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 06:38:35 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: Re: [i-g-t,v3,2/3] tests/intel/kms_psr2_sf: Check pipe and output
 validity for Selective Fetch test
Thread-Topic: [i-g-t,v3,2/3] tests/intel/kms_psr2_sf: Check pipe and output
 validity for Selective Fetch test
Thread-Index: AQHcly3IBzBmzSWG+EuT1Lra/wY4drV1OBIA
Date: Fri, 6 Feb 2026 06:38:35 +0000
Message-ID: <ae10264756be3b8e28163e35461f772884858262.camel@intel.com>
References: <20260205070425.300934-3-jouni.hogander@intel.com>
 <89144a93-6330-4323-8905-5a3d4abd572f@intel.com>
In-Reply-To: <89144a93-6330-4323-8905-5a3d4abd572f@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SN7PR11MB8027:EE_
x-ms-office365-filtering-correlation-id: 2198c9ce-2738-447d-514a-08de654a5ad4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|10070799003|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?ZVFwMitUdStCTXNINlhwUG9CdDNzbS9RV1hhQlNQTXMyZVliKytSUGFFVFFL?=
 =?utf-8?B?N0x4YXdKN1Fjdmxzai9zb1g0bEM4dnpMckhsT3VjNDBVSkQ3ZWRJQjBudGxV?=
 =?utf-8?B?QWxWSzlwRnBDY3NWSi84VmVPZ1cycWM1N3g3Rm5namI0YVVGc2VIL00rZXU5?=
 =?utf-8?B?aE5TT3BVR2xoWGdNZ2p4bVZjc3dmR1F0UW9ML0JrVjVlR3h5WVRKc3E4WEdG?=
 =?utf-8?B?elNsbHBVZjZxR1dSd0V2aUlEd2ZTaWhzdW95YkVHbS9JcmVGNjBwc0ZkZXdy?=
 =?utf-8?B?SXpGRk5sY3lmUXdSVmlDUlBsZS9yWFMvcmorYlBiTE5MSlZZYWp6bFdBRSsw?=
 =?utf-8?B?QmdnVTZqMlk4STV1dDRZbmhLWGJNcFV0V2I0ZUMzU0svZksxOGpOSzVRdDJ1?=
 =?utf-8?B?cDlGY285S2lac3JqYnZYWHBwSEl6N1FrZVIvM21mcDZ0MnBtUUYxcXBBV3Nl?=
 =?utf-8?B?NERmd21sTjVGM1Q4Yndnc2NrWG9Rc2I2ZlhqdFVoMlA2amdnWWlSbXQ3RXpK?=
 =?utf-8?B?K056VW1vRkYzRkY5ZmxzTC9ZWjFIcHFiVWFqK25LRStiMm90UFBWTnBzVVp1?=
 =?utf-8?B?RkpEZDN2REZWd1hEa2VHR1loV1ltQkhwOUdkekNyRE92ZVBxOVJ6eFFrZlhy?=
 =?utf-8?B?TW1yRW5zdVpFbXdGVmJTMXRPS3hXc3ZJQ3hmWHcwRVErR1R1N29qK3ZKQUNo?=
 =?utf-8?B?MTh4WnFTK2VGSlZYMFJlR0lGM3RqTk02a09yTUVQbFJTenprUWdvcGtJMXZh?=
 =?utf-8?B?azI2VjltOEp0OVQ4QXdoTWVBSzltMXh4Y1p4U0k2QjZzamxJN3lKRWY4bWkr?=
 =?utf-8?B?djRIQkJhTElBYlNBZzNTYkpXbGRjMUVHVUtLU0FocjB6dEVIRWV0U3h4U0VH?=
 =?utf-8?B?VUZHSHA1cXViTDR5WlcxTFB1RmRhT1Y5a1d2VU9qTENTOGREZTlSUTFpZzZF?=
 =?utf-8?B?QytVSGlRTXoySFFUR1N2RFloVitlelJLRlZ6RVF6ZFlPNmRtSnAvd0kvVzZX?=
 =?utf-8?B?azZxNkpxeloyK2c0bzhPRzJZWXpHRExCbFQreDUvcUVxaVJVWmNaem01eHNM?=
 =?utf-8?B?MnNVdXdtdjVvSUNOL1EzQWgyV1RXeU43a1NGdlUzYXEzdU9CNXkyM2ZFd29i?=
 =?utf-8?B?U3pxY1g4U29lMXVkdGUyTHdFVEZHMlNxVDluVkpTaEpiTGJlcVNDR1ZoelI5?=
 =?utf-8?B?UkE3WjU0ZmFsWldBTXk1UjNQb0M0Y2RZSmUzYW9IREZ5eGhvVzJsUmhsbXRS?=
 =?utf-8?B?VHN2a3lqRVAyTlpMYUFseEZ6U2I0cnZQd2tpeGFQK3dZQ2Qvcjh5cVFTM2lr?=
 =?utf-8?B?WUhsenNCMFM3K0tOaVJsZ0ttY3NTYjBpWGRDL1Y2Sm94RmZXamx6VFBJai9J?=
 =?utf-8?B?cEFMUjhXTlNpUWJ0R1VRNWRPVEMxVG9ocklqY1VmWFlzcVFnUC9ScnVWbzZ2?=
 =?utf-8?B?T0thYkozcUxjYnpZeGpjc0o3UHdVdExMVzlGc1VUZUlRaTRWU0x6OElRa2p6?=
 =?utf-8?B?dzlnRkJKdXoyVE13eGdtb2M4bHk3R3RpSENGVjJZbHlza0NJTVJJenltK2Vk?=
 =?utf-8?B?RlhaWmNPTUtpMWdpdFloTS81K3VxODZuSW1CQUR0WVZEdDJLSlNGNnRwNlhi?=
 =?utf-8?B?VkVKMkRyQWF4MjZib1FoZnI0QzBNYmJ1ck9XakZ1QVh3NVUxaFo4RlBWQkU2?=
 =?utf-8?B?NTJQeGhnK2drZkxWWWdKZnpjTUVEallQU2s2LzNENHBlbXBNK0E1dXRUSWdQ?=
 =?utf-8?B?SzExMm5KSWVNakpCSTlnMDc5Z2xTdUpUa0JmeloveUJjcC9sTHJyd1RJaTVi?=
 =?utf-8?B?bHZlVzNMWEMxTjRmYlBTa1pvaEFvWmxDYVZzZmtSeWh1TFNlN2h1L21FVjZK?=
 =?utf-8?B?MHlONGFXVVZoMlZXTEVKckZ6M0grRU9FanhzRXMxcW9ObHJnQ1lZM1VoRkVN?=
 =?utf-8?B?cGx2bUVYMUo5VENvbXFXS2tMUytzL0U4eUh5ejlRMi9Vb0NlbDlnZEtQZkJs?=
 =?utf-8?B?VWhQQnJkV3JHVmZaTmN1THlPa1JVVGp5T3l1RWpVMERwVndzWlRCM2VySGln?=
 =?utf-8?B?WkRFV0pnQVNUdDZxLzRrMmRjZThoSExURys2MFFUSlNzRXlLUlRzTm83WTJB?=
 =?utf-8?B?N3I1N2RMU2wwd2tpTFZmYkZEK3FDUnFIYlJPajdaTWF1R0FXSEx4UDRBSjRO?=
 =?utf-8?Q?/LMaUCUeW7BG1mhZRJxbzBA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N0xQN0lZOVBSajNmRVdSZmRpd1BiSjEvaVlpTTJHMDZmSlVpVHk4MnJYbEV5?=
 =?utf-8?B?RG9KcFdvYUw3NkdHU2Q1a2ZuYU5zRmR1dVpZdnMrSlFJaFkrNTVCSndVQTA0?=
 =?utf-8?B?eTlrd3dNUWVBRTBQSFB3ZFR1elFjMzVEem1uOWg4S2w3NVBWeWhDOUhqTmwr?=
 =?utf-8?B?UUZmdVd4TzdmcVl1S0xhL1Y3ZDBhWG1ESkplb0RnSG14WVJ3dDM3dmQvWVJl?=
 =?utf-8?B?SGNFWkltMUlWRUxzNG5aZGF0bkV2UFpWMVVmWGVKdExsUHdXT2dvRVpNdDRp?=
 =?utf-8?B?U0JqN0dBSDdDWVdjdFZUang5YmRaSU9kWmJKSnlCVDFXNHZBZXJ2ZE00YzJO?=
 =?utf-8?B?RGFLWk9ra0RtMnlSZnNxOG9Ma1dUSndXaTlaVG1hVk1xNFNqVVVWVE94eWs1?=
 =?utf-8?B?bnExd3lwZkE5KzVDU0VvVU1QeVB6WVVPdm5VUnBONVVkQlFpRVdjNnhyUVpo?=
 =?utf-8?B?eHB0eVErNFlOaGRqMmRuWldpTUE4TGpieldaWEE1T0pjQXMrUHZFTjNxclh4?=
 =?utf-8?B?b3loZUtyT3FxOTl1ZzUvR2NGQWlzQ0lIYytlb1l6Z0dvdFVjVEIwZ3JuY05M?=
 =?utf-8?B?ekI1dExsNS9PSWhRbWcrSXhYUkIyOUY4dUlndldxcjlvd0lkNmlSYThrdEpN?=
 =?utf-8?B?dDZpeGJVaERBUTFLSHBlTCtHLy9YSDE4bUpPZDlweDRrN0JyY050bVNJNE1W?=
 =?utf-8?B?dXlENFdxcFdwM0NCdlFDeFUzRlJZeXRMdXAzNTZadEN3SlVac0c4ckFIM1FV?=
 =?utf-8?B?T1hUTDNONXdUYjlJU01WYWpicVpEYThQSEsxZFFsdU14bjhIUnU4U3FTUnR6?=
 =?utf-8?B?TWQzU2RJL2RXeUhNcGZkdkdJUE92YWoxNWZBZ0h2TEUveXg2NzZibVRuNHhs?=
 =?utf-8?B?Y0Fxai9iRHduK0lYNHY3a2s0Qk9Zam5aNFZZdmsxVUVNdkZvbXJaNXFvZUxt?=
 =?utf-8?B?dUtpUEpJZmlFaDlmaWsxUkZaMFk0R2dSemhhSTByYU8zcStIeHUxQit5SG1k?=
 =?utf-8?B?NG9yUHM3b0NBVDUvb1p4UFJjUkcvQ3Ayd2hHU2JiaTY5WDZjTmk2a3VKaCs5?=
 =?utf-8?B?cVQydWJpMU1Bb1NpbTdMNTNwM3NuYVV5K1NscGpaTkJ4aFJ6a05oa3Mzb0Jm?=
 =?utf-8?B?VHZoV1RvL3M3N2pTaW9wbHdUd04vZTlkdGxUeWVpcm43Nm54RkE0WUR5ZmFT?=
 =?utf-8?B?b09JcDNUemZVMm9pa0JYSU5nUWZlL0N4Y3Z1SHZjWExRNlFzM2w5TXorZXRp?=
 =?utf-8?B?dFRURmkrQStZZjE5Z3phcFF2Z1lGWlJnYlJxUmNNc2kxc0MyVGhWTGpidVVL?=
 =?utf-8?B?cTVtM01aNjVENmNmVmJBQTZIamp0elV2L3kyK0txck5pMGU5SCtpdDAwKzNJ?=
 =?utf-8?B?SUI3Y3N6WUJvNXVtc09JUjBwRHB0a1dlSy9xazRPUEYwWjZpQVlKeWlFTG9r?=
 =?utf-8?B?Z2hRMGgyc0tWbE9wNHpjeUFIWlA1eG95OHMwWXV1cVQ3bFBxazdVdEZGV1Nl?=
 =?utf-8?B?T3RsU1owTFBQcFR3enRWbk1qL3RWQnplL1B3NlJPVTIrUGo5WFZhVHVwQ29P?=
 =?utf-8?B?dndGdkV4Z3lkRDFlNnVENHZrbnpKdUpOelgzaUpoN1NSYU5ZdGd6Q2s1UE9F?=
 =?utf-8?B?ZUZDSyt6K3VnaVdENzk2YVBmd1FBaUs5MldEMkc2RmtMSC9ZUng0Q3VsalBV?=
 =?utf-8?B?WE9SdjIrbHpiU29rRFE3ZXV2SFJVTHpML00wK2RpeDQwdmhnRWdEN0E0Rk1x?=
 =?utf-8?B?eHh4V21zWTBtSGtZTElXY1ViOHZWNW9RbmFmeEJOdGJtdm9ZMHBPYXhhL2Ri?=
 =?utf-8?B?Y0NQaHlwYXovNXBYWi82bVBBWndDZFI0UnByMm54OWx6SGtwOEdYdm9VTmd3?=
 =?utf-8?B?Y2tNVFlKSFkxWmJxYXpQQ0ZCZWw5N1lSVDZOTnJSNVMwSW1NYXFlek1Ba0h5?=
 =?utf-8?B?R0J1eXVMR3NIcEpJWUVFZ3ZUZXdnRjNWN3IyQ0QySm1ucFpnRSs2dkFiYlFK?=
 =?utf-8?B?emdMeVFXbytKVmFwVk8zNXM5a1ZTS0NBQ2kzYlJNKy9EMnZvSFFaa05uTGJ0?=
 =?utf-8?B?ZHlORHFWNDNTVFEyTS9hVXltN0xPWjNsVWFtbGcreUZJWTRGSDE2SnM5ZjJD?=
 =?utf-8?B?OGZqdGZ4dWlYck5rdHhBRk1wRjEyYUpjNVhnRUxXZ3U0MDFSZjJVaWdjMFJR?=
 =?utf-8?B?d3FFWHAzazg4aFd2ZXpYd3RVbGhxV2hVeHl5MmY2aE51K1k5Um1YNWRKbjg1?=
 =?utf-8?B?dVprVHFyOEtpT2FoNHU0eDdySkVndm84bXY0VjI5TGdMQk92VkZOWS8zUjlj?=
 =?utf-8?B?VnpLVVAyRm1Da2Rac1gvQ2lqS1JWWGNPVzYybEdpdG52TGowWjJ5Wm1YZjRa?=
 =?utf-8?Q?Bc+44alcKRK5GNqNL8puJ4WNn6vXAZRL+ZmMTLAF9L5kY?=
x-ms-exchange-antispam-messagedata-1: gmiM2kdeOQbWujOkaxBsXBpseI9oRmClLuU=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1BFA74258869B54E933844B289E4746C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2198c9ce-2738-447d-514a-08de654a5ad4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 06:38:35.8530 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MK/LPyNe4yLZ8fnUH76IzUFlVU60oHHM0eNasFks4jeuwFBqv84fz03ktElK+fG+RjLUoOWyuAiC6CglgNtatGet7bKV0QF1T6BD4UHrQsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8027
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

T24gRnJpLCAyMDI2LTAyLTA2IGF0IDExOjI4ICswNTMwLCBKb3NoaSwgS3VuYWwxIHdyb3RlOg0K
PiANCj4gT24gMDUtMDItMjAyNiAxMjozNCwgSm91bmkgSMO2Z2FuZGVyIHdyb3RlOg0KPiA+IFRo
ZXJlIGFyZSBzb21lIHJlc3RyaWN0aW9ucyBpbiBwaXBlIHVzYWdlIGZvciBQU1IyL1BSIFNlbGVj
dGl2ZQ0KPiA+IEZldGNoLiBJbXBsZW1lbnQgaGVscGVyIHRvIGNoZWNrcyB0aGVzZSByZXN0cmlj
dGlvbnMgYW5kIHVzZSBpdCB0bw0KPiA+IGZpZ3VyZQ0KPiA+IG91dCBpZiBwaXBlL1BTUi9QUiBj
b21ibyBpbiBkYXRhX3QgaXMgdmFsaWQuIEFsc28gY2hlY2sgaWYgdXNlZA0KPiA+IG91dHB1dA0K
PiA+IHN1cHBvcnRzIFBTUi9QUi4NCj4gPiANCj4gPiB2MzoNCj4gPiDCoMKgIC0gdXNlIGRhdGEt
PmRldmlkIGluc3RlYWQgb2YgaW50ZWxfZ2V0X2RybV9kZXZpDQo+ID4gwqDCoCAtIGNoYW5nZWQg
SVNfQUxERVJMQUtFX1MgdG8gIUlTX0FMREVSTEFLRV9QDQo+ID4gdjI6IHJlYmFzZSBhbmQgY29t
bWl0IG1lc3NhZ2UgdXBkYXRlZA0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvdW5pIEjDtmdh
bmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiBSZXZpZXdlZC1ieTogS3VuYWwgSm9z
aGkgPGt1bmFsMS5qb3NoaUBpbnRlbC5jb20+DQoNClRoYW5rIHlvdSBLdW5hbCBmb3IgeW91ciBy
ZXZpZXcuIFRoZXNlIHBhdGNoZXMgYXJlIG5vdyBwdXNoZWQgdG8NCm1hc3Rlci4NCg0KQlIsDQpK
b3VuaSBIw7ZnYW5kZXINCg==
