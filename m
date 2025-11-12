Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A41CCF9F8
	for <igt-dev@archiver.kernel.org>; Wed, 12 Nov 2025 06:44:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A3B10E12B;
	Wed, 12 Nov 2025 06:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z1NjJCfl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E19210E12B
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Nov 2025 06:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762929866; x=1794465866;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YRSoWMe9hil85hkB6HZjxY7n/MNvfv1Ge8UPIbduQps=;
 b=Z1NjJCfliJNeH21V8ytLbN32RDwmw4z87bonSmMpWJ9XSKoLms1+F1rY
 HTKrMuHWct/ZTpnvXO033l9qWptb8jhWuse0SgqqSrr6I6Pz6nNMDmTb1
 iDJ3I1NfNeQubMH7VJXuhv3prSpUPjjrEo1weqKHgz/V6TKO2OthxhDMR
 GLDBULVIlsDPm6JliVC5pPbl/wS1HzufisfZWcm2EfUb5RhrlyX1JS1KS
 HU5qLytchVeURaxFsMrYY5J/6PUNM/3tPAkvweyYVpSjLdF6NR0pAXVRT
 /AKHy9zEVuKe+yN4YZHjwtDVb+aJN9rogH+EzvnsDRpxbQnqdqxsbmn8I g==;
X-CSE-ConnectionGUID: ac4nvnqJS/u10WcLaf/qDw==
X-CSE-MsgGUID: fUOf/ShURz+V7C9BPBBY+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="52545615"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="52545615"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 22:44:26 -0800
X-CSE-ConnectionGUID: eyDP846IRwyhuxjbP89yxQ==
X-CSE-MsgGUID: Za3TreRMQPOVrB+86XGFPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="219863826"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 22:44:26 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 22:44:25 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 11 Nov 2025 22:44:25 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.56) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 22:44:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WDPpWFqFQR63Vt+fIDQw2H6JwtEOoL2v0vY3TnOQ9hbFVbX9vh8Uuzr9EdzexGR6cJSaMmHQvTfOJvqQIGB1Si22dUhy6jQ9ekZPYOn/YSQOBgt9I2sk9Bg4FToNxRqmDZ5qLFdaBNs1Ax57162keJlW/vtYjT+3TRNzU593EYqhhA9XEpogEYzD3BIEYl7UFmJzN6xJRa7scIDVKLFcmiK09t53R8B5PJ3w0uTIfYigfimH53wdVg8YwDcFfuS1dQgju+tQjOWXzD1HfGjVKIGwrdoPBg9Jka3Zbov3j9BEim+LGeFtvGO75JKx0wKiumCvsc33mGEf7iFSqZeHNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRSoWMe9hil85hkB6HZjxY7n/MNvfv1Ge8UPIbduQps=;
 b=QaIqWRvcqSvWLwvgAhJyrrmFgaaKPUEzkL6L+sPiopJ8UHcV2nb441++eI4n13rp92gxi6wiJ97xxznaAvM7Gtt5WI7VYGEiGm7V2S6glsrq8REn6jq/7eCgB1Df0LUgtsiV0HCItw0ixOyGjeIxbLK7M8KPuIpq6OXAVlIV8nHiohCS11rMUBIvWr4RsoM9KuzxFuTZNu0ODmp8VXy3wY8531UJTMTHWpEEx7L+bmD1FVR6RX3ef1tvAYDWmioYpe4l3VDcNVu/CK/ivBFbdttBJV50/GB0337Jhp7OOBVm756OeiZxDhJqYIE31edPoAMB7aSGLfBmCC6Vl/8CDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by MW4PR11MB6936.namprd11.prod.outlook.com (2603:10b6:303:226::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 06:44:22 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 06:44:20 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Hajda, Andrzej"
 <andrzej.hajda@intel.com>
Subject: RE: [PATCH v2 1/8] lib/xe_query: add helper to get first value of
 hwconfig
Thread-Topic: [PATCH v2 1/8] lib/xe_query: add helper to get first value of
 hwconfig
Thread-Index: AQHcT+GMyhRMy1sGIEWLSLnrAU3ozbTunT+Q
Date: Wed, 12 Nov 2025 06:44:20 +0000
Message-ID: <CH3PR11MB84342FD5C775668DBFCCDCE88DCCA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20251107-xe_query_helpers-v2-0-ec66ba6af1c1@intel.com>
 <20251107-xe_query_helpers-v2-1-ec66ba6af1c1@intel.com>
In-Reply-To: <20251107-xe_query_helpers-v2-1-ec66ba6af1c1@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|MW4PR11MB6936:EE_
x-ms-office365-filtering-correlation-id: 82787296-0b51-451d-4549-08de21b6e8d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|10070799003|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?UVduM3YzdmhYQ2VsUllKOEtwUmZnZFovVm1JbEZsZ3JuL3dIT1Y0STB4S1A1?=
 =?utf-8?B?MWZqU3FhZ2JWTWtTVk9iekR6eWttY25RZ3oxbWNEYWdST3VETzI5d3VMWG55?=
 =?utf-8?B?T3ZpNVB0Y0dqRm5ScVpsZzVxYXJIb3JGK0Vrcll2UXJSVWo3Y2I1blNESkJS?=
 =?utf-8?B?ZG9LTkhVLzRIL0paTnR2MlBjU3QyWitlVDlON0pOdXFXQWNZVkZvNEhqa0tj?=
 =?utf-8?B?NDI5Y2VXaFRabjVIRGdMR0VGSTNnemJLUUF4NElxQzQ2cFM3VUVNaUpnUVBD?=
 =?utf-8?B?VWx2a2Rkd1Y4aURnUGNlT3NvallPK2h1RmVoUGtyb0RTTUp6Qks1bWx0cDQ5?=
 =?utf-8?B?Yndra29aM20yaWYrYzZLTjkyM05hZ2xrVmkzdkpYWXZOYVZUT3h6cGg1dmg5?=
 =?utf-8?B?ZXkxYURnQ0ZPZklTNXJOeDhBMXhFYXA0T2s2QXJaUUluUmJPQmwrZy9tYUhz?=
 =?utf-8?B?SmVjeWxSbXF2NVo4ZlRSN041cWxOMm9KSjFZS2pIWDBOUWxmU0xVYmRXNVRO?=
 =?utf-8?B?STYxVlFicWJ4Y3FrRHJBZ0dNNkppYm5YZnBtS0NjSTVGTXlFbTY5UmdSa3Zu?=
 =?utf-8?B?eTJJdnNsbGRoTUw1WERRMlRRdDNUR1Exbm03M1lGQVYxZ2J0VElxSXVVUysw?=
 =?utf-8?B?bVRPd3ZUcDU4QU5jK3AyV2NpblIvVUxEazVTdm8vZzRJL0VnS3hBM0d4WUNQ?=
 =?utf-8?B?M25PM1BCdWZKczBKNlZlMGk1MDFPSFRiSGVBM09IbWRmRTdsYTdQdnRrY1c5?=
 =?utf-8?B?b05pMzJEZ2FxdWNWM3Ntb0cvc1FaUHpBa3VjQU8wVXhFb09jeW9CSnFJRFZ0?=
 =?utf-8?B?aHgxSzdJd1lDNEVrM3JFejNKUUpoc21wVk9DK0JCa1JGM1pnZGxnWUZ6Q0h0?=
 =?utf-8?B?U21GeXIxUXVNQ3RjZllGMUFucXVNNk9rT2t3NS9HS0tVdTdiTi9KRFJqL2h1?=
 =?utf-8?B?aFRRNHFQd0ZmYWN5UTQraDFrK2RTRllwbUY4b0ZjSlhzNmpuRDdxNk01eGRV?=
 =?utf-8?B?Q0wwVFhVTnRxZmdyMjZTOGZUOWhzSXUxYVBLNWhyYThDZCtMd1BITjZYZXRU?=
 =?utf-8?B?Z0lHMzVtNVJiYnFiNmZFVjFJRUd6Nzlaek1hU3JYR0NiSnI0V1V1ckE2UWRu?=
 =?utf-8?B?Wld0SURPczhYdzNmVEUzeFhvblpBQmF4WmUvRHZVUU5NTzBpUm5oRURiUDJW?=
 =?utf-8?B?T2dxVXFtVzVMWlZCQnEzQ01PaWZ5NnRwQkhRdk4rMzkzRkdad2s2KzZ0Mitm?=
 =?utf-8?B?eGs0RHNyNHo5RWVReVFGZm4yTXFmb3QvZ0JrSHRHY3ZjZzZZOTdqSGppaWxE?=
 =?utf-8?B?ckc2RmlKZlVQRGtNc3QrVkNBZ3NXNFU2dld2WkRKU1BlU3pzSGFZYjB5YUM2?=
 =?utf-8?B?Y2h6NDJoNis3TDd5bHM0REhjZHpHcElmQ3hlelJlNnl1UTgyR29KK09mdVpU?=
 =?utf-8?B?a0JkK2RHdEJhOU9SMko5VjZQdzBxVGZQenA1RndHQ05LM0xIeTlWT1ZCOVNh?=
 =?utf-8?B?MDhjQ0lzNmRJWFhsTm9jZFdMWG1oNnJ3NmgrREJZazNkcWV1NHgwdTFkTjhh?=
 =?utf-8?B?VzF0VDVxeExRWDRkYlo4eGNBeTlVV1hYMTQvbzI3dGI4M2cyNG41NHpuaUt2?=
 =?utf-8?B?VG5DdjdQeGpPQzhSQzMyTy95KzUwOXBhZThzNEFZY1VjZkpRZWd1WE5IVVpm?=
 =?utf-8?B?clNYOTZXdWZKbHlCY25oUjRlWUZQL2U2WjROdkZBSFphVC8zdVA3MWp3V3d4?=
 =?utf-8?B?WEVoa1pyZzBrMUJ2M1I3TFR0S1dJVGZ0M0kyK3dWMjU2dTNIeTdlY0dTaDI1?=
 =?utf-8?B?RHlRSEVxUWY0b0F4Mjc1a0pTeXZkb291SHpQZjJodzlkM2VXUFVDalc3MFQ1?=
 =?utf-8?B?eFJJcm01VzBRazQyOEFpeitzMWhDcmdjTXBqWHAvdmtGbkJtakZNNUJsbnhz?=
 =?utf-8?B?dS9rM0plNXpHUzdsL1o3RmUzdHFlVHVpaUtrVGcxdDhEbitmb1p0dXV4S1Ja?=
 =?utf-8?B?bTlEcVNPRTBVQUg2QkhTalJ1and1bHlKd0g4aFY4cldraFNIVG1hYWdpeFRi?=
 =?utf-8?Q?9+OBpM?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eThmcXZDQ1JzelNjWG9RbmxzUjhZL0ZTMm1OWjEvR1pEd1p0R05jUzJpNFBJ?=
 =?utf-8?B?T0MyZDE4UjIwM0ZGV2JQT0pGRW1tTWpCNkZ0b1NaMTVzaEpRVVZuRU40WTc3?=
 =?utf-8?B?Wko4MkdXUXhTT2hVb1ZCU0xjQ2F5eXJiYkVYamoweXBjMlM2MFFvSm5JQzR4?=
 =?utf-8?B?WTRPTXdjK0RMV0hSNSs3ZmFCNkRFdzRWTGtOT05henl1bGM5M1h1ckxHVzRs?=
 =?utf-8?B?UDcvRUh2NFBYYkxHR1YzSGdCZytQWFozMzRueFBGRktDanVmcGswVXJNZHFr?=
 =?utf-8?B?Yms5ajMrTVIvWEQxbDFYUUhPUmN4dUN1M21maDFyY2NtM292aHFhTDVCWHBE?=
 =?utf-8?B?R1VCTHlnU3UwZlhFNDl5b21YRmpiWkw0T0cvZXB2em9WMTJHQnNjRDRRY2E0?=
 =?utf-8?B?cmVUZmtBNU1uWDhiVnN5dUFXL0hRUUYyR1hHOGpZTkhjdW1VS1dXZGcybk9Y?=
 =?utf-8?B?L1BkY0FwUkdZbk0yZm1mcmFMamtuSCtYdFQ1U2dFR1MwV1ZHOCtxczJLNmdR?=
 =?utf-8?B?NjQvMzBMZnpwN2xScElrMXlSU3ZJNSsxTmJFSG9qYlN6THhKSWRPODdPWnU2?=
 =?utf-8?B?bFVOcUpIVWRCMUV4QU95VFllZXZNM1duTzdJYnlrTnRCbUZVS0NLSlpmcVhN?=
 =?utf-8?B?ZVVtTVllbUxKcXJVS0Y5cjZpNWVWZTZaeFNCNnROUjlWek5BbW5PTEFtV1hY?=
 =?utf-8?B?L0NJeFhIMXFwU0tDR0lLZ080R0hiTkZUWktDYUMraG5DRXR6TzdRVzlZRXY4?=
 =?utf-8?B?WFVYc3ZiUE5Gdm95bjVMWDlrWUVDZTRQMUVYdG9xWHlqYTdoV2t5Z29NQnpD?=
 =?utf-8?B?MUxKdkx2L0Q0Mm9oYytITmI0SFJON3hqNERZV1BHYXV3bG52T2hyaFVzMFZN?=
 =?utf-8?B?cHRiL25Md0gwM2VjdnpRWFE5S1NCU3VGS2dsL2w1TVBaaGRrQTZBaG9WTW9u?=
 =?utf-8?B?eVlPWGh6eUFTTEszbXJ6c1JzaFVuUFpDOEFubWdKbnNtaUtYTXB3OFBJOUhJ?=
 =?utf-8?B?TmdOaGpqaVJwQ1N5NHEvVVpLejdCZzZEb0ZOeFV6SE53M2dNdGFJeDY1SEo5?=
 =?utf-8?B?RXJRUVFPbXFRNk1LemQ2WXoyTUtzejJTOERiMDBiM3J6WjRhaXZPQkh3M1Z6?=
 =?utf-8?B?QVlVSkw1UjZEdEl5NDhOMENJRkp1aE81c2wxaCt2VFg0VDVtb2NPWmlPQVFw?=
 =?utf-8?B?a0V2Q1hBS3NXZlBjMWgyWStiNUQ2cHA3NkRGeXZ4MVhRZnZpT0dsUWUyRy9m?=
 =?utf-8?B?cFZwOXZZMjdZZ0xJeGdOTE9tNkd0N3F3M0FXWXQwL2diZzg1UXNPRmxwc0JX?=
 =?utf-8?B?TVI0NkZadzQ4dmluSHp3WXpLeTNhaGZXN0grQVlabVgzb2Z5ZWFWNGhsWUVm?=
 =?utf-8?B?RVI1ME8yeS8zLzdTa3hCVS9YRjFTV1dBcFdNOGZMSzdUNEpQaTZwcHczbks5?=
 =?utf-8?B?V3lEeUtwR0hYZ3g2WTZmaWpIYk5yWXZqT2d2YlU4Yi9UMExRREVMZGNMRTN4?=
 =?utf-8?B?bU1zQUg2VGJ6VVo4RTM2d1BXYlVVZ3BlL2x6VmVCR2x1YS81N2QxRldaeGJF?=
 =?utf-8?B?NWpOWDJnVnh0UVpicmJsRkduaGdFT0I5SW9PaEwxRk9QK2ZPZTQrYi9FREQ4?=
 =?utf-8?B?dVNDUGFjcVYvdDB5bGZob0tWYTZ1UCtZMEJEdVAyNEVQQURsRFlubnZWRHQr?=
 =?utf-8?B?U2NxK1AzYzlXOXBWelAxTGRQUjlXUFM0V3RDQnQyMUJBTERLOVFzckxVR09q?=
 =?utf-8?B?ZHR4V2d3TjFuQXN6M3IzdVVBZ1ZDcCt6Z3ExMWZ1Tlg0MjRQaGMwT3VyaGRo?=
 =?utf-8?B?bURRcXlGTmFXbHJ4NjNtVjhJYUlWREVBNXMxajJiZEJaMGpLVXJIYU9xazJt?=
 =?utf-8?B?OStEalNkUmlOUjJjbzFvRm9sRmlPcFdKdHJ4cjVDL0U1SGdCdmJua1hsY3Mz?=
 =?utf-8?B?NDZEU0FoWmJQRXMxUDl6eFVZMWNKYS9nazBjNFc0T1pXRW1YUm10ZDdNc0No?=
 =?utf-8?B?aUpZdUdOY2tMcGF6S3hLWlMvYS9FaENDZTFJa3FyRThWY1A1Z0NhM2FCMDlh?=
 =?utf-8?B?Y3RhOTREOExaTEFJSzhYek5vU1dodVBwaHRWamhlQ0huUW5ZbWNETld0d2R5?=
 =?utf-8?B?ek5odVBCK25ld3JmejJJQTFtRGhPajlSbjlMMmNQNjBKQXg2V1NyTXA5bzFx?=
 =?utf-8?B?WlZZcFBWdGRBTnp5ejhMMWhHZlZsQlhhTjN1Ujk5UkhNeTRHYTFuM3RJS0FJ?=
 =?utf-8?B?azFic0d1STlPM2J3cVdKdWFNU2J3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82787296-0b51-451d-4549-08de21b6e8d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 06:44:20.7168 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2BEdJFGXUvQ1+x2r0eaqHioMoA2ofukyVO7DG0OuUeJak+KbnahFSrNOEQNY3IJihql/884XSUcPGnbzJM88loYgQMhd4H+uH2NY8I+8Jj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6936
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEFuZHJ6ZWoNCj4g
SGFqZGENCj4gU2VudDogMDcgTm92ZW1iZXIgMjAyNSAwNTo1MyBQTQ0KPiBUbzogaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVj
em55QGxpbnV4LmludGVsLmNvbT47IEhhamRhLCBBbmRyemVqDQo+IDxhbmRyemVqLmhhamRhQGlu
dGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIHYyIDEvOF0gbGliL3hlX3F1ZXJ5OiBhZGQgaGVs
cGVyIHRvIGdldCBmaXJzdCB2YWx1ZSBvZg0KPiBod2NvbmZpZw0KPiANCj4gTW9zdCBod2NvbmZp
ZyBhdHRyaWJ1dGVzIGFyZSBzaW5nbGUgdmFsdWVzLiBMZXQncyBzaW1wbGlmeSBxdWVyeWluZyB0
aGVtLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5kcnplaiBIYWpkYSA8YW5kcnplai5oYWpkYUBp
bnRlbC5jb20+DQo+IC0tLQ0KPiAgbGliL3hlL3hlX3F1ZXJ5LmMgfCAxNyArKysrKysrKysrKysr
KysrKyAgbGliL3hlL3hlX3F1ZXJ5LmggfCAgMSArDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE4IGlu
c2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9saWIveGUveGVfcXVlcnkuYyBiL2xpYi94
ZS94ZV9xdWVyeS5jIGluZGV4DQo+IGE4OWUwYjk4MDY0M2U5YWExNmIzNWQ5YTk4YzE4MGZmZDky
YTU0M2MuLmQ4ZWE3OTEwOGQ2N2RiYmI4Yzg1OTc2DQo+IDJiMWY1NmQ5NTRlZTc0OWMzIDEwMDY0
NA0KPiAtLS0gYS9saWIveGUveGVfcXVlcnkuYw0KPiArKysgYi9saWIveGUveGVfcXVlcnkuYw0K
PiBAQCAtMTAzNSw2ICsxMDM1LDIzIEBAIHVpbnQzMl90ICp4ZV9od2NvbmZpZ19sb29rdXBfdmFs
dWUoaW50IGZkLA0KPiBlbnVtIGludGVsX2h3Y29uZmlnIGF0dHJpYnV0ZSwgdWludDMyDQo+ICAJ
cmV0dXJuIE5VTEw7DQo+ICB9DQo+IA0KPiArLyoqDQo+ICsgKiB4ZV9od2NvbmZpZ19nZXRfdTMy
Og0KPiArICogQGZkOiB4ZSBkZXZpY2UgZmQNCj4gKyAqIEBhdHRyaWJ1dGU6IGh3Y29uZmlnIGF0
dHJpYnV0ZSBpZA0KPiArICogQGRlZmF1bHRfdmFsdWU6IHZhbHVlIHRvIGJlIHJldHVybmVkIGlu
IGNhc2UgYXR0cmlidXRlIGlzIG5vdA0KPiArcHJlc2VudA0KPiArICoNCj4gKyAqIFJldHVybnMg
YXR0cmlidXRlIHZhbHVlLCBpZiBwcmVzZW50LCBAZGVmYXVsdF92YWx1ZSBvdGhlcndpc2UuDQo+
ICsgKi8NCj4gK3VpbnQzMl90IHhlX2h3Y29uZmlnX2dldF91MzIoaW50IGZkLCBlbnVtIGludGVs
X2h3Y29uZmlnIGF0dHJpYnV0ZSwNCj4gK3VpbnQzMl90IGRlZmF1bHRfdmFsdWUpIHsNCj4gKwl1
aW50MzJfdCAqdmFscywgbGVuOw0KPiArDQo+ICsJdmFscyA9IHhlX2h3Y29uZmlnX2xvb2t1cF92
YWx1ZShmZCwgYXR0cmlidXRlLCAmbGVuKTsNCmlndF9hc3NlcnQgYWJvdXQgdGhlIGxlbiBpcyBu
b3QgYmVpbmcgY2hlY2tlZCB3aGljaCBpbiBvcmlnaW5hbCBldWRlYnVnIGNvZGUgaXMgY2hlY2tl
ZC4NCklndF9hc3NlcnQobGVuID09IDEpOyBJcyB0aGlzIG5vdCBuZWNlc3Nhcnk/DQo+ICsNCj4g
KwlyZXR1cm4gdmFscyA/ICp2YWxzIDogZGVmYXVsdF92YWx1ZTsNCj4gK30NCj4gKw0KPiAgLyoq
DQo+ICAgKiB4ZV9xdWVyeV9weHBfc3RhdHVzOg0KPiAgICogQGZkOiB4ZSBkZXZpY2UgZmQNCj4g
ZGlmZiAtLWdpdCBhL2xpYi94ZS94ZV9xdWVyeS5oIGIvbGliL3hlL3hlX3F1ZXJ5LmggaW5kZXgN
Cj4gNzE1YjY0ZTJmNjJjZmJiY2U4ZGNkOTg3ZGZmZWZlZjdiMWFmNzJjNC4uYWNmMzI5MWIwNzk2
OGU4MjllNmU3MmViYw0KPiBiZjA4ZjAwZTg0N2UyN2EgMTAwNjQ0DQo+IC0tLSBhL2xpYi94ZS94
ZV9xdWVyeS5oDQo+ICsrKyBiL2xpYi94ZS94ZV9xdWVyeS5oDQo+IEBAIC0xMzYsNiArMTM2LDcg
QEAgYm9vbCB4ZV9pc19tZWRpYV9ndChpbnQgZmQsIGludCBndCk7ICBib29sDQo+IHhlX2lzX21h
aW5fZ3QoaW50IGZkLCBpbnQgZ3QpOyAgdWludDE2X3QgeGVfZ3RfZ2V0X3RpbGVfaWQoaW50IGZk
LCBpbnQgZ3QpOw0KPiB1aW50MzJfdCAqeGVfaHdjb25maWdfbG9va3VwX3ZhbHVlKGludCBmZCwg
ZW51bSBpbnRlbF9od2NvbmZpZyBhdHRyaWJ1dGUsDQo+IHVpbnQzMl90ICpsZW4pOw0KPiArdWlu
dDMyX3QgeGVfaHdjb25maWdfZ2V0X3UzMihpbnQgZmQsIGVudW0gaW50ZWxfaHdjb25maWcgYXR0
cmlidXRlLA0KPiArdWludDMyX3QgZGVmYXVsdF92YWx1ZSk7DQo+ICBpbnQgeGVfcXVlcnlfcHhw
X3N0YXR1cyhpbnQgZmQpOw0KPiAgaW50IHhlX3dhaXRfZm9yX3B4cF9pbml0KGludCBmZCk7DQo+
IA0KPiANCj4gLS0NCj4gMi40My4wDQoNCg==
