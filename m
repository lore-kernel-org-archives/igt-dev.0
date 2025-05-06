Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFD2C3ABAC
	for <igt-dev@archiver.kernel.org>; Tue,  6 May 2025 13:50:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AABE10E03B;
	Tue,  6 May 2025 13:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SQW1VoTU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF8C10E03B
 for <igt-dev@lists.freedesktop.org>; Tue,  6 May 2025 13:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746539441; x=1778075441;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jf2vBlVycEL6P/3GYlnE9uWc1S5QLymDfalO2iBsYYM=;
 b=SQW1VoTUqNGHkWuYGEldARKV6OheRClhQZkycbsW57uyeEwrBvgXB5Bm
 f03bj4/VHUyOc4Uw4qtDb1kQYF9Rm1F/2wlbxMjdEJvvyJ1o5hOwvOfSc
 kwaMs/iXcFqvnwTbfMWtbyNudm5WBm63fk9dLe9iVvM1dMycA3FeLZiav
 VJUfiOKLutAr5XPPXnY4H+mg5P6Xxbzo3xAuJFGxqKy+g0LLbdTlNZQ73
 NktGV8Zk3DGS0X6thcra4aGWtwhs7g8Zqmu0mJ9IyGx/wUZBP8NN9tZfU
 4bAqiDnw9lOfwxyNTK0alHfiHGiUw64aDM6eJ4g3f0tDE6Su3CcgDj+HU w==;
X-CSE-ConnectionGUID: TU+JnyaZSeaE9JNysFKHUA==
X-CSE-MsgGUID: pX79SO7ZRjO276KZ4lba/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="47315058"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="47315058"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 06:50:41 -0700
X-CSE-ConnectionGUID: 167hFFanS6axI8sfyCZuOw==
X-CSE-MsgGUID: hVmJhBz4R/a0x3muuGCWRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="139689019"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 06:50:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 06:50:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 6 May 2025 06:50:40 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 6 May 2025 06:50:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gqxVGXLzD1Clu3lZ411eN9QMfffhLkPhx6updbdO9gdG4AncTkcwKRIEDDegE7PjciTK2e+BKZF88kp0bk75v4gCadp+11N5ynCPbI2vjOcwCzbHKmX2PqjnDqpG/u9+T15sA1deGKHSeBDiNyVXC/ofJjtb4pAwU4kkQr+6tKa/uzRsaoDNP9uB/rqY6cyU+xOnAkFW4JGb7G0WxkBQf1ZzLgMdxChWyVaHDNYqdcT3sFapMl6ptCqKNXKg+H8CIXxeVaDyMh2/RS+vvIPJ3mRz7T/Zz3e+V95w4uUYuxChWwiusYmAdYzoOvkhHWW2SchdEqFbo2UqaLCHLufy+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jf2vBlVycEL6P/3GYlnE9uWc1S5QLymDfalO2iBsYYM=;
 b=bxSbAAsWt/jGOtmI/7bBzmKUjW3jyyxHhyzB/fCIhxJLD6ifZ0mQodTaY9z8x8u2FrUeaa8pLhtI9Ms9Xi3Kblmh18TuvudIh+osJ4qnhP3UTmVLU5GBDmPAKs+QSY42eAuLugea+ZQGSc9vrsXKDAt+t64JVuZsD6CgdGajsPE87Zi4YY4VPYiDQFu9/hzpbdPFA83urgJZi6ERzBVKGv5fDh6/BXB5p9JbUHuYkikSuVRK2cBGD+0uecccX0KcCHpDrL4WE2UbmKVxNhhQzGXPb2MnuvXr53uVao+0QaRH0KFBhzKcpDtdyAtguu3v9fNBEGqaU+3mv2M2qFVozw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by IA1PR11MB6291.namprd11.prod.outlook.com (2603:10b6:208:3e5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 13:50:34 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%7]) with mapi id 15.20.8699.019; Tue, 6 May 2025
 13:50:34 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/xe_fault_injection: Ignore faults
 for *guc*
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/xe_fault_injection: Ignore faults
 for *guc*
Thread-Index: AQHbuaCtePT1zf6/J0C8j3T1iTRET7PEKUQAgAF+s1A=
Date: Tue, 6 May 2025 13:50:34 +0000
Message-ID: <LV3PR11MB86952295C2A9046748E77FBFF989A@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250430073845.30093-1-satyanarayana.k.v.p@intel.com>
 <20250430073845.30093-3-satyanarayana.k.v.p@intel.com>
 <25559ba6-892c-43ed-a6b2-e4d9dc2b9f57@intel.com>
