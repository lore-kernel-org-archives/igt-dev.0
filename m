Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6320EC1E99
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 11:10:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF0210E84C;
	Thu,  5 Feb 2026 11:10:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uln0W01L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6980A10E84C
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 11:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770289807; x=1801825807;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=rmpLqLxFeqrdr6UlzKHjPmOiFivXPJqriZvVRYzkd2Y=;
 b=Uln0W01LgILFGs2/ROnD9AKAnyKeTRlji2sDlqlYh0Yf1HIPZV9TsYih
 7HnGqjh5QKFP9a7QaI2DtDGVOMS0uLV7E0KAHaRIVIgd2/NpSsZ/3+pyX
 vTIgSYgESJDumbKcFi+WPbIMLGZgbS1P4Q41eu5+Pb4H7fm0ICt3OcTxh
 IeF4mx5ebwoomCYbvpAtwS3K8WzeWUJ8d/AJWJfQcb/onaTrIe9cpCqFs
 WMUyqM/93EAEBTihn5uM2i8NAHP8OiYYbmtqO68oII+caX8tksl0taIhE
 G59F7H9fb7LTxgIgZ2sn2Rt4uATWjaXvam2Ob4R/448nylGmNBGMM/ecF A==;
X-CSE-ConnectionGUID: vjb8g90KR32qJfmywL4iHg==
X-CSE-MsgGUID: w4StABfsRcecOluBEL7Nnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71381439"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208,217";a="71381439"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 03:10:06 -0800
X-CSE-ConnectionGUID: s3vWlMFeRU6ChXnnd7kIqw==
X-CSE-MsgGUID: amFBze91TIyuSNT48pQu5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
 d="scan'208,217";a="210458006"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 03:10:06 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 03:10:05 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 5 Feb 2026 03:10:05 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.38) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 03:10:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ni2U2IlPiIWzPsMeNigBIEDRmSFTu4lr9xZ90wQO7ro16WOt56yJoG3ThaKqPRO4+5HWdAoIC1hZZruFO4X84zbArzKh45YNOqcoQFR+Awks+UF1z1yliPtlMwCKHb8Yi3agUdxJR1fnQaz0QAIZWlgg8ndXy4M53L8hXzu0O9Gy3qUF2lY6Pmy3cC/q5OK3KviiL3vSR/HDSgY8UknI0oAuhFs8FTsrH12rorEn4qcAUZJmdZxyMY32RjFzMUjLd4oWGq7F2mTfnRWlzj7IuSUUG822jiFER7j6C1k/eITEgdreinOZJM7qcylIPUYmGs5ADwKdQ/oUcw/mGTBxHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmpLqLxFeqrdr6UlzKHjPmOiFivXPJqriZvVRYzkd2Y=;
 b=RWb+rdyVdndF+RmiXEy969bH5E+EDxcfXHm6M1ylJZMZRaommhJCm1quIs8V1FfTNAaMinS9fGr7OVL29sshm1pP8hlDxeK1s/YItgvK9m57ybBeHgbnKFQ5kWCKIL7qbhEAa3+sbSDyu8wHTRaF9F4k+LBo2YwZRMuPHNtZTgzlX3njf3W9wIpb5VAGM70qGrf3GAwXvSAtRfV/ZhMC5Pq7guMsJvw2W3Ddk+iPyTtnhMB3BSwxaBwDP6ifpQ/9pZhCvaOudxhwyzJMp6GU9RjfAHTmNR0N4rLONv4tSAfBhmb0x8SD7YYeoV3gGxHbcpQp60qLdr1zvzgRrCJgSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by IA4PR11MB9442.namprd11.prod.outlook.com (2603:10b6:208:55f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Thu, 5 Feb
 2026 11:10:03 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%5]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 11:10:03 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>, "Karas, Krzysztof"
 <krzysztof.karas@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v6] tools/gputop: Add GPU frequencies to the client
 headers
Thread-Topic: [PATCH i-g-t v6] tools/gputop: Add GPU frequencies to the client
 headers
Thread-Index: AQHckeWCuQg9jNLLhECQSvcVjA4+ArVy03WAgAEnzWA=
Date: Thu, 5 Feb 2026 11:10:03 +0000
Message-ID: <CH0PR11MB5427B86E9D70CA448CD547B19899A@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20260130122954.2236101-1-s.sebinraj@intel.com>
 <20260204172807.f3djzjtivzobwrbk@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260204172807.f3djzjtivzobwrbk@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|IA4PR11MB9442:EE_
