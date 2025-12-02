Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974CBCFD2F6
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 14:40:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E97110E02F;
	Tue,  2 Dec 2025 14:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C1eiRTq5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87DDA10E02F
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 14:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764686437; x=1796222437;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=0XVoxySIUG1/NXTh/9HGld7y+RssAO6oRo4pm2AnM6c=;
 b=C1eiRTq52WKaQKY4o1DMbQz37h+dqqJ3ikprtZp5OvOEjKUTbZ4VoPed
 Ui2NoeJT3YabAqrq7b8z3yGsHiOrQCqRfzvzYFvXpXKlZcsSxED+1HNfp
 9XdL1zluyzr5MjVLCbFIYu0EnQ2DpUbHGIBfsYyGSfCAVM+a8qauDxAI1
 S/HSM3Zfd0K8FDTh/2XSqK8KohKbFkcnphU1SlSPcIABv5IwxZfmZcPA4
 gOQ05vTz5PCuiTNGs8JDyiEwQl5822pdTlsz68EqDo4gAwuyNdNtPSp1Y
 9t5P+Q0UzaUa86rAX7cqkcEdY7PGMFe/GFcXCDQ3Sigp7OsdmH0WIdf84 Q==;
X-CSE-ConnectionGUID: Hnd6mX1TQxepKRSnYwvJdQ==
X-CSE-MsgGUID: lIVSjlWjTNOxGWDEknwnUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66820991"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66820991"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 06:40:37 -0800
X-CSE-ConnectionGUID: qni2jTsfQeKDOL/XyISkoQ==
X-CSE-MsgGUID: e7+aFdf0R6unQkBDh+z+Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="194223826"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 06:40:36 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 06:40:35 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 06:40:35 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 06:40:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jatfjAcpE5dsT6FY6zDTQosorOFpjI00bLzCBR0wCHLgUBvVRL0dXMD0xSjHY14t6Vpr1xA+yLflpBcFqybHe6E3NKpQiOC0jl0b6KLA96fVQiARsdjha7vhbbxGjvdeNjY95ZL93Fe1vP/FXhkHiEyNHgz7OXXx/utY1/zv7Hl0f/UPON0xMs3oTJ28eQ+KRsJDIrtslsZFPw/+Ii5hO4zUTUsE6onpqchXbc+k5c9TIkVsrAfYRkWns2YZC7QkWc2lJVM4622WoQ2uYPbdVQRETLNvTRbZYA3RDJTsaCL0ujiyCgUeC5sU0ocrylFL17gbcpJXQYQ8HsgrBcZu4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XVoxySIUG1/NXTh/9HGld7y+RssAO6oRo4pm2AnM6c=;
 b=En63luSDRQIe85tqkmVhUDJ61FEGL22IKiVodpf4IPQooazIlIp+LqerZzpjqEPpKo0Vo2Qw7Ar0JMBrZ0H3J97c2PXQf5S9ooN3adYGBzfei1D3tmn41z45lgvxKWXSHKaUkLLbgs6C9WgsALe5HIg7VBP2z1WKVKrIY0F9XlvijYuboJGJN3YPem/hIhBknRJj/3vCkTMvbB+HYUK0DqNFLi3iHCKVxTPY3e60WdF2/7ljwv+ng7vs9X1XgakuS4QC1YuXuz3d5NDPHmNrP8JAtUQMtQb9ZYvuas8KVV6AzkV159hRzduCdHWBuJjv8mrYx+KXg6HiLyt9jB8ARw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by CH3PR11MB7843.namprd11.prod.outlook.com (2603:10b6:610:124::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 14:40:33 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 14:40:33 +0000
From: "Sharma, Nishit" <nishit.sharma@intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gurram,
 Pravalika" <pravalika.gurram@intel.com>
Subject: RE: [PATCH i-g-t v9 08/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU simultaneous access test
Thread-Topic: [PATCH i-g-t v9 08/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU simultaneous access test
Thread-Index: AQHcYqEwxUTyop4gYkyYG80uSr21vbUOEhYAgABbJYA=
Date: Tue, 2 Dec 2025 14:40:32 +0000
Message-ID: <MW4PR11MB71516D81CCD40B12342785C8E4D8A@MW4PR11MB7151.namprd11.prod.outlook.com>
References: <20251121162537.77551-1-nishit.sharma@intel.com>
 <20251201090201.326595-1-nishit.sharma@intel.com>
 <20251201090201.326595-9-nishit.sharma@intel.com>
 <9ebdf1d1b8d53e5f74ed27b25c4624fe4c5e108c.camel@intel.com>
In-Reply-To: <9ebdf1d1b8d53e5f74ed27b25c4624fe4c5e108c.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7151:EE_|CH3PR11MB7843:EE_
x-ms-office365-filtering-correlation-id: 7e555cf1-acf2-40a8-ad99-08de31b0bf77
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?aFRVV1YzTHR1dVJTNkE0MXduQkc2Mk9nV1IzMDVPRWZhVm1YcitQTG81NWtz?=
 =?utf-8?B?TVJxb0NRcWtUVzFGcHpsek82RGpjYVBNZ1NBK2MvYVpuVXlhSTZZd0tqSkx1?=
 =?utf-8?B?cUM3aGNkdlRVdXZ5eFBrYW8raHBUT1gvS3ltU2tjd25sWjBuTzV1NU02RThu?=
 =?utf-8?B?VW1oSGgycGwrUUhnWXJXc0U1dnhBa2FZNGE1blNLdnFqbXg4MTBzTnF6OXE0?=
 =?utf-8?B?U3RlSnl2YXl3bDQvQ1BGVUJxSm00dk1JTTUwVlpCa3BaU2RHeEliQ01Ia0Zn?=
 =?utf-8?B?MkVIbVNoRXFNWVB5ck85bHJkZENvaU1HWDFZeFNJV2xsVll4YktOL1BoSkFJ?=
 =?utf-8?B?UUsydHprV0VwNTVmaXVDV2pCL3Y5WjM5dkxLT2RvSjhYK1ljK1dHUHBvZnZ0?=
 =?utf-8?B?cmNVN0VCV3RQVFByU2NLYk1uaUlWMWMxbkZzUkR2M2duRjRPak11VVR0SC9X?=
 =?utf-8?B?RUVZNDFaUXF2bC9rMERxTEhmMGN1aTZrdnJPT25NdmVaQkNYQTBpMHVpc1k5?=
 =?utf-8?B?WEJuKzQxSlBEcllFYWI1d2RISnZacTB5Mzk1Ny93QzdNNmVlU0NabXpjWG14?=
 =?utf-8?B?MmxUdW45Y2QwdWp5MSthTGliOXNsaFgvaDRTUXBId3poOWNWTGxPcVFUa20z?=
 =?utf-8?B?LzM0NnRkUUJ4U1NJVkJFcktoRW04TWxtaWcxK3JmVHJqT0tONFp5SXNXZi8z?=
 =?utf-8?B?L213MmFHN0d1SmpoUHZydER0eksycnNFeER1T0o3eFBRckdOYk5kOHg2WDE0?=
 =?utf-8?B?MXl2dkxKR0xXNUsvRkh4NTJLRGdTalRMc1ZCQTRaM0dic3dSblh2YUp0cWRz?=
 =?utf-8?B?SlAvVW10SXZ2YUVQcDVKMVgrMWY3dTZFK2VXekpOSUhqQThBVFFud1B0NDdx?=
 =?utf-8?B?RFBFc3R4U0tSelpYbHByMUtkWWxiV0V3cGJrRXRSWnJkY0tBMnlaM0o2dmpJ?=
 =?utf-8?B?aVBDQlFFSTJYWmJpaUFnZDNBS2l2OGlVY3ljUmlWUnJZQUltZHZFa3o1a0pr?=
 =?utf-8?B?RzdvRTBURk5BT2h5bjZRRVdKYy9XcGt5NzRteEYvZWFhc2g5cWprVTdxZjJV?=
 =?utf-8?B?UFRHT3hlYWNCd3U3Ry8rSHd2dHN4dnZJRlJNWVRDT2l6UkJtSEw2NVUwcWhy?=
 =?utf-8?B?UzZTdVZtSlhxZGRtQXpuUFRjQ3ltVGMvZWRFWHFaZ1NEcVR4WW9xM2p6bEor?=
 =?utf-8?B?ODhmT0Rxam9DekM1VmJVLzVlVUJjTngrUTRaR3RhZXRqUWltR3BaRHlwY2p3?=
 =?utf-8?B?M2JqR0FJTHUvUmRySjFIa1h1SlhDUDd5U0ZnYlFkM0RBQytPTTNrUkozaWFh?=
 =?utf-8?B?T2R4SkYxQnBXdUlORkdscHZmdkxacnNweS9rVHVUYXZvU2dBYUlYQWFrNGR4?=
 =?utf-8?B?YzE2L3doVmhadnJWVDZUVGl5UkdUM3dydnBiWlIxOGYzdmFCMkY5QXV5TStz?=
 =?utf-8?B?Ynp1Zi9LTWJSSlZmcE9JWDZGc1FFdHI4VGJsY0dZd1lDVWh4SmVLY2ZKa2NV?=
 =?utf-8?B?cW1sWGFqOHlwdUNEbTFhc0QzMyt2aTlZa3BpSFFyS3JCS3AxSlNCVlVrY0py?=
 =?utf-8?B?UXdVTmZoY2JwaHF4aUxYNVB0MEV1Lzl4M0JnVWdMcGxEQjByZ1hvVDM5TWQ5?=
 =?utf-8?B?WlNLWnA5K0k3UFllR2U3aEhxa0dlNUg5R0xSd3lnMWVxdW9yWDJTMGRLaUI0?=
 =?utf-8?B?d2pkOEpEb2FoSDhVOEJIRXRiUVlQaXoranhXc2xwS3lyQ0JQTm1VdDFGbEJG?=
 =?utf-8?B?bndXdW9NM2FURXVZUWlXVUVRaHM0dW9JZnlGZjA1RXBUWXlvN3JSTXZ4WGpj?=
 =?utf-8?B?YmFYdGQ0Z2l1WUt3c2loaThmWDVWUTlYdlc0SmcremIyU29sUVFEajlYVmtR?=
 =?utf-8?B?V3YwcGNaM3lxR0dTTW9qcWdJYU91K0hHR2tUSUNRTmN3SGpFelFmMzVGa2Vk?=
 =?utf-8?B?K3ZiYTRKVWNtbnBCckhqWGg1ejRiYjdTb2ZxeXJVSkdYT2RKR2ZISy9xenV6?=
 =?utf-8?B?cXdiYzJCbURycmo5dVFNSC9kWWtUZjJBQjY4YU9PNy9sQjk1OG5HV2ZrQVU2?=
 =?utf-8?Q?wlorPD?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?LzM0TUREV2p3ekNLdmdibjMweFovaTVUakt6UnYyUkQ5R21UT2JhQzZYZ0ts?=
 =?utf-8?B?YXZxK09zck5LSW5xRTZ1eHdCaFlaeWpEaVJRdlcvR2FLN094UldSSWl5QWdp?=
 =?utf-8?B?NWRUL3d4SjZBWlpTenVtUDZLNTV0QzljMVMraXhoN0o1ZTZrR2liUGxFWldk?=
 =?utf-8?B?d3ZNOTBnMDdINk1Icnd3d05VV2tCc2ErY2tBZ1Q3TzlRVDJpQzZ0a1FtOGI2?=
 =?utf-8?B?VzJEQ3JrTU01QklUZngzb1lwN0V0aDJjeUVHWXN6SVdxVDBUK09pVS9DWnBN?=
 =?utf-8?B?dUxhclBpM05oT2oxMXVubHBnSkJIUU9hQTRrb2xVOEd6clI0N2N2UHRTdXVT?=
 =?utf-8?B?aXpqTGdpWEc2aU9VSFFqanE5aktaclZyVEFvd2pUeno0VDhnS2d3M0hWeWcz?=
 =?utf-8?B?bkpEZ1BFbmt6VjRMU2Q2Vm1jaFhCZU1hSUhFNWdGVEZjekFvRXJNVHhwelJD?=
 =?utf-8?B?NkRJNVVGbzdpNVFiZk1JcmFrUTlDc0k0YTJpaCtITmx6blA3QUJ3TzdEa0pQ?=
 =?utf-8?B?S3ZHVHlEZU9GUHRsUTdFRXNpSWt5ajAxelFHc0I1Z0NxWjJCNlFveks5ZzVv?=
 =?utf-8?B?cUprMStaRlpodTZZRDdVaGRzNXpGZUVabjNZVi8rNlhtS1JwZXFEUjZnYXVM?=
 =?utf-8?B?TTl2RWJVRlZmNGZEc1VzUERsTzFPZml1Qk9GMG1DS2hLTlpDUVJqTjBicmpU?=
 =?utf-8?B?Zjk0MTZQemp5RHRvcXNvdVJtUWhtZ0VqTHNDNWhYNE0xNGxXa3hEVUFIMXRt?=
 =?utf-8?B?QVA5YkNuNTFFUVhKUmFOMGRFeEZRbFdMeWNjWjQ2QlhhcmtrTUFGaHBYS0JN?=
 =?utf-8?B?OGZkdGJiSWNlN3psT0VqS3lEb1ZFcnI4dHlrZXNLdW5aMFRnZEhPRkxTQ0ZK?=
 =?utf-8?B?d1VMY2Ivb2pLYkNqU2RjTDVyNGVmUm16amsrMDJIVnBBNnlCWHluOW5RamFK?=
 =?utf-8?B?YzljdFhpWFkrU0tOc1ZDWkZrZlZpZ2hTT1AzQ3dvbUNSdE8ycTFuampGS252?=
 =?utf-8?B?enB4SUdJcE5aeEMvZEl6cU1nbWw0UlUzZFZZb1FhUGZmUFZzdlU1QXRhWXJ4?=
 =?utf-8?B?Z25LZmJVNHN5dzNPNEFFN045azZjdGNReEVzU3dvdFpEM2xzSHZ2eloya2tm?=
 =?utf-8?B?MTZXTlpMZnpUTS9HRTQvcGJkLzBnUDJBQmJFZWxGdnh2aVQ1VWw5bjgrdy92?=
 =?utf-8?B?Z0pvTDlicnBIU2prSkVQV2o2RHRtNkcxYkdwa0JBMDM3Yk5LVjBJWDBPaGhn?=
 =?utf-8?B?RCtwZVJnWmF1VjV5R3BocDcxTVRGMVkzamtvZ3MrSkJmSFV6SGdadmtiUjZQ?=
 =?utf-8?B?dXJVQytEb1c5dHpkZ0JlWEpINmY5bXFqNG1ycjBqaG1rY1VKcVByeFhoMDhm?=
 =?utf-8?B?ZDZwU1hhSjFSUFcxamhnRHJQa1ltbXVGUk1tRG5Cays0UFdZS3o4dUFoUzB0?=
 =?utf-8?B?cmN4a1dRd3FTSEFsUFBUUm5rVmRVM1ZrZDJJOFFxM0k4MmVXeEFmczlha24y?=
 =?utf-8?B?ZU15ckRJZkdtdnI5WXVvWUUzMnZhUGEva0JXTzdwNWUzbVdyQ21OWVZ5eVVZ?=
 =?utf-8?B?SXQxbVVNU25LVXpSb1dWOFRtRHcvQkgzWUd4dTlNVTd0M3FQRS93NGExZitq?=
 =?utf-8?B?eHJQTnRVZWM4NVVyQzhEUWkyVzRpcnJKNlFyL3BFd2I0cTZkVXJaeUMwR09G?=
 =?utf-8?B?UGFrN2RzQnBvVjNNSmo3aTQ3T1ZETzkzZEI0ZW50Q1lEVWkvUlBIR0UvKzlG?=
 =?utf-8?B?VURvd0RybGc3aExiVzE2bWllNjZhRUJOSUVLQXlQcjZLVkgremwrY0RjTkZG?=
 =?utf-8?B?bzhpMDVmQ0xYVUVaaHYvTklJOHNHSllGbjhNd0EwYVlaeHNTK0JIN2Y1Z05R?=
 =?utf-8?B?ZGM4aUJSS2RxVFVna2FwN3JCemFteXpSMzBkOVFYME1nQ3U5YjlaSk5KeWVE?=
 =?utf-8?B?WC9EbmRsUGZZbjBtbG00RGJ4K3huL1Jwb3F5aEhnRGhUL3NpcWJwemJWT0pr?=
 =?utf-8?B?enJDaDg2MGJCaGxrUm9sOTgzejBPZ09ha3hOREVlVjkxaXU3bFBQQnIzdDYr?=
 =?utf-8?B?czR1WlZUTjFvYnlQZXE1SVJpUEh1bGVDVkhQS3gzRWtlMGo5eC9jRWdPT2Ft?=
 =?utf-8?Q?sbG2jMCFlkCFza3JuGgwna/MR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e555cf1-acf2-40a8-ad99-08de31b0bf77
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 14:40:32.9182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kknga4WrRfh+QhsU2p7j4HkuC+1tqI4Ppe+EENUxHLbNdfqGVUaNeY4jDKlh9CTu4WrtxQ2KaTtlHX4jbKa92Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7843
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

SGkgVGhvbWFzLA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSGVsbHN0cm9t
LCBUaG9tYXMgPHRob21hcy5oZWxsc3Ryb21AaW50ZWwuY29tPiANClNlbnQ6IFR1ZXNkYXksIERl
Y2VtYmVyIDIsIDIwMjUgMjo0MiBQTQ0KVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
OyBTaGFybWEsIE5pc2hpdCA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+OyBHdXJyYW0sIFByYXZh
bGlrYSA8cHJhdmFsaWthLmd1cnJhbUBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIGkt
Zy10IHY5IDA4LzEwXSB0ZXN0cy9pbnRlbC94ZV9tdWx0aV9ncHVzdm06IEFkZCBTVk0gbXVsdGkt
R1BVIHNpbXVsdGFuZW91cyBhY2Nlc3MgdGVzdA0KDQpPbiBNb24sIDIwMjUtMTItMDEgYXQgMDk6
MDEgKzAwMDAsIG5pc2hpdC5zaGFybWFAaW50ZWwuY29tIHdyb3RlOg0KPiBGcm9tOiBOaXNoaXQg
U2hhcm1hIDxuaXNoaXQuc2hhcm1hQGludGVsLmNvbT4NCj4gDQo+IFRoaXMgdGVzdCBsYXVuY2hl
cyBjb21wdXRlIG9yIGNvcHkgd29ya2xvYWRzIG9uIGJvdGggR1BVcyB0aGF0IGFjY2VzcyANCj4g
dGhlIHNhbWUgU1ZNIGJ1ZmZlciwgdXNpbmcgc3luY2hyb25pemF0aW9uIHByaW1pdGl2ZXMNCj4g
KGZlbmNlcy9zZW1hcGhvcmVzKSB0byBjb29yZGluYXRlIGFjY2Vzcy4gSXQgdmVyaWZpZXMgZGF0
YSBpbnRlZ3JpdHkgDQo+IGFuZCBjaGVja3MgZm9yIHRoZSBhYnNlbmNlIG9mIHJhY2UgY29uZGl0
aW9ucyBpbiBhIG11bHRpLUdQVSBTVk0gDQo+IGVudmlyb25tZW50Lg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+DQo+IC0tLQ0KPiDC
oHRlc3RzL2ludGVsL3hlX211bHRpX2dwdXN2bS5jIHwgMTkzDQo+ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysNCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTkzIGluc2VydGlvbnMoKykN
Cj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9tdWx0aV9ncHVzdm0uYyANCj4gYi90
ZXN0cy9pbnRlbC94ZV9tdWx0aV9ncHVzdm0uYyBpbmRleCA3YTA2ZTI4OWMuLmJkYmFhN2ExNiAx
MDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwveGVfbXVsdGlfZ3B1c3ZtLmMNCj4gKysrIGIvdGVz
dHMvaW50ZWwveGVfbXVsdGlfZ3B1c3ZtLmMNCj4gQEAgLTEzLDYgKzEzLDcgQEANCj4gwqAjaW5j
bHVkZSAiaW50ZWxfbW9jcy5oIg0KPiDCoCNpbmNsdWRlICJpbnRlbF9yZWcuaCINCj4gwqANCj4g
KyNpbmNsdWRlICJpbnRlbF9ncHVfY29tbWFuZHMuaCINCj4gwqAjaW5jbHVkZSAidGltZS5oIg0K
PiDCoA0KPiDCoCNpbmNsdWRlICJ4ZS94ZV9ndC5oIg0KPiBAQCAtOTgsNiArOTksMTcgQEANCj4g
wqAgKglUZXN0IGNyb3NzLUdQVSBtZW1vcnkgYWNjZXNzIHdpdGggcHJlZmV0Y2ggdG8gdmVyaWZ5
IHBhZ2UNCj4gZmF1bHQNCj4gwqAgKglzdXBwcmVzc2lvbiB3aGVuIG1lbW9yeSBpcyBwcmUtbWln
cmF0ZWQgdG8gdGFyZ2V0IEdQVSdzIFZSQU0NCj4gwqAgKg0KPiArICogU1VCVEVTVDogbWdwdS1j
b25jdXJyZW50LWFjY2Vzcy1iYXNpYw0KPiArICogRGVzY3JpcHRpb246DQo+ICsgKglUZXN0IGNv
bmN1cnJlbnQgYXRvbWljIG1lbW9yeSBvcGVyYXRpb25zIHdoZXJlIG11bHRpcGxlIEdQVXMNCj4g
KyAqCXNpbXVsdGFuZW91c2x5IGFjY2VzcyBhbmQgbW9kaWZ5IHRoZSBzYW1lIG1lbW9yeSBsb2Nh
dGlvbg0KPiB3aXRob3V0DQo+ICsgKglwcmVmZXRjaCB0byB2YWxpZGF0ZSBjcm9zcy1HUFUgY29o
ZXJlbmN5IGFuZCBzeW5jaHJvbml6YXRpb24NCj4gKyAqDQo+ICsgKiBTVUJURVNUOiBtZ3B1LWNv
bmN1cnJlbnQtYWNjZXNzLXByZWZldGNoDQo+ICsgKiBEZXNjcmlwdGlvbjoNCj4gKyAqCVRlc3Qg
Y29uY3VycmVudCBhdG9taWMgbWVtb3J5IG9wZXJhdGlvbnMgd2l0aCBwcmVmZXRjaCB3aGVyZQ0K
PiArICoJbXVsdGlwbGUgR1BVcyBzaW11bHRhbmVvdXNseSBhY2Nlc3Mgc2hhcmVkIG1lbW9yeSB0
bw0KPiB2YWxpZGF0ZQ0KPiArICoJY29oZXJlbmN5IHdpdGggbWVtb3J5IG1pZ3JhdGlvbiBhbmQg
bG9jYWwgVlJBTSBhY2Nlc3MNCj4gwqAgKi8NCj4gwqANCj4gwqAjZGVmaW5lIE1BWF9YRV9SRUdJ
T05TCTgNCj4gQEAgLTEwOSw2ICsxMjEsNyBAQA0KPiDCoCNkZWZpbmUgQ09QWV9TSVpFIFNaXzY0
TQ0KPiDCoCNkZWZpbmUJQVRPTUlDX09QX1ZBTAk1Ng0KPiDCoCNkZWZpbmUgQkFUQ0hfVkFMVUUJ
NjANCj4gKyNkZWZpbmUgTlVNX0lURVIJMjAwDQo+IMKgDQo+IMKgI2RlZmluZSBNVUxUSUdQVV9Q
UkVGRVRDSAkJQklUKDEpDQo+IMKgI2RlZmluZSBNVUxUSUdQVV9YR1BVX0FDQ0VTUwkJQklUKDIp
DQo+IEBAIC0xMTgsNiArMTMxLDcgQEANCj4gwqAjZGVmaW5lIE1VTFRJR1BVX1BFUkZfT1AJCUJJ
VCg2KQ0KPiDCoCNkZWZpbmUgTVVMVElHUFVfUEVSRl9SRU1fQ09QWQkJQklUKDcpDQo+IMKgI2Rl
ZmluZSBNVUxUSUdQVV9QRkFVTFRfT1AJCUJJVCg4KQ0KPiArI2RlZmluZSBNVUxUSUdQVV9DT05D
X0FDQ0VTUwkJQklUKDkpDQo+IMKgDQo+IMKgI2RlZmluZSBJTklUCTINCj4gwqAjZGVmaW5lIFNU
T1JFCTMNCj4gQEAgLTE4MCw2ICsxOTQsMTEgQEAgc3RhdGljIHZvaWQgZ3B1X2ZhdWx0X3Rlc3Rf
d3JhcHBlcihzdHJ1Y3QgDQo+IHhlX3N2bV9ncHVfaW5mbyAqc3JjLA0KPiDCoAkJCQnCoMKgIHN0
cnVjdA0KPiBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2ksDQo+IMKgCQkJCcKgwqAg
dW5zaWduZWQgaW50IGZsYWdzKTsNCj4gwqANCj4gK3N0YXRpYyB2b2lkIGdwdV9zaW11bHRfdGVz
dF93cmFwcGVyKHN0cnVjdCB4ZV9zdm1fZ3B1X2luZm8gKnNyYywNCj4gKwkJCQnCoMKgwqAgc3Ry
dWN0IHhlX3N2bV9ncHVfaW5mbyAqZHN0LA0KPiArCQkJCcKgwqDCoCBzdHJ1Y3QNCj4gZHJtX3hl
X2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqZWNpLA0KPiArCQkJCcKgwqDCoCB1bnNpZ25lZCBpbnQg
ZmxhZ3MpOw0KPiArDQo+IMKgc3RhdGljIHZvaWQNCj4gwqBjcmVhdGVfdm1fYW5kX3F1ZXVlKHN0
cnVjdCB4ZV9zdm1fZ3B1X2luZm8gKmdwdSwgc3RydWN0IA0KPiBkcm1feGVfZW5naW5lX2NsYXNz
X2luc3RhbmNlICplY2ksDQo+IMKgCQnCoMKgwqAgdWludDMyX3QgKnZtLCB1aW50MzJfdCAqZXhl
Y19xdWV1ZSkgQEAgLTEwNTgsNiArMTA3NywxNjQgQEAgDQo+IHBhZ2VmYXVsdF90ZXN0X211bHRp
Z3B1KHN0cnVjdCB4ZV9zdm1fZ3B1X2luZm8gKmdwdTEsDQo+IMKgCWNsZWFudXBfdm1fYW5kX3F1
ZXVlKGdwdTIsIHZtWzFdLCBleGVjX3F1ZXVlWzFdKTsNCj4gwqB9DQo+IMKgDQo+ICtzdGF0aWMg
dm9pZA0KPiArbXVsdGlncHVfYWNjZXNzX3Rlc3Qoc3RydWN0IHhlX3N2bV9ncHVfaW5mbyAqZ3B1
MSwNCj4gKwkJwqDCoMKgwqAgc3RydWN0IHhlX3N2bV9ncHVfaW5mbyAqZ3B1MiwNCj4gKwkJwqDC
oMKgwqAgc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVjaSwNCj4gKwkJwqDC
oMKgwqAgdW5zaWduZWQgaW50IGZsYWdzKQ0KPiArew0KPiArCXVpbnQ2NF90IGFkZHI7DQo+ICsJ
dWludDMyX3Qgdm1bMl07DQo+ICsJdWludDMyX3QgZXhlY19xdWV1ZVsyXTsNCj4gKwl1aW50MzJf
dCBiYXRjaF9ib1syXTsNCj4gKwlzdHJ1Y3QgdGVzdF9leGVjX2RhdGEgKmRhdGE7DQo+ICsJdWlu
dDY0X3QgYmF0Y2hfYWRkclsyXTsNCj4gKwlzdHJ1Y3QgZHJtX3hlX3N5bmMgc3luY1syXSA9IHt9
Ow0KPiArCXVpbnQ2NF90ICpzeW5jX2FkZHJbMl07DQo+ICsJdWludDMyX3QgdmVyaWZ5X2JhdGNo
X2JvOw0KPiArCXVpbnQ2NF90IHZlcmlmeV9iYXRjaF9hZGRyOw0KPiArCXVpbnQ2NF90ICp2ZXJp
ZnlfcmVzdWx0Ow0KPiArCXVpbnQzMl90IGZpbmFsX3ZhbHVlOw0KPiArCXVpbnQ2NF90IGZpbmFs
X3RpbWVsaW5lOw0KPiArDQo+ICsJLyogU2tpcCBpZiBlaXRoZXIgR1BVIGRvZXNuJ3Qgc3VwcG9y
dCBmYXVsdHMgKi8NCj4gKwlpZiAobWdwdV9jaGVja19mYXVsdF9zdXBwb3J0KGdwdTEsIGdwdTIp
KQ0KPiArCQlyZXR1cm47DQo+ICsNCj4gKwljcmVhdGVfdm1fYW5kX3F1ZXVlKGdwdTEsIGVjaSwg
JnZtWzBdLCAmZXhlY19xdWV1ZVswXSk7DQo+ICsJY3JlYXRlX3ZtX2FuZF9xdWV1ZShncHUyLCBl
Y2ksICZ2bVsxXSwgJmV4ZWNfcXVldWVbMV0pOw0KPiArDQo+ICsJZGF0YSA9IGFsaWduZWRfYWxs
b2MoU1pfMk0sIFNaXzRLKTsNCj4gKwlpZ3RfYXNzZXJ0KGRhdGEpOw0KPiArCWRhdGFbMF0udm1f
c3luYyA9IDA7DQo+ICsJYWRkciA9IHRvX3VzZXJfcG9pbnRlcihkYXRhKTsNCj4gKw0KPiArCVdS
SVRFX09OQ0UoKih1aW50NjRfdCAqKWFkZHIsIDApOw0KPiArDQo+ICsJLyogR1BVMTogQXRvbWlj
IEJhdGNoIGNyZWF0ZSAqLw0KPiArCWdwdV9iYXRjaF9jcmVhdGUoZ3B1MSwgdm1bMF0sIGV4ZWNf
cXVldWVbMF0sIGFkZHIsIDAsDQo+ICsJCQkgJmJhdGNoX2JvWzBdLCAmYmF0Y2hfYWRkclswXSwg
ZmxhZ3MsDQo+IEFUT01JQyk7DQo+ICsJLyogR1BVMjogQXRvbWljIEJhdGNoIGNyZWF0ZSAqLw0K
PiArCWdwdV9iYXRjaF9jcmVhdGUoZ3B1Miwgdm1bMV0sIGV4ZWNfcXVldWVbMV0sIGFkZHIsIDAs
DQo+ICsJCQkgJmJhdGNoX2JvWzFdLCAmYmF0Y2hfYWRkclsxXSwgZmxhZ3MsDQo+IEFUT01JQyk7
DQo+ICsNCj4gKwkvKiBncHVfbWFkdmlzZV9zeW5jIGNhbGxzIHhlX2V4ZWMoKSBhbHNvLCBoZXJl
IGludGVudGlvbiBpcw0KPiBkaWZmZXJlbnQgKi8NCj4gKwl4ZV9tdWx0aWdwdV9tYWR2aXNlKGdw
dTEtPmZkLCB2bVswXSwgYWRkciwgU1pfNEssIDAsDQo+ICsJCQnCoMKgwqAgRFJNX1hFX01FTV9S
QU5HRV9BVFRSX0FUT01JQywNCj4gKwkJCcKgwqDCoCBEUk1fWEVfQVRPTUlDX0dMT0JBTCwgMCwg
MCwNCj4gZXhlY19xdWV1ZVswXSk7DQo+ICsNCj4gKwl4ZV9tdWx0aWdwdV9tYWR2aXNlKGdwdTEt
PmZkLCB2bVswXSwgYWRkciwgU1pfNEssIDAsDQo+ICsJCQnCoMKgwqAgRFJNX1hFX01FTV9SQU5H
RV9BVFRSX1BSRUZFUlJFRF9MT0MsDQo+ICsJCQnCoMKgwqAgZ3B1MS0+ZmQsIDAsIGdwdTEtPnZy
YW1fcmVnaW9uc1swXSwNCj4gZXhlY19xdWV1ZVswXSk7DQo+ICsNCj4gKwl4ZV9tdWx0aWdwdV9t
YWR2aXNlKGdwdTItPmZkLCB2bVsxXSwgYWRkciwgU1pfNEssIDAsDQo+ICsJCQnCoMKgwqAgRFJN
X1hFX01FTV9SQU5HRV9BVFRSX0FUT01JQywNCj4gKwkJCcKgwqDCoCBEUk1fWEVfQVRPTUlDX0dM
T0JBTCwgMCwgMCwNCj4gZXhlY19xdWV1ZVsxXSk7DQoNCkFjdHVhbGx5IEkganVzdCByZWFsaXpl
ZCwgc2hvdWxkbid0IHdlIHVzZSBhbiBvcmRpbmFyeSB4ZV92bV9tYWR2aXNlKCkgY2FsbCBoZXJl
IGZvciB0aGUgYXRvbWljIGF0dHJpYnV0ZXMgaW5zdGVhZCBvZiB4ZV9tdWx0aWdwdV9tYWR2aXNl
KCksIGFzIG5vIGZhbGxiYWNrcyBhcmUgbmVlZGVkPw0KDQpOaXNoaXQ6IEkgdGhpbmsgd2UgY2Fu
IGtlZXAgeGVfbXVsdGlncHVfbWFkdmlzZSgpIGZvciByZWFkYWJpbGl0eSBhbmQgaW4geGVfbXVs
dGlncHVfbWFkdmlzZSgpIHdlIGFyZSBjYWxsaW5nIHhlX3ZtX21hZHZpc2UoKSBkZXBlbmRpbmcg
dXBvbiBmYWxsYmFja3MgcmVxdWlyZWQuDQoNCi9UaG9tYXMNCg0K