In-Reply-To: <25559ba6-892c-43ed-a6b2-e4d9dc2b9f57@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|IA1PR11MB6291:EE_
x-ms-office365-filtering-correlation-id: 12cdcd9b-b637-4811-221c-08dd8ca4f969
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?amhUZTBhdllZVlhnZHlQSHh6cDNjejFDOUUrZmZvajZhYUYzSm9STFJYZjZU?=
 =?utf-8?B?RkpwYzhLVmVES3VrVnBsMFIxdENQTmFGVjRJQkFuNzdvc1FuTU5rdlR2cFBM?=
 =?utf-8?B?UlBOWldSLytpc3pSV2FjKzM2Y2k4cFliV2VHeTZuUTZFYnNieUhnMDVTS2Vj?=
 =?utf-8?B?cmV4K0MwMXBVRldja29uQW1UaTMrYmE1TXpweCtJeE9uWkFoQURqK3JheTVz?=
 =?utf-8?B?NVN4czRaQVlKemtPelpvemlvZzZJUFo4U3BUL01hWk5HNHptbGxKR3ByemZN?=
 =?utf-8?B?cEFtd1o5S2hBb3Q4ZVF0OXlSNEdrOFpwbDAxYVdQa0ZoMDhVVHNDUjQ4cm83?=
 =?utf-8?B?Q25JaWpweGtKMmhiWThqM05ITVBlOEFmTVI3bHdWZWpOdzE2cnJ3aGZvWGJV?=
 =?utf-8?B?Q1BRK2tRczFVemNudFd4b2FuNkFzWmFMTFFNSmxuZWFIZzdwRy9MYTZqelpl?=
 =?utf-8?B?UDlXdnlBRklaWGdGcHBXR0FUVFgrWFNUbEV4TlYyWnRBa0YwK2I1cGtQVDFj?=
 =?utf-8?B?Q3dNbzduY282aEFBaWhPbXhDRlVXc0l1aWRTcEo2WGxKRHlRVm92NmpDOEVB?=
 =?utf-8?B?QUFsZ3JiOG1USGVkN3NndldDUUMzSkVsSXREak50MEJjZ2M1OTh0ZGlFYklY?=
 =?utf-8?B?akJxVjl5UUtKN003dHMxRlptUkNjSUJQT1puVSswYWpKUFQwUkY1Vm1NblV1?=
 =?utf-8?B?cG5Sa2pjZm5KZDBMdzZaYmFlS21nRjJDUmVEdDdQZjZzK1B3RVRtWEVBbDd0?=
 =?utf-8?B?T3Q4KzQ1aFFTbjRMYnArTGVtSzE0RTZSdHNQeVBCQUFtcDArb3pxd0FLZU0y?=
 =?utf-8?B?bENkZHJtVGpiM3dGcUVKTzVkWGlsNGViOGJOeTBGN3pOcXZHRWc5dkV0cnQ3?=
 =?utf-8?B?TWdRd2dKTjlEMm5sNDFxVW5MZjRUb2lTZ2ZzaHN5eWRveVA3L2x3NzNDYVZM?=
 =?utf-8?B?SDFFQXlXWTFQcDJtR0JLeGJWK2wxaXpQUG9FM3V3d3dZRTkzWTVKVTMzVkd5?=
 =?utf-8?B?YUhIUTQrSzh1d3VibTJ3VHhNVW5UaklvS1BTWTF2VldXMFN4NFpsUXJSSld1?=
 =?utf-8?B?bndMclppd0FFZjFMWmQ1dS9BTzNaN2VQMURORkJJT2hlYjdrcVlGWFEwRjhI?=
 =?utf-8?B?QWxtOGQvdktJMCtxekw4OWVhRFlaNWE5Sk8rTGJLZDJ2OVZld3pGNHZaMkJu?=
 =?utf-8?B?d3hzOW9rYnpOclhST1VFekZXdUxsTzUzbGFFdUNtVlA4bG5iSmNoNEVzMUlC?=
 =?utf-8?B?MWtOMXRiNFl3OVNRN2wvOEpNS0lnU21nMzE3U3RMNldkbHBRbmc2V3l0LzR2?=
 =?utf-8?B?YjVVVFU2aXpKWnFUcXlEbE0xTmE4L2JnVkhBYzBXMnpieWtqWndyNFhMZWwr?=
 =?utf-8?B?ck5vWUJGOXg4SW9xdjNwclVlb1d5TVltNTdjQnBLUGo0SEtKOHlFbWhaYnlU?=
 =?utf-8?B?Y0puTUNjeitrWXo1anl5eEZXS0p6S3c2K0Y3NGdrWFhYVElWSDlsa1JEb3BL?=
 =?utf-8?B?MEhGRDByS28zRGZFT3l4WWQxb3RMeEt0ak5xbTM5Q1JtNHdqRXVoeHJxakN4?=
 =?utf-8?B?c0lzcGZxaitick14OFV2TE5LRVhwYURLRzNubFM1RUg3MHdqcDd5ODlreFBC?=
 =?utf-8?B?c3BhKzRybDN0dTRndTVwZWN4S0hsaEwyK3FsSFVwbjMyV0MrZjBHUHlPNW8v?=
 =?utf-8?B?L2l1Ym5GN1d1REdhYUVYbldRc2tPMWsvNTdoaDJmWWtiQXd0QXBQcC80M0tl?=
 =?utf-8?B?blNZZXFwWmhqaXhCUmtkWEV3ZXkyQzZ1NUE4ejdSRklobUx2VmRhTUlPRUFI?=
 =?utf-8?B?RlVEdG9FRlpaWVloWDF4SzhnTi85eDBna3daYlpJRUxWVFU3RjJxdmRQU1F1?=
 =?utf-8?B?ZWEwNXpiMGMvdmVnOHdsM0hOb1hZWnRrQzNhSVlKSzlwYlowOUozUGdXVkVZ?=
 =?utf-8?B?c3lHMlJnbHY2aHV4U1djNDNqcHpDRUZGT1Rsd2ZLbDRVTFcwWFRDbEN0SmRL?=
 =?utf-8?Q?BAeVTYMJfZYwhsKCjepnr0PBz3fi4k=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SE9jWC8wQ3NKUDZPSW9VTmhIZGpGNzdJU2xFOHVHd0pjVVJjR3VobFF2UGVJ?=
 =?utf-8?B?di9yVk9oRUFsNDgwL21xY0dxZXBTK1VMcitGY1NkbStrWjFqdHZXanlCa0hG?=
 =?utf-8?B?U2U3YmxRSkNtcnpqbENhbTQ5eDdoZGF1Q0xFL0lGdmlhb2dtYlNDTEMxeXhB?=
 =?utf-8?B?REo4aXduMVZVWlpENU1YWjUwM0hCNGRrTXlQMngrV01SanpYSi9RUkJ6UGU0?=
 =?utf-8?B?bHFnZ3FQcVdPNC9UMWtpSVYyYXA3dkM1QytqSC9TNE42bHRKc0Q4bkNuS3oy?=
 =?utf-8?B?OXVpNkozZVJ1ZGJWY1E3QnUrdWdzcHNxRkFLRXRoMm5ONDBaakRKNnpicG1K?=
 =?utf-8?B?a251N0lKbkNvdjVFUjBTNXNiWWxQQmN2NEpaeWIxZXJYNzByNDA0TlNDdlR5?=
 =?utf-8?B?QlNvb29Mc3V6dnkzSy85aHBqam5IcnZxVUF5VnI5SGcvNURHa28waTZJNnNJ?=
 =?utf-8?B?cFZvM0E0SExiN0pyalJpaFkrdHpoVEFxTStMb3FDR0ZjeG5RVjRlS0xHY3Fo?=
 =?utf-8?B?SENZbnlUeVhiK0ZlRlRuQnVpbGtvMXVCVi8zVWtsOHpvLzZEc3dtS1M3QnhW?=
 =?utf-8?B?TU9VVjhtajNsallTNkpHNnNmdk80eXVFNUUzZXZMZGwrZnJIbjJ6bDRHWERr?=
 =?utf-8?B?VjhhaXRHTC8wd3lSN2ZTV2lIRlVNU0pycGZENW5kRWNENjJmNTFEVjZGYVFW?=
 =?utf-8?B?Y3p3bnhteVZDMTk5bTZndjhIeEc5U3AxRWNIeVU0Z1NFenNySjdpaldaWlNo?=
 =?utf-8?B?SmR5RXZhREpUU0tUSWRESHFZMXJKczFNTXpqREdwU28zd3JKN2NSYXBhRmpz?=
 =?utf-8?B?ZjNkTm15QU5nTFlmbVQxRjhhYnlLcHRBOFI2MzBlZmt4QnVobHVzNVU2SXI2?=
 =?utf-8?B?dXQwUEdtZldWcnhiOXpPV3ZWMVAxbW01SitqK05wTGlyR3pGUEhhdVBTdlRQ?=
 =?utf-8?B?Ykxic1ZuNmo1VjRxVHU4UEJHZ3N6Q053L1pRYlk4Y25rZ3E2VE8vTWNZRHNG?=
 =?utf-8?B?SndVUEZzRGZuUG5zbk5TclQ0NWVXd1FJMWljWHpoQ3oyMDJNM2FQSVhEdGdo?=
 =?utf-8?B?S0FjZ2dsQ3ZFc2N0UlhmUTdKSWo4TjhZRUVDRXlUcy9VU1orRnFlejROWFps?=
 =?utf-8?B?ZlArZGZBeTY4TGNrNEJ0Q0tncHVnaloxaXNDWnorVmtkZXBGRVg2a1Q0M3Vs?=
 =?utf-8?B?WVhkY0ZzUEZrVUlqdUFNQmcvbHc5cElrRVJHbllvNVNuRThZaFBtM1JmVU9k?=
 =?utf-8?B?VUdNYVA5UzdHdDRhaDhyREZYYkd0RnBVRHIxc09TNzJYampYd0Qwd3hZTXcr?=
 =?utf-8?B?ZXVieXQ2cnlQTnp2R2tOeENmZmk1dWt4TFhVM0ZFMXVpbWhOaExrZHZlMTJx?=
 =?utf-8?B?REFPMjR6d0tnemlkUHN1UW40Z0FSSi8yMHp5ZjVYRllLeWh4SXVqbWpIajR3?=
 =?utf-8?B?US9YbWpXVWlOZFZTZkcreDVHUzVMWGNpVzB4ZEtlQ1pkSFBnRElKSmlWdFF5?=
 =?utf-8?B?UllOVEg3V1RlK1RPY1k3L1Z2aUQ2L3ZZWjI1U2lLVHQrbmU1WGE3MXNZK1pV?=
 =?utf-8?B?d2RrQkQ3eWx4SjhZZXpYeE1hUitCdmI4Yi90Z2ZoWGppWFN1bnhzNDl5eEx0?=
 =?utf-8?B?UjgwcmIzVXVTblpmVzA0UmZSUTdmYXlCeXhNcGI0MXpaQ0JxdlczZnBJbjRO?=
 =?utf-8?B?Rm1ab2cyUDc3cER2R0c1WkU2Qk1tZk5BdFZmd0NVZWwvMVQwLzY3V0NXSzhx?=
 =?utf-8?B?TDlXTlZPbzhybHR3bjB4VWk4ZW1sU3VYbU44RVV4aFpWVU9wYyt3UUhTWHJR?=
 =?utf-8?B?MUQwdzJPcWwrUmYxR2pLZC9iekpHTHZ5UWJNOUFJaFI5ZHBqNmJwWVBnd1d2?=
 =?utf-8?B?SVhwdnNDTGk5azRnaCtaOUdrOHRMQTROZFVPVGpRK0tpSTBYMHhoeHU1YS9K?=
 =?utf-8?B?c1lHSFc1UE1hS1NWRnlkYWhXeHp2QktpNitJQnJpbVVQTXhDVUx2dFNxZDE0?=
 =?utf-8?B?MUhJMm9nd2NEaU05QkdNV3FOaG1LaWU0djhmRU1XWktnMGg2MGMwRHFFSE1z?=
 =?utf-8?B?M2dhVEF5VDJ0R211RTBrbVdZd0UwcXJqNGVQRTBHTkVJK29zUEhiRTZ1eVZm?=
 =?utf-8?B?MUJKSW5hajhYb1FIOUJ0VmpTVUtYeXlRN042bkpHMHFWTXQ4akY3R1MwUGMv?=
 =?utf-8?B?Nmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12cdcd9b-b637-4811-221c-08dd8ca4f969
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 13:50:34.2865 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EB60LuIcIVAgBn414CaHf1J+QGTb5P9tsTabkIEPx6nRyq4dKXr4QLphPaB2oYkN65ZOBWxnqROD7nB5NoGsnjJrD90ma3y/BsQPEPEnOw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6291
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgRG9uZywNCj4gWmhhbmp1
bg0KPiBTZW50OiBNb25kYXksIE1heSA1LCAyMDI1IDg6MjkgUE0NCj4gVG86IGlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggaS1nLXQgMi8yXSB0ZXN0
cy9pbnRlbC94ZV9mYXVsdF9pbmplY3Rpb246IElnbm9yZSBmYXVsdHMgZm9yDQo+ICpndWMqDQo+
IA0KPiBPbiAyMDI1LTA0LTMwIDM6MzggYS5tLiwgU2F0eWFuYXJheWFuYSBLIFYgUCB3cm90ZToN
Cj4gPiBBZGQgc29tZSBtb3JlIGd1YyBmYXVsdCBtZXNzYWdlcyBpbiB0aGUgZG1lc2cgaWdub3Jl
IGxpc3QuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTYXR5YW5hcmF5YW5hIEsgViBQIDxzYXR5
YW5hcmF5YW5hLmsudi5wQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiBDYzogRGFuaWVsZSBDZXJh
b2xvIFNwdXJpbyA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT4NCj4gPiAtLS0NCj4g
PiAgIHRlc3RzL2ludGVsL3hlX2ZhdWx0X2luamVjdGlvbi5jIHwgMiArKw0KPiA+ICAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2lu
dGVsL3hlX2ZhdWx0X2luamVjdGlvbi5jIGIvdGVzdHMvaW50ZWwveGVfZmF1bHRfaW5qZWN0aW9u
LmMNCj4gPiBpbmRleCA4MmQ3MzBhN2MuLmYyOTNhYzhhZiAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0
cy9pbnRlbC94ZV9mYXVsdF9pbmplY3Rpb24uYw0KPiA+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX2Zh
dWx0X2luamVjdGlvbi5jDQo+ID4gQEAgLTgzLDYgKzgzLDggQEAgc3RhdGljIHZvaWQgaWdub3Jl
X2ZhdWx0c19pbl9kbWVzZyhjb25zdCBjaGFyDQo+IGZ1bmN0aW9uX25hbWVbXSkNCj4gPiAgIAlp
ZiAoZnVuY3Rpb25faXNfcGFydF9vZl9ndWMoZnVuY3Rpb25fbmFtZSkpIHsNCj4gPiAgIAkJc3Ry
Y2F0KHJlZ2V4LCAifEdUWzAtOWEtZkEtRl0qOiBHdUMgaW5pdCBmYWlsZWQgd2l0aCAtDQo+IEVO
T01FTSIpOw0KPiA+ICAgCQlzdHJjYXQocmVnZXgsICJ8R1RbMC05YS1mQS1GXSo6IEZhaWxlZCB0
byBpbml0aWFsaXplIHVDIC4tDQo+IEVOT01FTSIpOw0KPiA+ICsJCXN0cmNhdChyZWdleCwgInxH
VFswLTlhLWZBLUZdKjogRmFpbGVkIHRvIGVuYWJsZSBHdUMgQ1QJKC0NCj4gRU5PTUVNKSIpOw0K
PiAnKCcgYW5kICcpJyBpcyBzcGVjaWFsIGNoYXJhY3RlciBmb3IgcmVndWxhciBleHByZXNzaW9u
LiBUaGUgc2ltaWxhcg0KPiBzaXR1YXRpb24gYXBwbGllcyB0byBvbmUgbGluZSBhYm92ZSwgc28g
aXQgY291bGQgYmUgY2hhbmdlZCB0bzoNCj4gc3RyY2F0KHJlZ2V4LCAifEdUWzAtOWEtZkEtRl0q
OiBGYWlsZWQgdG8gZW5hYmxlIEd1QyBDVAkuLUVOT01FTSIpOw0KPiANCkZpeGVkIGFuZCBzZW50
IG5ldyBwYXRjaC4NCj4gQW5kLCBmb3IgdHdvIGxpbmVzIGFib3ZlLCBpcyB0aGlzIHRlc3QgbWln
aHQgdHJpZ2dlciB0aGVzZSAyIG1lc3NhZ2VzPw0KPiBJZiBub3QsIHdlIG1pZ2h0IHdhbnQgdG8g
cmVtb3ZlIGl0IGZyb20gaWdub3JlIGxpc3QuDQo+IA0KWWVzLiBUaGUgdGVzdCBpbmplY3RzIGZh
dWx0cyBhdCB2YXJpb3VzIGxldmVscyBhbmQgaXQgaXMgcG9zc2libGUgdG8gZ2V0IGFsbCB0aGUg
ZXJyb3JzIGxpc3RlZA0KaGVyZS4NCi1TYXR5YS4NCj4gUmVnYXJkcywNCj4gWmhhbmp1biBEb25n
PiArCQlzdHJjYXQocmVnZXgsICJ8R1RbMC05YS1mQS1GXSo6IEd1QyBQQyBxdWVyeQ0KPiB0YXNr
IHN0YXRlDQo+IGZhaWxlZDoJLUVOT01FTSIpOw0KPiA+ICAgCX0NCj4gPg0KPiA+ICAgCWlndF9l
bWl0X2lnbm9yZV9kbWVzZ19yZWdleChyZWdleCk7DQoNCg==