x-ms-office365-filtering-correlation-id: a1478a73-3207-42c8-5459-08de64a71c5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|8096899003|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?big5?B?bkVlTytvcy9qU24wSEFPTVhUZnJMTW5RWUlMMkNGaDBNM0RWakR5Zk5MSktUTXFM?=
 =?big5?B?alp5S3JTZjZlbHdNdlRRc3JRMzJPZFF6Z2hJYkVsdDlNVmhoNHo5L2R2aU5GSzBx?=
 =?big5?B?djV2cEhnOTZyUGlyWmthejFESGhpei80WTdhQ2hSVVFJZDVSaE5wKzdTRXBLVmQx?=
 =?big5?B?NllINExBaUszSUh5VUphb1MyVHBCU0tuM21hRm1rUEZhd3ljS2tldTEzcDlOQlNV?=
 =?big5?B?aDlJcGFsaFA5R1hZWVVTT0Z4M0FzaVN0UEVYUVJXS0tNbW5hTlMrSENuU2pmNGFp?=
 =?big5?B?eFpIckNoaXZuSHRGQWFFc2xXL3JRSTlEWWFUeEVLUWo0eDJCMi8zRW8vYjR1VUll?=
 =?big5?B?dFphZW1FQ0g5WGMwVSs3aHRCQlliS3JLWGd4WmVJakVKVk9oUWFVR1pRdGxsU3VH?=
 =?big5?B?WDVucXk0Ump5b0JZT0pCK0JDa3R5TlFpUUtUWlNKem9XQmdRczFwczgvbWZPazBS?=
 =?big5?B?MWxCR0xzZVZ5T3NNc3VTOGdGRUZ0dFptWTFHVlVaVnBjRUlqZGcrOTZ6eVkrNndy?=
 =?big5?B?Z3p2czdCUTQzYkFnei9DVy9zYmtrV0oyQUN3UCtjTnd4NUtHMExhcmlacE05SFBE?=
 =?big5?B?SkIxQzAvQkZjUWxtRkFzalU1cWdpQzNuWGNUT2NydXlnZzBNbjhiMjIwaHpXNTlG?=
 =?big5?B?ZXNvc0w0WTVwUmZIR3VuWTc3OHBKSFZ0Ri83c3ZUR2V3Z2JWSFdIUnUrc1J6TEZZ?=
 =?big5?B?TDgwQjQwZmIwek9iYzhWRjJsZkhOWWpNaGh1bzlCZW1mTnEvMnd0WGNPUFozYnIz?=
 =?big5?B?T0V1ejZzeWdtNVFyZEhySVZhMGhpZkwwelBXdEhuWGxmRXZhc1hqYzVUdDhXUVQ1?=
 =?big5?B?N3QrbFNYejlqalM3TXhKTEw3NVg3WGNmMmJUbXl3VEk3VTNmMXJSZTU1RGl4YWVl?=
 =?big5?B?UFlxT0Uwa0dHRmgzOGpoRjJJOHFYaDVkWWx0K2ErYVN5eWQ5dEVoQW9HSUhqTnc2?=
 =?big5?B?Sy94TGVzSlZHQUdvQmlNV28xSkN3aDEySVU1WXlCVTkvQ3BiMWo4SERTL3J4cFhj?=
 =?big5?B?OEJ1UVpFQ2xSVFVjYXhKTHZSNGd4cmlTZDdvSzBtendWTXBmeVI2b0pvejkrRjFt?=
 =?big5?B?R0NUSFAveW82bm1jcjR1NGJaYy9sRVZyZUZBam1wS3hmOGI1eWhnUjNDN3EvMG5p?=
 =?big5?B?RGdVSWlnWWpaWXZsSllBbUdVWThTZEdDcTVSendvK1ozT0ZCVVVJaS8xMlBRZ2c1?=
 =?big5?B?UUZZMDlKSWpHaDU4WmQrWVZJSmNyVG9OU2dIQXB2azFWdk9Wa0xwcXZhT2hMUVhN?=
 =?big5?B?NzdKb2VpaXkrNVZ3ZzNJRThHOHVxbEZaazlRZG1BUlFtNHArT2l0QW5UKzgydWRp?=
 =?big5?B?aXlMTE9ZVXhGR1M5OFd0OGVkclVNY092NVR2MytoV3RPNlAzZjdGSDUxYkFXMjJq?=
 =?big5?B?ajhNb01pdWNncWVGaHlQekZnR1RqclBFUGxqWlFTYk1zekJIdlRUbjdCUjZlVUlN?=
 =?big5?B?K2MrMG5CUzZ3bXFrZU8xK1FNNERKYjR4MTVRWGJOSkxIZnpwb3BjYTdIYmNpUDJx?=
 =?big5?B?TVg1cCtncnhVb1BDWjZBRHlpdjY3TGNYeVI2dURNdEFCOGc4N0NUMkdXZlFGcndn?=
 =?big5?B?UE10WGRSRm1BU0RybHdMWDVPZmI0YWdyZ1N2dUd4dkdQS2pIZWlXREZ0dVZ1Nzdp?=
 =?big5?B?WWhJcThqM1FITzl4c1B2REpLS3Z1K1JBYzFiNWFJbmZBM1A1UURGbGZvWE5wMkdq?=
 =?big5?B?bjhtc3BSL24xcWFjSzdkNEwxRVJHZEVacUdBbXdxRUtnSUkwNUhUMC9VOVVFV2hZ?=
 =?big5?B?YlRJRzJkblUvSFhGZzVURE81Yzk4OTlaaW0rRlhzWUFmSlFQNFVVVGVLc0pkTGFJ?=
 =?big5?B?aHVPQlRtSzRnZmpoeVR5L0lheUtGejh3TWVlVWZJRWl3ZG1RRTBDTXdGTXFHeHpP?=
 =?big5?B?c0poc2dLT3M0RFluMFR5WmxDU29ySzVlQnp5YStHZlVTdG5JQ3hnZWxnMkYzSjZB?=
 =?big5?B?b2ZlK3lEazUybDNIek1adkRpNHJPRFFVaFNsMWE2SGRoN3dpbU5rMEVzanNWKzBy?=
 =?big5?B?STVQRTJ6aW1GTVZOQWt2R056TE9BK0tjUjhOTWxIWHR1UytlUUV4T3AxbG5US0VE?=
 =?big5?Q?SJxfXK9N8TQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-tw; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:;
 CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?Tk5pOWdRVmxqNnkwYVE4QVpWaWVjaFhaNlFselB5YXFHbVBsUGtyWVhrSU9zZlpx?=
 =?big5?B?V21odit2c0JRMUhRRkFqZGJOMzgyZUo4M3J6N1FUNlpGcmMxME9XQktwRURRalF2?=
 =?big5?B?L2FPK1Y2ZHMxUDV4UVpGeFdEOGNNcUl1TXdpZlNPVjVoWlhEOTI3RWxsMVh4SG5k?=
 =?big5?B?c1NFSEFnZkgxRG41enJoTGNyUEdxbkpaajMyeExxTGtIZ0dnVjJYcDFucldsVFJw?=
 =?big5?B?NUZmT08rUHA4cmhJdUt2M0g1QmxaeE1rVkZJc1NLa0hQQzAxTndiY1BOMkNQSzUy?=
 =?big5?B?T29JcityOXZaM1IwV1BwbDd2S1F2YU42eHRDR2t2SExaVjRhVlZjTGorc3FUSVlY?=
 =?big5?B?cWdkKytORCtpNTkxWnlMemc4eHZaMy92a2xNVVRXWVdTMHRGZytGOTlMR054M05o?=
 =?big5?B?UmJPUTBtNmV5N1VsNkxlQW8xdUZWRHVPdXR0czB2cUJnUVlLTzNQamVINkJrOG11?=
 =?big5?B?bGV5S2RVWXFJTjRKYy9rN1pHc0grTE1EaEd0bEhrVDZlWGo0TVU1YWdrT2JFTUVV?=
 =?big5?B?Z2RCeWRNQXdPTGw0eVhSd1NLNUxaOHRkSEd4blR0Yjh3ZEwzKzkzNFRSU0tkNHIx?=
 =?big5?B?M2tJNEV4U2hzRmxkUzBsSURNVWJmN2FyYlpHY0laWGI0UFhzWndjNjlENk5kcXN5?=
 =?big5?B?eDJuVll0WFpuanUxMEFBYzR4Zm1LZTNQbDZSL0tSQXlValRLS2d3STBkNXFZeEZT?=
 =?big5?B?R1UybmpXdWIwd3ozSGNjb0gwaGNBOHR2ZHIxYUk0UUpPNjdNUGdwMXFiL05yTW5y?=
 =?big5?B?bit2Q25rNFRVdUdMdS9XVmNSOWR1eDNUS3FhT255KytSVWtlUmo5NExXZFZ2dlJS?=
 =?big5?B?WFpDc1VYUWNNZEJ2b1Z4WjRaTEhjMjZQZG5qWEFRTmNjQWl1T3krRTcwMVJxNVgr?=
 =?big5?B?aXRBN1kzK3dieFNsQ2ZsS2N2VEU4c0RaeDcxc0FmNWUyTEljeEthVzN5MjdPL0kz?=
 =?big5?B?dXpZanlTUWVOSmYzcGM5VWVqa05qTjlNelhwaisrVm5pQVpiTlpXemV2WjE2TVc0?=
 =?big5?B?b1lKYlNMczVTeUdLbVF5b1hxRTFjcFptYmpsVm1aVEZlZlMxci9pSGFVN3ptZy9n?=
 =?big5?B?Q3VwWGtSZXc1M0d5MVBNa2l5YldzYTFOYkFOcWk1NUZhVkpzdktaT1pvUTdOVDZH?=
 =?big5?B?V0VsQ0Zyb2NYOWIzT1RJaGVhblc4QlhGSDRkWnZvYzNSVUtKYmhKaUxVdDVzSEty?=
 =?big5?B?dWhaVHRGMHV6VmZxZzRDQVJwYzF2REpIbW1tRXdWT0g2Q3dYa1VYdXNEMDVSeVNY?=
 =?big5?B?dHNKZERjMmJRZjJoR0NnVDBIL3p2Q0I4TWlQUTk3V1pPdTFaNy91cG55L2lHdkVz?=
 =?big5?B?YzVZRlkxdUJBSk5tQ25ZaThOMEczc2xMTHYxVjZSY1IrOURPY09TeUMxUFZraVBU?=
 =?big5?B?SXJCdmhYS1ZWZUJRTkpmeWs2dktzVE11VkpQWnYraGt2REIvRy9UbFJkWWxMaWFY?=
 =?big5?B?SHljMXpZa3RTOGVHVkZYbm4zckRyMGlOeVl6N21nOCtVWG9sQ211eGV3S1RBSi90?=
 =?big5?B?cXRBekttOXMrTnNoR1RLL3docUpYK0hzRFpRaU9lVWZRMTJGb1VDTlRFbFFEL2hW?=
 =?big5?B?ejFrRVY2bUxOSXI5SkYvcDZXUUljTE9ETzM2L0ZZN0tadEwyU1kvZXJjV1BSb01O?=
 =?big5?B?UXI1cVNXYUpNaE1VNnhocWhrVERUZG9UU0hBQjhQU05CU1Z4cUJWVEhJNkViUFZu?=
 =?big5?B?bXc4cmNvdlZJUERLUGhXaUF4M0RlUDljeVV0eUlzaDAvVXovUDhsaTB3Yy9aekNR?=
 =?big5?B?TlVDSWlIeWphdjNjZUh5YTdqSTUyM3pJdE56Z29IZUdBTU9Qd1Q5SVM3SHgwMTdG?=
 =?big5?B?NlR2S2xFU0htbVA4WjFYZUlrMG95Z0lacWZlZlhsYjF4NTFSTitDZXZCVVlmNVpN?=
 =?big5?B?N3V5TEtveER4YWhQUnVoODlWZER2VzVZMXJabyt0OWduWXA5WUZRZXJKOW1YYlZm?=
 =?big5?B?NTB1Zkg5SktCcGRUSWM5c0RVZm9TdGszWnZGc25uUjZjd0xFVHhsMDg1czBOVHJS?=
 =?big5?B?VGFrQkRJTm9SUjhOdXVOcFpCeExCdFFsYS8zU3dHeWo5clVyOXpjMzNub2QvV2t5?=
 =?big5?B?WGNhN0cxRWc4SkEzemhCVkdBSGtwTUl0WGd3a3poY2JMSndjL1pxNXROcFB6MmtQ?=
 =?big5?Q?5IXbVG1hpD9LK51mCvWhMEDSwOadnsysGE1yov0LdFn/95MZ?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR11MB5427B86E9D70CA448CD547B19899ACH0PR11MB5427namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1478a73-3207-42c8-5459-08de64a71c5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2026 11:10:03.0835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yqVHhsVuLKsSftuKRxf7BvJojm5/4X/cRMyPmD1lP2Bx0ZBPunNG5piUqV18dyCHFe6TGuySgVD2zo0tn64h6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9442
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

--_000_CH0PR11MB5427B86E9D70CA448CD547B19899ACH0PR11MB5427namp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

DQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCkZyb206IEthbWlsIEtvbmll
Y3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NClNlbnQ6IFdlZG5lc2RheSwg
RmVicnVhcnkgNCwgMjAyNiAxMDo1OCBQTQ0KVG86IFNlYmlucmFqLCBTIDxzLnNlYmlucmFqQGlu
dGVsLmNvbT4NCkNjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyA8aWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmc+OyBCYWRyYXBwYW4sIEplZXZha2EgPGplZXZha2EuYmFkcmFwcGFu
QGludGVsLmNvbT47IEthcmFzLCBLcnp5c3p0b2YgPGtyenlzenRvZi5rYXJhc0BpbnRlbC5jb20+
OyBLb25pZWN6bnksIEthbWlsIDxrYW1pbC5rb25pZWN6bnlAaW50ZWwuY29tPjsgS2VtcGN6eW5z
a2ksIFpiaWduaWV3IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+OyBQdXJrYWl0LCBT
b2hhbSA8c29oYW0ucHVya2FpdEBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIGktZy10
IHY2XSB0b29scy9ncHV0b3A6IEFkZCBHUFUgZnJlcXVlbmNpZXMgdG8gdGhlIGNsaWVudCBoZWFk
ZXJzDQoNCkhpIFMsDQpPbiAyMDI2LTAxLTMwIGF0IDE3OjU5OjU0ICswNTMwLCBTIFNlYmlucmFq
IHdyb3RlOg0KPiBFbmhhbmNlIGdwdXRvcCB0byBkaXNwbGF5IEdQVSBmcmVxdWVuY3kgaW5mb3Jt
YXRpb24gKGN1cnJlbnQvYWN0dWFsKQ0KPiBmb3IgZWFjaCBHVCBpbiB0aGUgY2xpZW50IGhlYWRl
ciBsaW5lIGFsb25nc2lkZSB0aGUgRFJNIG1pbm9yIG51bWJlci4NCj4NCj4gS2V5IGNoYW5nZXM6
DQo+IC0gQWRkIGdldF9ndF9mcmVxdWVuY2llcygpIGZ1bmN0aW9uIHRvIHJlYWQgR1QgZnJlcXVl
bmN5IHZhbHVlcw0KPiAtIFN1cHBvcnQgYm90aCBpOTE1IGFuZCBYZSBkcml2ZXJzIHVzaW5nIGFw
cHJvcHJpYXRlIHN5c2ZzIHBhdGhzDQo+IC0gRGlzcGxheSBmb3JtYXQ6ICJEUk0gbWlub3IgWCAg
RnJlcShjdXIvYWN0KSBHVDAtZnJlcS9mcmVxIEdUMS1mcmVxL2ZyZXEiDQo+IC0gRHJpdmVyLWFn
bm9zdGljIHN5c2ZzIGFjY2Vzcw0KPg0KPiBUaGUgZnJlcXVlbmN5IGluZm9ybWF0aW9uIGhlbHBz
IHVzZXJzIG1vbml0b3IgR1BVIHBlcmZvcm1hbmNlIHN0YXRlcw0KPiBpbiByZWFsLXRpbWUgd2hp
bGUgb2JzZXJ2aW5nIGNsaWVudCB3b3JrbG9hZCB1dGlsaXphdGlvbi4NCj4NCj4gRXhhbXBsZSBv
dXRwdXQ6DQo+ICAgRFJNIG1pbm9yIDAgICAgICAgICAgRnJlcShjdXIvYWN0KSBHVDAtMTgwMC8x
ODAwIEdUMS00MDAvNDAwDQo+ICAgRFJNIG1pbm9yIDEyOCAgICAgICAgRnJlcShjdXIvYWN0KSBH
VDAtNDAwLzQwMCBHVDEtNDAwLzQwMA0KDQo+IFBsZWFzZSB1cGRhdGUgZXhhbXBsZS4NCg0KSSds
bCB1cGRhdGUgdGhpcy4NCg0KPg0KPiB2MjoNCj4gLSBUbyB1c2UgbWFjcm8gdG8gc3VmZml4IHN0
cmluZ3MNCj4gLSBUbyBza2lwIGZhaWx1cmUgbG9vcHMNCj4NCj4gdjM6DQo+IC0gVG8ga2VlcCBl
cnJvciBsb2dzDQo+DQo+IHY0Og0KPiAtIFJlbW92ZWQgUkZDIGZyb20gU3ViamVjdA0KPg0KPiB2
NToNCj4gLSBGYWxsYmFjayB0byBub3JtYWwgc3lzZnMgcmVhZCBpbnN0ZWFkIG9mIHVzaW5nIGxp
YiBhcGkncw0KPiAgIGFzIGl0IGluY3JlYXNlZCB0aGUgZGVwZW5kZW5jaWVzIGhpZ2hseQ0KPg0K
PiB2NjoNCj4gLSBSZW1vdmUgZHJpdmVyIHNwZWNpZmljIGxvZ2dpbmcNCj4gLSBDaGFuZ2UgZnVu
Y3Rpb24gbmFtZSB0byB0aGlzIHJlZ2FyZA0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBTIFNlYmlucmFq
IDxzLnNlYmlucmFqQGludGVsLmNvbT4NCj4gLS0tDQo+ICB0b29scy9ncHV0b3AuYyB8IDEzOSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+ICAxIGZp
bGUgY2hhbmdlZCwgMTM3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYg
LS1naXQgYS90b29scy9ncHV0b3AuYyBiL3Rvb2xzL2dwdXRvcC5jDQo+IGluZGV4IGY1NzdhMTc1
MC4uNDE5OGE4ZDhhIDEwMDY0NA0KPiAtLS0gYS90b29scy9ncHV0b3AuYw0KPiArKysgYi90b29s
cy9ncHV0b3AuYw0KPiBAQCAtMzAsMTMgKzMwLDE0IEBADQo+ICAjaW5jbHVkZSAiaWd0X2RybV9j
bGllbnRzLmgiDQo+ICAjaW5jbHVkZSAiaWd0X2RybV9mZGluZm8uaCINCj4gICNpbmNsdWRlICJp
Z3RfcHJvZmlsaW5nLmgiDQo+IC0jaW5jbHVkZSAiZHJtdGVzdC5oIg0KPg0KPiAgZW51bSB1dGls
aXphdGlvbl90eXBlIHsNCj4gICAgICAgIFVUSUxJWkFUSU9OX1RZUEVfRU5HSU5FX1RJTUUsDQo+
ICAgICAgICBVVElMSVpBVElPTl9UWVBFX1RPVEFMX0NZQ0xFUywNCj4gIH07DQo+DQo+ICsjZGVm
aW5lIEFSUkFZX1NJWkUoYXJyKSAoc2l6ZW9mKGFycikgLyBzaXplb2YoKGFycilbMF0pKQ0KPiAr
DQo+ICBzdGF0aWMgY29uc3QgY2hhciAqYmFyc1tdID0geyAiICIsICKiaiIsICKiayIsICKibCIs
ICKibSIsICKibiIsICKibyIsICKicCIsICKiaSIgfTsNCj4NCj4gICNkZWZpbmUgQU5TSV9IRUFE
RVIgIlwwMzNbN20iDQo+IEBAIC03NiwxNyArNzcsMTUxIEBAIHN0YXRpYyB2b2lkIHByaW50X3Bl
cmNlbnRhZ2VfYmFyKGRvdWJsZSBwZXJjZW50LCBpbnQgbWF4X2xlbikNCj4gICAgICAgIHB1dGNo
YXIoJ3wnKTsNCj4gIH0NCj4NCj4gKy8qIERldGVjdCBpZiB0aGlzIGlzIGEgWGUgZHJpdmVyIGJ5
IGNoZWNraW5nIGZvciBYZS1zcGVjaWZpYyBzeXNmcyBzdHJ1Y3R1cmUgKi8NCj4gK3N0YXRpYyBi
b29sIGRldGVjdF94ZV9kcml2ZXIodW5zaWduZWQgaW50IGRybV9taW5vcikNCj4gK3sNCj4gKyAg
ICAgY2hhciBwYXRoWzI1Nl07DQo+ICsgICAgIHN0cnVjdCBzdGF0IHN0Ow0KPiArDQo+ICsgICAg
IC8qIFhlIGRyaXZlciBoYXMgZGV2aWNlL3RpbGUwIGRpcmVjdG9yeSAqLw0KPiArICAgICBzbnBy
aW50ZihwYXRoLCBzaXplb2YocGF0aCksICIvc3lzL2NsYXNzL2RybS9jYXJkJXUvZGV2aWNlL3Rp
bGUwIiwgZHJtX21pbm9yKTsNCg0KPkJldHRlciB3YXkgd291bGQgYmUgdG8gY2hlY2sgd2hpY2gg
ZHJpdmVyIHdhcyBib3VuZC4gRm9yIGV4YW1wbGUNCm9uIG15IG1hY2hpbmU6DQoNCj5scyAvc3lz
L2NsYXNzL2RybS9jYXJkMS9kZXZpY2UvZHJpdmVyL21vZHVsZS9kcml2ZXJzLw0KcGNpOmk5MTUN
Cg0KPk5vdGUgdGhhdCB0aGVyZSBjb3VsZCBiZSBtb3JlIHRoZW4gb25lIGxpbmsgb3IgZmlsZS4N
Cg0KSSB3aWxsIGNoYW5nZSB0byBzb21ldGhpbmcgd2hpY2ggY2hlY2tzIHdoaWNoIGRyaXZlciBp
cyBib3VuZCBhbmQgdGhlbiBtb3ZlIGFoZWFkLg0KDQo+ICsgICAgIHJldHVybiAoc3RhdChwYXRo
LCAmc3QpID09IDAgJiYgU19JU0RJUihzdC5zdF9tb2RlKSk7DQo+ICt9DQo+ICsNCj4gKy8qIENv
dW50IHRoZSBudW1iZXIgb2YgR1RzIGJ5IGNoZWNraW5nIHdoaWNoIGd0KiBkaXJlY3RvcmllcyBl
eGlzdCAqLw0KPiArc3RhdGljIGludCBnZXRfbnVtX2d0cyh1bnNpZ25lZCBpbnQgZHJtX21pbm9y
LCBib29sIGlzX3hlKQ0KPiArew0KPiArICAgICBjaGFyIHBhdGhbMjU2XTsNCj4gKyAgICAgc3Ry
dWN0IHN0YXQgc3Q7DQo+ICsgICAgIGludCBndF9jb3VudCA9IDA7DQo+ICsNCj4gKyAgICAgLyog
Q2hlY2sgZm9yIGd0MCwgZ3QxLCBndDIsIGV0Yy4gdXAgdG8gYSByZWFzb25hYmxlIG1heGltdW0g
Ki8NCj4gKyAgICAgZm9yIChpbnQgaSA9IDA7IGkgPCA4OyBpKyspIHsNCj4gKyAgICAgICAgICAg
ICBpZiAoaXNfeGUpDQo+ICsgICAgICAgICAgICAgICAgICAgICAvKiBGb3IgWGUsIGFsbCBHVHMg
YXJlIHVuZGVyIHRpbGUwICovDQo+ICsgICAgICAgICAgICAgICAgICAgICBzbnByaW50ZihwYXRo
LCBzaXplb2YocGF0aCksICIvc3lzL2NsYXNzL2RybS9jYXJkJXUvZGV2aWNlL3RpbGUwL2d0JWQi
LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZHJtX21pbm9yLCBpKTsNCj4gKyAg
ICAgICAgICAgICBlbHNlDQo+ICsgICAgICAgICAgICAgICAgICAgICBzbnByaW50ZihwYXRoLCBz
aXplb2YocGF0aCksICIvc3lzL2NsYXNzL2RybS9jYXJkJXUvZ3QvZ3QlZCIsDQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBkcm1fbWlub3IsIGkpOw0KPiArDQo+ICsgICAgICAgICAg
ICAgaWYgKHN0YXQocGF0aCwgJnN0KSA9PSAwICYmIFNfSVNESVIoc3Quc3RfbW9kZSkpDQo+ICsg
ICAgICAgICAgICAgICAgICAgICBndF9jb3VudCsrOw0KPiArICAgICAgICAgICAgIGVsc2UNCj4g
KyAgICAgICAgICAgICAgICAgICAgIGJyZWFrOyAgLyogQXNzdW1lIEdUcyBhcmUgbnVtYmVyZWQg
c2VxdWVudGlhbGx5ICovDQo+ICsgICAgIH0NCj4gKw0KPiArICAgICByZXR1cm4gZ3RfY291bnQg
PiAwID8gZ3RfY291bnQgOiAxOyAgLyogQXQgbGVhc3QgMSBHVCBzaG91bGQgZXhpc3QgKi8NCj4g
K30NCj4gKw0KPiArLyogUmVhZCBhIHNpbmdsZSBmcmVxdWVuY3kgdmFsdWUgZnJvbSBzeXNmcyAq
Lw0KPiArc3RhdGljIGJvb2wgcmVhZF9mcmVxX3ZhbHVlKGNvbnN0IGNoYXIgKnBhdGgsIHVuc2ln
bmVkIGludCAqZnJlcSkNCj4gK3sNCj4gKyAgICAgRklMRSAqZnA7DQo+ICsgICAgIGNoYXIgYnVm
WzMyXTsNCj4gKyAgICAgYm9vbCBzdWNjZXNzID0gZmFsc2U7DQo+ICsNCj4gKyAgICAgZnAgPSBm
b3BlbihwYXRoLCAiciIpOw0KPiArICAgICBpZiAoZnApIHsNCj4gKyAgICAgICAgICAgICBpZiAo
ZmdldHMoYnVmLCBzaXplb2YoYnVmKSwgZnApKSB7DQo+ICsgICAgICAgICAgICAgICAgICAgICAq
ZnJlcSA9IGF0b2koYnVmKTsNCj4gKyAgICAgICAgICAgICAgICAgICAgIHN1Y2Nlc3MgPSB0cnVl
Ow0KPiArICAgICAgICAgICAgIH0NCj4gKyAgICAgICAgICAgICBmY2xvc2UoZnApOw0KPiArICAg
ICB9DQo+ICsNCj4gKyAgICAgcmV0dXJuIHN1Y2Nlc3M7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBj
aGFyICpnZXRfZnJlcXVlbmNpZXModW5zaWduZWQgaW50IGRybV9taW5vcikNCj4gK3sNCj4gKyAg
ICAgY2hhciBmcmVxX3N0cls1MTJdID0gIiI7DQo+ICsgICAgIGNoYXIgZ3RfaW5mb1s2NF07DQo+
ICsgICAgIGludCBudW1fZ3RzOw0KPiArICAgICBpbnQgZ3Q7DQo+ICsgICAgIGJvb2wgaXNfeGU7
DQo+ICsgICAgIGJvb2wgZmlyc3QgPSB0cnVlOw0KPiArDQo+ICsgICAgIC8qIERldGVjdCBkcml2
ZXIgdHlwZSBmcm9tIHN5c2ZzIHN0cnVjdHVyZSAqLw0KPiArICAgICBpc194ZSA9IGRldGVjdF94
ZV9kcml2ZXIoZHJtX21pbm9yKTsNCg0KPiBXaGF0IGFib3V0IGk5MTU/DQpJZiBpdHMgbm90IHhl
IGl0IGlzIGk5MTUsIGluIHRoZSBuZXh0IHJldmlzaW9uIGknbGwgYWRkIGEgZnVuY3Rpb24gdG8g
ZmlndXJlIG91dCBib3RoIGFuZCBwcm9kdWNlIGEgdmFsdWUuDQoNCj5Nb3ZlIGJlbG93IGNvZGUg
dG8gaW50ZWwtc3BlY2lmaWMgZnVuY3Rpb24gYXMgdGhlc2UgbG9va3MNCj4gbm9uLWdlbmVyaWMu
DQoNCk9rYXkgaSdsbCBjaGFuZ2UgdGhpcyBhbmQgbWFrZSByb29tIGZvciBmdXR1cmUgb3RoZXIg
dmVuZG9yIGltcGxlbWVudGF0aW9ucw0KDQo+ICsNCj4gKyAgICAgLyogR2V0IEdUIGNvdW50IGZy
b20gc3lzZnMgKi8NCj4gKyAgICAgbnVtX2d0cyA9IGdldF9udW1fZ3RzKGRybV9taW5vciwgaXNf
eGUpOw0KPiArICAgICBpZiAobnVtX2d0cyA8PSAwKQ0KPiArICAgICAgICAgICAgIHJldHVybiBO
VUxMOw0KPiArDQo+ICsgICAgIC8qIFJlYWQgZnJlcXVlbmNpZXMgZm9yIGVhY2ggR1QgKi8NCj4g
KyAgICAgZm9yIChndCA9IDA7IGd0IDwgbnVtX2d0czsgZ3QrKykgew0KPiArICAgICAgICAgICAg
IGNoYXIgZnJlcV9wYXRoWzI1Nl07DQo+ICsgICAgICAgICAgICAgdW5zaWduZWQgaW50IGN1cl9m
cmVxID0gMCwgYWN0X2ZyZXEgPSAwOw0KPiArICAgICAgICAgICAgIGJvb2wgaGFzX2N1ciA9IGZh
bHNlLCBoYXNfYWN0ID0gZmFsc2U7DQo+ICsNCj4gKyAgICAgICAgICAgICAvKiBSZWFkIGN1cnJl
bnQvcmVxdWVzdGVkIGZyZXF1ZW5jeSAqLw0KPiArICAgICAgICAgICAgIGlmIChpc194ZSkNCj4g
KyAgICAgICAgICAgICAgICAgICAgIHNucHJpbnRmKGZyZXFfcGF0aCwgc2l6ZW9mKGZyZXFfcGF0
aCksDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiL3N5cy9jbGFzcy9kcm0vY2Fy
ZCV1L2RldmljZS90aWxlMC9ndCVkL2ZyZXEwL2N1cl9mcmVxIiwNCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGRybV9taW5vciwgZ3QpOw0KPiArICAgICAgICAgICAgIGVsc2UNCj4g
KyAgICAgICAgICAgICAgICAgICAgIHNucHJpbnRmKGZyZXFfcGF0aCwgc2l6ZW9mKGZyZXFfcGF0
aCksDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiL3N5cy9jbGFzcy9kcm0vY2Fy
ZCV1L2d0L2d0JWQvcnBzX2N1cl9mcmVxX21oeiIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBkcm1fbWlub3IsIGd0KTsNCj4gKw0KPiArICAgICAgICAgICAgIGhhc19jdXIgPSBy
ZWFkX2ZyZXFfdmFsdWUoZnJlcV9wYXRoLCAmY3VyX2ZyZXEpOw0KPiArDQo+ICsgICAgICAgICAg
ICAgLyogUmVhZCBhY3R1YWwgZnJlcXVlbmN5ICovDQo+ICsgICAgICAgICAgICAgaWYgKGlzX3hl
KQ0KPiArICAgICAgICAgICAgICAgICAgICAgc25wcmludGYoZnJlcV9wYXRoLCBzaXplb2YoZnJl
cV9wYXRoKSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIvc3lzL2NsYXNzL2Ry
bS9jYXJkJXUvZGV2aWNlL3RpbGUwL2d0JWQvZnJlcTAvY3VyX2ZyZXEiLA0KPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZHJtX21pbm9yLCBndCk7DQo+ICsgICAgICAgICAgICAgZWxz
ZQ0KPiArICAgICAgICAgICAgICAgICAgICAgc25wcmludGYoZnJlcV9wYXRoLCBzaXplb2YoZnJl
cV9wYXRoKSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIvc3lzL2NsYXNzL2Ry
bS9jYXJkJXUvZ3QvZ3QlZC9ycHNfYWN0X2ZyZXFfbWh6IiwNCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGRybV9taW5vciwgZ3QpOw0KPiArDQo+ICsgICAgICAgICAgICAgaGFzX2Fj
dCA9IHJlYWRfZnJlcV92YWx1ZShmcmVxX3BhdGgsICZhY3RfZnJlcSk7DQo+ICsNCj4gKyAgICAg
ICAgICAgICAvKiBTa2lwIHRoaXMgR1QgaWYgd2UgY291bGRuJ3QgcmVhZCBhbnkgZnJlcXVlbmN5
ICovDQo+ICsgICAgICAgICAgICAgaWYgKCFoYXNfY3VyICYmICFoYXNfYWN0KQ0KPiArICAgICAg
ICAgICAgICAgICAgICAgY29udGludWU7DQo+ICsNCj4gKyAgICAgICAgICAgICAvKiBBcHBlbmQg
dG8gZnJlcXVlbmN5IHN0cmluZyAqLw0KPiArICAgICAgICAgICAgIGlmICghZmlyc3QpDQo+ICsg
ICAgICAgICAgICAgICAgICAgICBzdHJjYXQoZnJlcV9zdHIsICIgIik7DQo+ICsgICAgICAgICAg
ICAgZWxzZQ0KPiArICAgICAgICAgICAgICAgICAgICAgZmlyc3QgPSBmYWxzZTsNCj4gKw0KPiAr
ICAgICAgICAgICAgIHNucHJpbnRmKGd0X2luZm8sIHNpemVvZihndF9pbmZvKSwgIkdUJWQtJXUv
JXUiLCBndCwgY3VyX2ZyZXEsIGFjdF9mcmVxKTsNCj4gKyAgICAgICAgICAgICBzdHJjYXQoZnJl
cV9zdHIsIGd0X2luZm8pOw0KPiArICAgICB9DQo+ICsNCj4gKyAgICAgaWYgKHN0cmxlbihmcmVx
X3N0cikgPiAwKQ0KPiArICAgICAgICAgICAgIHJldHVybiBzdHJkdXAoZnJlcV9zdHIpOw0KPiAr
DQo+ICsgICAgIHJldHVybiBOVUxMOw0KPiArfQ0KPiArDQo+ICBzdGF0aWMgaW50DQo+ICBwcmlu
dF9jbGllbnRfaGVhZGVyKHN0cnVjdCBpZ3RfZHJtX2NsaWVudCAqYywgaW50IGxpbmVzLCBpbnQg
Y29uX3csIGludCBjb25faCwNCj4gICAgICAgICAgICAgICAgICAgIGludCAqZW5naW5lX3cpDQo+
ICB7DQo+ICAgICAgICBpbnQgcmV0LCBsZW47DQo+ICsgICAgIGNoYXIgKmZyZXFfaW5mbyA9IE5V
TEw7DQo+DQo+ICAgICAgICBpZiAobGluZXMrKyA+PSBjb25faCkNCj4gICAgICAgICAgICAgICAg
cmV0dXJuIGxpbmVzOw0KPg0KPiAgICAgICAgcHJpbnRmKEFOU0lfSEVBREVSKTsNCj4gLSAgICAg
cmV0ID0gcHJpbnRmKCJEUk0gbWlub3IgJXUiLCBjLT5kcm1fbWlub3IpOw0KPiArDQo+ICsgICAg
IC8qIEdldCBmcmVxdWVuY3kgaW5mb3JtYXRpb24gKi8NCj4gKyAgICAgZnJlcV9pbmZvID0gZ2V0
X2ZyZXF1ZW5jaWVzKGMtPmRybV9taW5vcik7DQo+ICsNCj4gKyAgICAgaWYgKGZyZXFfaW5mbykg
ew0KPiArICAgICAgICAgICAgIHJldCA9IHByaW50ZigiRFJNIG1pbm9yICV1ICBGcmVxdWVuY3ko
TUh6KSAlcyIsIGMtPmRybV9taW5vciwgZnJlcV9pbmZvKTsNCg0KPiBQbGVhc2UgdXNlIHRocmVl
IHNwYWNlcyBvbmx5LCBubyBpbnZpc2libGUgdW5pY29kZSBjaGFycyBpbiBzdHJpbmdzOg0KPiBz
L3UgIEZyZXEvdSAgIEZyZXEvDQoNCj5PdmVyYWxsIGNvZGUgbG9va3MgZ29vZC4NCg0KSSdsbCBj
b3JyZWN0IHRoaXMuDQoNCj4gUmVnYXJkcywNCj4gS2FtaWwNCj4gKyAgICAgICAgICAgICBmcmVl
KGZyZXFfaW5mbyk7DQo+ICsgICAgIH0gZWxzZSB7DQo+ICsgICAgICAgICAgICAgcmV0ID0gcHJp
bnRmKCJEUk0gbWlub3IgJXUiLCBjLT5kcm1fbWlub3IpOw0KPiArICAgICB9DQo+ICsNCj4gICAg
ICAgIG5fc3BhY2VzKGNvbl93IC0gcmV0KTsNCj4NCj4gICAgICAgIGlmIChsaW5lcysrID49IGNv
bl9oKQ0KPiAtLQ0KPiAyLjQzLjANCj4NCg0KDQpXaXRoIFJlZ2FyZHMsDQpTZWJpbg0K

--_000_CH0PR11MB5427B86E9D70CA448CD547B19899ACH0PR11MB5427namp_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Kamil Konieczny &lt;kamil.konieczny@linux.intel.com&gt;<b=
r>
<b>Sent:</b>&nbsp;Wednesday, February 4, 2026 10:58 PM<br>
<b>To:</b>&nbsp;Sebinraj, S &lt;s.sebinraj@intel.com&gt;<br>
<b>Cc:</b>&nbsp;igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop=
.org&gt;; Badrappan, Jeevaka &lt;jeevaka.badrappan@intel.com&gt;; Karas, Kr=
zysztof &lt;krzysztof.karas@intel.com&gt;; Konieczny, Kamil &lt;kamil.konie=
czny@intel.com&gt;; Kempczynski, Zbigniew &lt;zbigniew.kempczynski@intel.co=
m&gt;;
 Purkait, Soham &lt;soham.purkait@intel.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [PATCH i-g-t v6] tools/gputop: Add GPU frequencies=
 to the client headers
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">Hi S,<br>
On 2026-01-30 at 17:59:54 +0530, S Sebinraj wrote:<br>
&gt; Enhance gputop to display GPU frequency information (current/actual)<b=
r>
&gt; for each GT in the client header line alongside the DRM minor number.<=
br>
&gt;<br>
&gt; Key changes:<br>
&gt; - Add get_gt_frequencies() function to read GT frequency values<br>
&gt; - Support both i915 and Xe drivers using appropriate sysfs paths<br>
&gt; - Display format: &quot;DRM minor X&nbsp; Freq(cur/act) GT0-freq/freq =
GT1-freq/freq&quot;<br>
&gt; - Driver-agnostic sysfs access<br>
&gt;<br>
&gt; The frequency information helps users monitor GPU performance states<b=
r>
&gt; in real-time while observing client workload utilization.<br>
&gt;<br>
&gt; Example output:<br>
&gt;&nbsp;&nbsp; DRM minor 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; Freq(cur/act) GT0-1800/1800 GT1-400/400<br>
&gt;&nbsp;&nbsp; DRM minor 128&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fr=
eq(cur/act) GT0-400/400 GT1-400/400<br>
<br>
&gt; Please update example.<br>
<br>
I'll update this.<br>
<br>
&gt;<br>
&gt; v2:<br>
&gt; - To use macro to suffix strings<br>
&gt; - To skip failure loops<br>
&gt;<br>
&gt; v3:<br>
&gt; - To keep error logs<br>
&gt;<br>
&gt; v4:<br>
&gt; - Removed RFC from Subject<br>
&gt;<br>
&gt; v5:<br>
&gt; - Fallback to normal sysfs read instead of using lib api's<br>
&gt;&nbsp;&nbsp; as it increased the dependencies highly<br>
&gt;<br>
&gt; v6:<br>
&gt; - Remove driver specific logging<br>
&gt; - Change function name to this regard<br>
&gt;<br>
&gt; Signed-off-by: S Sebinraj &lt;s.sebinraj@intel.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; tools/gputop.c | 139 +++++++++++++++++++++++++++++++++++++++++++=
+++++-<br>
&gt;&nbsp; 1 file changed, 137 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/tools/gputop.c b/tools/gputop.c<br>
&gt; index f577a1750..4198a8d8a 100644<br>
&gt; --- a/tools/gputop.c<br>
&gt; +++ b/tools/gputop.c<br>
&gt; @@ -30,13 +30,14 @@<br>
&gt;&nbsp; #include &quot;igt_drm_clients.h&quot;<br>
&gt;&nbsp; #include &quot;igt_drm_fdinfo.h&quot;<br>
&gt;&nbsp; #include &quot;igt_profiling.h&quot;<br>
&gt; -#include &quot;drmtest.h&quot;<br>
&gt;&nbsp;<br>
&gt;&nbsp; enum utilization_type {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UTILIZATION_TYPE_ENGINE_TIME=
,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UTILIZATION_TYPE_TOTAL_CYCLE=
S,<br>
&gt;&nbsp; };<br>
&gt;&nbsp;<br>
&gt; +#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))<br>
&gt; +<br>
&gt;&nbsp; static const char *bars[] =3D { &quot; &quot;, &quot;=A2j&quot;,=
 &quot;=A2k&quot;, &quot;=A2l&quot;, &quot;=A2m&quot;, &quot;=A2n&quot;, &q=
uot;=A2o&quot;, &quot;=A2p&quot;, &quot;=A2i&quot; };<br>
&gt;&nbsp;<br>
&gt;&nbsp; #define ANSI_HEADER &quot;\033[7m&quot;<br>
&gt; @@ -76,17 +77,151 @@ static void print_percentage_bar(double percent, =
int max_len)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; putchar('|');<br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; +/* Detect if this is a Xe driver by checking for Xe-specific sysfs st=
ructure */<br>
&gt; +static bool detect_xe_driver(unsigned int drm_minor)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char path[256];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct stat st;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Xe driver has device/tile0 directory */<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; snprintf(path, sizeof(path), &quot;/sys/clas=
s/drm/card%u/device/tile0&quot;, drm_minor);<br>
<br>
&gt;Better way would be to check which driver was bound. For example<br>
on my machine:<br>
<br>
&gt;ls /sys/class/drm/card1/device/driver/module/drivers/<br>
pci:i915<br>
<br>
&gt;Note that there could be more then one link or file.<br>
<br>
I will change to something which checks which driver is bound and then move=
 ahead.<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return (stat(path, &amp;st) =3D=3D 0 &amp;&a=
mp; S_ISDIR(st.st_mode));<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* Count the number of GTs by checking which gt* directories exist */=
<br>
&gt; +static int get_num_gts(unsigned int drm_minor, bool is_xe)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char path[256];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct stat st;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int gt_count =3D 0;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Check for gt0, gt1, gt2, etc. up to a rea=
sonable maximum */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (int i =3D 0; i &lt; 8; i++) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (is_xe)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* For Xe, all GTs are =
under tile0 */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(path, sizeof(p=
ath), &quot;/sys/class/drm/card%u/device/tile0/gt%d&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_minor, i);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(path, sizeof(p=
ath), &quot;/sys/class/drm/card%u/gt/gt%d&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_minor, i);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (stat(path, &amp;st) =3D=3D 0 &amp;&amp; S_ISDIR(st.st_mode))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gt_count++;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;&nbsp; /* Assume =
GTs are numbered sequentially */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return gt_count &gt; 0 ? gt_count : 1;&nbsp;=
 /* At least 1 GT should exist */<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* Read a single frequency value from sysfs */<br>
&gt; +static bool read_freq_value(const char *path, unsigned int *freq)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; FILE *fp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char buf[32];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool success =3D false;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; fp =3D fopen(path, &quot;r&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (fp) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (fgets(buf, sizeof(buf), fp)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *freq =3D atoi(buf);<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; success =3D true;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; fclose(fp);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return success;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static char *get_frequencies(unsigned int drm_minor)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char freq_str[512] =3D &quot;&quot;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char gt_info[64];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int num_gts;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int gt;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool is_xe;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool first =3D true;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Detect driver type from sysfs structure *=
/<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; is_xe =3D detect_xe_driver(drm_minor);<br>
<br>
&gt; What about i915?</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">If its not xe it i=
s i915, in the next revision i'll add a function to figure out both and pro=
duce a value.<br>
<br>
&gt;Move below code to intel-specific function as these looks<br>
&gt; non-generic.<br>
<br>
Okay i'll change this and make room for future other vendor implementations=
<br>
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Get GT count from sysfs */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; num_gts =3D get_num_gts(drm_minor, is_xe);<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (num_gts &lt;=3D 0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return NULL;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Read frequencies for each GT */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (gt =3D 0; gt &lt; num_gts; gt++) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; char freq_path[256];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; unsigned int cur_freq =3D 0, act_freq =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bool has_cur =3D false, has_act =3D false;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Read current/requested frequency */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (is_xe)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(freq_path, siz=
eof(freq_path),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;/sys/class/drm/card%u/device/tile0/gt%=
d/freq0/cur_freq&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_minor, gt);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(freq_path, siz=
eof(freq_path),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;/sys/class/drm/card%u/gt/gt%d/rps_cur_=
freq_mhz&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_minor, gt);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; has_cur =3D read_freq_value(freq_path, &amp;cur_freq);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Read actual frequency */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (is_xe)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(freq_path, siz=
eof(freq_path),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;/sys/class/drm/card%u/device/tile0/gt%=
d/freq0/cur_freq&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_minor, gt);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(freq_path, siz=
eof(freq_path),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;/sys/class/drm/card%u/gt/gt%d/rps_act_=
freq_mhz&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_minor, gt);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; has_act =3D read_freq_value(freq_path, &amp;act_freq);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Skip this GT if we couldn't read any frequency */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (!has_cur &amp;&amp; !has_act)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Append to frequency string */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (!first)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strcat(freq_str, &quot;=
 &quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; first =3D false;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; snprintf(gt_info, sizeof(gt_info), &quot;GT%d-%u/%u&quot;, gt, cur_freq=
, act_freq);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; strcat(freq_str, gt_info);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (strlen(freq_str) &gt; 0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return strdup(freq_str);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return NULL;<br>
&gt; +}<br>
&gt; +<br>
&gt;&nbsp; static int<br>
&gt;&nbsp; print_client_header(struct igt_drm_client *c, int lines, int con=
_w, int con_h,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int *engine_w)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret, len;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char *freq_info =3D NULL;<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (lines++ &gt;=3D con_h)<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return lines;<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(ANSI_HEADER);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; ret =3D printf(&quot;DRM minor %u&quot;, c-&=
gt;drm_minor);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Get frequency information */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; freq_info =3D get_frequencies(c-&gt;drm_mino=
r);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (freq_info) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D printf(&quot;DRM minor %u&nbsp; Frequency(MHz) %s&quot;, c-&gt;=
drm_minor, freq_info);<br>
<br>
&gt; Please use three spaces only, no invisible unicode chars in strings:<b=
r>
&gt; s/u&nbsp; Freq/u&nbsp;&nbsp; Freq/<br>
<br>
&gt;Overall code looks good.<br>
<br>
I'll correct this.<br>
<br>
&gt; Regards,<br>
&gt; Kamil<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; free(freq_info);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D printf(&quot;DRM minor %u&quot;, c-&gt;drm_minor);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; n_spaces(con_w - ret);<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (lines++ &gt;=3D con_h)<b=
r>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">With Regards,</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">Sebin</div>
</body>
</html>

--_000_CH0PR11MB5427B86E9D70CA448CD547B19899ACH0PR11MB5427namp_--
