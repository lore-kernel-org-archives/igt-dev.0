Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00926CCFA13
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 23:23:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE4810E9F9;
	Thu,  6 Nov 2025 23:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TlawohCc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E7D10E9F9
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 23:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762471389; x=1794007389;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cbRR7YFE9CxIC6Zu70xQSpRdi93bvJCp7ag/H8+ewjk=;
 b=TlawohCc8fnjaR8IBZhyaf0mrPqA7nX2k22yKar+CZRyIUAdZiqLHjIW
 E9CpPRWhqRFd0UQ9LX3Jc+qbe2pIyOVgIBCkAwKdhm+WstFG3JGYGu81o
 5+BDSUYF0G+7NKX+lepZZlx3f0JEPFDuGutQ6MD0a4bl1E2S3XroeH5II
 gOwSy8cKtXv3k7woRVxRKQ/E45EZQhxC5UxKUxrKqSOA/Xexo9j2RORgM
 Y0EEYtfmkFciI+5SySsiH++G0Jj6yLb2jLuRk9F9UNZRHAgxaV45iYS2h
 hcCqmIy1aPYTWmfh/WG4LAtzglSRCM0tnsS517CJ6ccPEL9QwG+QO/vR/ Q==;
X-CSE-ConnectionGUID: 7yXbGmb4R5ujJcpIHGe1iA==
X-CSE-MsgGUID: 6yOxe+sPTd23fsujpHWjkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="68271312"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="68271312"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 15:23:09 -0800
X-CSE-ConnectionGUID: 7cpuVuU4SQ6kAai1MLZulQ==
X-CSE-MsgGUID: PpqQR4fbQtGC0gtAHC1gFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="187734132"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 15:23:09 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 15:23:08 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 15:23:08 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 15:23:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VV8aNFscJJ5wbShE+lrtYQipcT+aWaeBi1xGQhfjb370PERZ/XxF6pV5niR70iqm5ts3Szul0siykltM1ddRvlMXrwII4ggkpaQEUpUw0x2+oCjUtIR89J7Xv5kTzsSO5+JgYws8RgQtrvsrTdBUIAEfemVxdj1z/5IzpExHEJVmod+NfwdXjHjHuNhMfmqYd95K1C8TtRL3AbgQutPEdeE0QQQXhnS/S0hEp2vlBhjpyhpLADdglIsNxb2nMRvqMtrHSRKSi1ptjH206BHVPdyNXJxTzoR5ZI4gE+a3HIvbO8hUq8GpKfZQhVIUtndWaoWsHvIF1VdKyL/Q75rnlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbRR7YFE9CxIC6Zu70xQSpRdi93bvJCp7ag/H8+ewjk=;
 b=TXDGv5GsZrlGXFYsuTa18xO+ssJuYqKliHyCpI5iGQc11PdHZOpcs8tpp9BFVrxQiXokJhrbcFu5OXqQjr+jERuWYnrWYC3nwl6ISAiqZOiXa4YIPCaPgjJm0lhS/f8O4bOoge8ySapMZfBKNVGoMxl5Gk8iUPV487CNHg3a7v74UtUd02tzlvPb5haWe/9Uh/A0+yBHrPAMBAbHO73N59JWKW+21cZ72LkxZXfqIHCYj0/JyuZK/xQrLAwLvHsDuefa8coHAXjy8i02aO41SbRS82zqGpzoMrqWO1W0J6NT+PVgIwh4Hd+D8V6PdT3FnPI5iN6qNLOMsbdXF1X86A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH0PR11MB5094.namprd11.prod.outlook.com (2603:10b6:510:3f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 23:23:06 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%5]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 23:23:06 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] tests/intel/xe_pmu: Tie preempt timeout to exec quantum
Thread-Topic: [PATCH] tests/intel/xe_pmu: Tie preempt timeout to exec quantum
Thread-Index: AQHcT2qDxYM03RnHx06xurPFJcMu77TmPHgAgAABEACAAAvx0A==
Date: Thu, 6 Nov 2025 23:23:06 +0000
Message-ID: <CH0PR11MB5444648B9634319132A76904E5C2A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20251106221248.260255-2-jonathan.cavitt@intel.com>
 <45313f47-c6dc-4fba-87e2-ec7a7e71f7b1@intel.com>
 <BL1PR11MB54459B3FFDAB26A4BE217932E5C2A@BL1PR11MB5445.namprd11.prod.outlook.com>
In-Reply-To: <BL1PR11MB54459B3FFDAB26A4BE217932E5C2A@BL1PR11MB5445.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH0PR11MB5094:EE_
x-ms-office365-filtering-correlation-id: 475385ee-c1ca-46d8-daff-08de1d8b70d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?RStYUURiZW9mbkEycTRHT2QwQlNjM1VaZ1YvNTZwMUlYU29WcUhMQVhSdWRk?=
 =?utf-8?B?Q1BiK2puMzYzMDA5VEI5aDJMY2ZWMUpubkNxUkJFRUs2blIzNEw5bnlreGl1?=
 =?utf-8?B?ZktzWDNienpnbXE3clVmMVZPYXUvSmJHNXl6TEQzYVhlc1BoMFkyNHZvK3Qz?=
 =?utf-8?B?L3hxL2dvRXJZSTNoUXg5SEllQmFyTUxUWmdRMzNTZHdzMnh1QnFYQk56cTRX?=
 =?utf-8?B?K1dNRm82a0F2UlU4KzZEUUFuQjVkMldUTlRNOXM0MlRnQ1pCNEphQ1lCS2Ni?=
 =?utf-8?B?dWttQ3FmaFFPV1E3NDVZMW9RVGRmT2IwcTNCQ2Jkem1ybEJXajA5Tk0zOUtk?=
 =?utf-8?B?VzBlcVVpMWY1eFRXcFlsandwS253MHl6aEJmR2hNdW9yQmkxTVljbWRFdVBq?=
 =?utf-8?B?RTgrOTl1cHBxOFBxeStFazNENmxld3k3RDJLK1U3NkdKUmdacThWU1BoZnFv?=
 =?utf-8?B?cGozZlJZcXpaK3JBelYrSU5rYW9GcSthcEdNQm5BMTdkYTBtQllnTE1KdUVa?=
 =?utf-8?B?SEJRcjBTQzBwQnk1MkQ2eCthUlNZcHlMbnUvazkvbnNHL1ZhcUV3d2pHdVli?=
 =?utf-8?B?OHdKT2VhRzdkK0RSU2JsZ0NwN2p2cmF5RGNtUWphUXo1eHh5aTIrSnFiQ1FG?=
 =?utf-8?B?SzE1Q3RFelpuWlhsSlJmbHpQbld0S0MyeEtoUGRraFFvc3M5d0hiYWlobGEv?=
 =?utf-8?B?TEk2YU9rZjB0SjQxQVJyN1FYNWgvTzBEOGFrMjBHcGNydThlV2hEOXNkTWhW?=
 =?utf-8?B?STZROEx5ZU1ZYkpuQVZqVTVURWFzQnlPTEVnUWNaaXdjMjRBaU1YcEZiSVc5?=
 =?utf-8?B?Yno0U0RxTlc4eXQyVTBlT3d4cmYyYzArTG9pNjRCSkhDQ2hER011QWNOKzFE?=
 =?utf-8?B?V2JGRnNZaE10SHI2NWJPM05GeTVCVTIvalJ0UElETjZzaWVUK1VSaUFrQkh3?=
 =?utf-8?B?UEhyMVZUSUFoVFd2YlloSS9Ycy93dU5iV04wQ21GV0VNM3VueEl3WFBxTG10?=
 =?utf-8?B?SUNnZXlLODNlMitBMXFqdFR5L3VxQ0xHeUJCbXE3WjJlcEhSaTJ1VHpYa1JC?=
 =?utf-8?B?L2pDUUdsYlJuRnNvS2pYZ3dGRE1jSHo3MEd0a0p0TXZ4Z1dFQnNRUWlMcHdJ?=
 =?utf-8?B?VmhzRGtubFhNRmZoRkIvRTZYNUJEZDhYV29QQzFwY0thMnlDSkRyNTIra0lJ?=
 =?utf-8?B?c0tJN2k2bnh2ek1XR3o0eVdPZEEyU1NzN3V3Q0FyOU01NVhKdkVaMU9iLzhB?=
 =?utf-8?B?M2gyQjdicVFGUVdBMjZoQzYyYXlzeGJaUkI5SXpDWnlVbTlieDNOQ3l1emt6?=
 =?utf-8?B?VnNZdEt0Zkk2S3cyb1R5U1Q4eGRDOUJNdnQ3UjhWMTF0RkJoNVQzL2hiRzM4?=
 =?utf-8?B?UWVFTWczSjA1T2taa0NLeE1uTUl3Tko0V2JCRUdzbkx3UHdXMWV1Tm5SaC9i?=
 =?utf-8?B?V1k4bGN0eEJSUWx0TTc3UmxOZTluNHJMTnVwZGd5eThrazRFT2hsYUF6cWdS?=
 =?utf-8?B?Z21DRXBHNUZUVzNHdnZ3S0FMUE9hZGJkKzJSYzh3TkYzQ1FpRittbThta1Er?=
 =?utf-8?B?RU5VU2pqNFB4M0FLcldpdFJoK1RnMjNvRFFPZnhWVlhXMHZGRGlId2tEWW1k?=
 =?utf-8?B?Y0hkeWVjMXpCNE1jM3Q0bWVPc29DcEZuSHlDS3R1REVQL3pYNmI5MU5CVXdV?=
 =?utf-8?B?Mkp0NkIxYTNGMWpkb2E1RG1JQWptVWNYV1luK0gxUWlkNWlVLzJSbkRRRW45?=
 =?utf-8?B?Z3lwdzJWMjZHWVR6d1hCWXlCOGRYQmhyNnJqM3owUVhybzZyZDA1R2VNNkJJ?=
 =?utf-8?B?b0sxdGRrUHkwKy84YmlWa1pqajBCUVZWMXJBRmhvWldnVjZvaW9oaE8yQW4z?=
 =?utf-8?B?UFZlSDR6THJ2WW1NVzY0YlVCVzQ2K2lkalErYnczU0VUSDFic0hPRjA0cVd3?=
 =?utf-8?B?Ykk1MG8va3U1UHAvU1Z4bGJwNjFUNEltNzNHUDZpd09jZHNhNzY0Y2dMODJi?=
 =?utf-8?B?U2lEbjlHaFNTNkQ0bkNPR3JvTHYralc3QW4xZ3R2bHRiUy8wcmQyQ3F3V2li?=
 =?utf-8?Q?SZyNWc?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVpaL1NaNmdQMUxsNFp2SWVxVGQxU2Z4Tk5ZOVNoK2NIbG5JMWJXMGpqRjlk?=
 =?utf-8?B?U2MwRTM2Y0dnY1FRRUxRUU1QeDVGeFhVOWQvbzZsYk0ycmtKTndGTU5oK1RO?=
 =?utf-8?B?ZnFFdlNvKzhMTDdudVdDVnVad2QxU3hvQ0I5Qng5OE55cDl0bkZBakp0Q3FH?=
 =?utf-8?B?REhZMS90ajh6c3B3UWlsRlhtQk1xUkJkVmUyVXFMYThCcnRMSVNEcEJzK2VQ?=
 =?utf-8?B?ZjZMSnpTZGVxaTc3RHRLbHlTT2Ewbjc5V1dzNGxHcjB0UUdtZWxMb0g0U01F?=
 =?utf-8?B?QXNiV0JjdU83WGRwVEpDYUlaWXVRbHNRV1pEd1R5SHc2UlRrYWNWWWdnY2pC?=
 =?utf-8?B?MnJ5Y1owSENLMFh3c1FwR1dpRVBxckM5ZktoU01BRVFuVWVycmlKWlZXMHFU?=
 =?utf-8?B?dkYyYXBTcENBeTIzb2hRdExnTU1kWUd4aVdFRk9ydlVaVTIxampLZGxaU3NR?=
 =?utf-8?B?SWw2SWFYQ3U1U1RmUTFhTE5Zb0IvREs5OFhvWkpqbHlGeUp5WVNWd1lvODJ1?=
 =?utf-8?B?bHZGc2tnV2ZRTnlYRFlXSkZNSDBLdkNTZ2xBbkg1eUlzei8zUG9pMlZSM1hX?=
 =?utf-8?B?QmF4NzJNSFJQUEMwd0d4VnBma3BIamprd3lBVXB2WVBlMVNwTWxpSU91VzFt?=
 =?utf-8?B?RXluQmhRVnZnaWYyMmQrMVFscE9xVkN0Q1BFWWIzdG5Xa0VVMWV6NksyU1hr?=
 =?utf-8?B?V1BoQnh6Z2E1MlBLMEFiMWJINFRId1VoRUc1UjhBZUV4TFRMK1k3S1FteTRq?=
 =?utf-8?B?YnR0Wkl6SmNsRmt3QnhkSXBnZFdLcjRlRDBWM3k1WmpqbzJiWXlkZEFGQ3hT?=
 =?utf-8?B?b1RxTmpDWWJKRGE0UVNYV05wZVNFTUV6dUlRZ1ZCSy82WlV3T3d1MzljdzNj?=
 =?utf-8?B?bXZraGE5Wk5hcFpKdGk3dkpyUWVpQXA2Q295NTN6N3cydXFjb0N0UVdkK2w1?=
 =?utf-8?B?MmI5TC9wVCtyTUNVSFBJTklqUVZqVFJyUnRhSUZoZWxrWTgwRm94SGQyVnpE?=
 =?utf-8?B?QjN0Vi9KL0QramZ1Y2V1aE5DUm03SmQraGdrUmlYM3l0dHZJVmFLSWxxMDlK?=
 =?utf-8?B?OVBINjB2djBOcVVNMVYxYjgySzdRRnVWTldsMXNKcnJ0VXVTNmphTUN3LzVQ?=
 =?utf-8?B?WVNtdDdNVmVhV29ZRVNzMDFJNWlReklWUTdCRzZ0emE1ZEtMWUpZcjZySE1m?=
 =?utf-8?B?VktHL1RlajBkNVk3eHhBdWJMMG9ubmNBNGVHY3J2bS9KWlA5RG5rbFJuRmc2?=
 =?utf-8?B?THNJOXhIRlo0cUx0ZzYrNnJZTEhhNGlnbmRlTWNJTkhvanRhSi9VYXk0dW1l?=
 =?utf-8?B?S1ZrcndDTHJTeHFqVDhSZG9YOFZMb1M1RitqeVNQaFgrbkY4ZTZySEVmMllw?=
 =?utf-8?B?ckJkbTRJTC9wdmxvYktZNmJYVi9PdEc3ZGVhdzFXaVkzdG9oWGp5NU8vQy9j?=
 =?utf-8?B?WlpHZDRCYVFiUlc0K0ttS0FhemZWdGVIeTdyTEh5MEU0TlEvSkYvN251cDVM?=
 =?utf-8?B?QUFqMGtmUGQvcjRYNmY4dUV4YmxnYS9RTTZJSFJVbHBqTWt4ZWlYaWttT0JU?=
 =?utf-8?B?c0pnUFZ2bGdUUEtmRnRWNkhOTWVwckxpVGJHRUhTMmZjOC9aOTUxaHRnbUp2?=
 =?utf-8?B?Z2FQZzd3aWljQk5vUmFJRHExNUsxR3lxeEd3enpkWHgrTUNhWFFveVVuN094?=
 =?utf-8?B?eUlwTVRJWThGNHVzT2tyNU1hK2FtMmx4UEd2Nm1SSEJDWEFib09LWXZYZnpI?=
 =?utf-8?B?enExUlRadUk1QUJXekQvYWI5NEllYkdWazJYdXdWT2hCYU84Tis4NkxuVmty?=
 =?utf-8?B?WnBqZGtCdzlQaUxtUjR2Zm5VVWJoMU9ENWs1UnZyaHUzNTJvZlRJNUExcUhh?=
 =?utf-8?B?WXptbGxBek0wLzZPeUp2WGpieVVYKzFMSGFHVjlidVFNZ2JJUzlUUmtLLzRa?=
 =?utf-8?B?eEhyRUpadW1FWUhINk00T21tZjhmcGNZQS9PQk1zWm90b2szNXA0YlFKbHVQ?=
 =?utf-8?B?bXhPN24rVHVQZUg0azBuM2pvcHZGWlRrVFVhQWdSZnozZ2krVDVWcWtJU2Zw?=
 =?utf-8?B?cGtRbjFzWDdiUjVJcHdUU24xbC9VQ1ZZVFJRSU0xU2J3T2hhQkpVRFNOTVBQ?=
 =?utf-8?Q?ocTx4Fdqyxnu++5dbJHP363E9?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 475385ee-c1ca-46d8-daff-08de1d8b70d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 23:23:06.3126 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 14A2zdjHP0hjxJAv4Hxa0ZERvnb3quts4FrH6VplY00U+I2iFI2CQTSaeklkT7ISFeIbZmiTw1zNHO4106XdhQC3MakQyaxYn58C+8Avm/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5094
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IENhdml0dCwgSm9uYXRoYW4gPGpvbmF0
aGFuLmNhdml0dEBpbnRlbC5jb20+IA0KU2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDYsIDIwMjUg
Mjo0OSBQTQ0KVG86IFdhamRlY3prbywgTWljaGFsIDxNaWNoYWwuV2FqZGVjemtvQGludGVsLmNv
bT47IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogR3VwdGEsIHNhdXJhYmhnIDxz
YXVyYWJoZy5ndXB0YUBpbnRlbC5jb20+OyBadW8sIEFsZXggPGFsZXguenVvQGludGVsLmNvbT47
IENhdml0dCwgSm9uYXRoYW4gPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+DQpTdWJqZWN0OiBS
RTogW1BBVENIXSB0ZXN0cy9pbnRlbC94ZV9wbXU6IFRpZSBwcmVlbXB0IHRpbWVvdXQgdG8gZXhl
YyBxdWFudHVtDQo+IA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBXYWpk
ZWN6a28sIE1pY2hhbCA8TWljaGFsLldhamRlY3prb0BpbnRlbC5jb20+IA0KPiBTZW50OiBUaHVy
c2RheSwgTm92ZW1iZXIgNiwgMjAyNSAyOjM1IFBNDQo+IFRvOiBDYXZpdHQsIEpvbmF0aGFuIDxq
b25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPjsgaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4gQ2M6IEd1cHRhLCBzYXVyYWJoZyA8c2F1cmFiaGcuZ3VwdGFAaW50ZWwuY29tPjsgWnVvLCBB
bGV4IDxhbGV4Lnp1b0BpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHRlc3RzL2lu
dGVsL3hlX3BtdTogVGllIHByZWVtcHQgdGltZW91dCB0byBleGVjIHF1YW50dW0NCj4gPiANCj4g
PiBPbiAxMS82LzIwMjUgMTE6MTIgUE0sIEpvbmF0aGFuIENhdml0dCB3cm90ZToNCj4gPiA+IFdo
ZW4gdXBkYXRpbmcgdGhlIGV4ZWMgcXVhbnR1bSBpbiBlbmFibGVfYW5kX3Byb3Zpc2lvbl92ZnMs
IHVwZGF0ZSB0aGUNCj4gPiA+IHByZWVtcHQgdGltZW91dCB2YWx1ZSB0byBiZSBkb3VibGUgdGhl
IGV4ZWMgcXVhbnR1bSB2YWx1ZS4gIEFsc28sIHJlc2V0DQo+ID4gPiB0aGUgcHJlZW1wdCB0aW1l
b3V0IHZhbHVlIG9uIHRlc3QgZW5kIGluIHVucHJvdmlzaW9uX2FuZF9kaXNhYmxlX3Zmcy4NCj4g
PiA+IFRoZSB2YWx1ZSBmb3IgdGhlIHByZWVtcHQgdGltZW91dCBoZXJlIHdhcyBjaG9zZW4gYmVj
YXVzZSBpdCdzIHdoYXQNCj4gPiA+IHdlJ3ZlIHVzZWQgaGlzdG9yaWNhbGx5IGZvciBjYXNlcyBs
aWtlIHRoaXMuDQo+ID4gDQo+ID4gd2hpbGUgUFQgPSAyeCBFUSB3YXMgYSBjb21tb24gc2V0dGlu
ZyBmb3IgVkZzIGV4cGVjdGVkIHRvIHJ1biByZWd1bGFyIFdMcywNCj4gPiBJJ20gbm90IHN1cmUg
dGhhdCB0aGlzIHdvdWxkIGJlIGEgY29ycmVjdCB2YWx1ZSBmb3IgdGhpcyBwYXJ0aWN1bGFyIHRl
c3QsDQo+ID4gd2hpY2ggdmVyaWZpZXMgcmVwb3J0aW5nIG9mIHRoZSBlbmdpbmUgYWN0aXZpdHkg
LSBtYXliZSBQVCBzaGFsbCBiZSB2ZXJ5DQo+ID4gc21hbGwgb3IgZXF1YWwgUFQgKGRlcGVuZGlu
ZyBvbiBhY3R1YWwgV0wncyB0eXBlIHN1Ym1pdHRlZCBieSB0aGUgdGVzdCkNCj4gPiANCj4gPiA+
IA0KPiA+ID4gU3VnZ2VzdGVkLWJ5OiBNaWNoYWwgV2FqZGVjemtvIDxtaWNoYWwud2FqZGVjemtv
QGludGVsLmNvbT4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEpvbmF0aGFuIENhdml0dCA8am9uYXRo
YW4uY2F2aXR0QGludGVsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gIHRlc3RzL2ludGVsL3hlX3Bt
dS5jIHwgMTQgKysrKysrKysrKystLS0NCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL3Rlc3Rz
L2ludGVsL3hlX3BtdS5jIGIvdGVzdHMvaW50ZWwveGVfcG11LmMNCj4gPiA+IGluZGV4IDk1MjU2
NTViYTIuLmU3YzJkODJkYTQgMTAwNjQ0DQo+ID4gPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9wbXUu
Yw0KPiA+ID4gKysrIGIvdGVzdHMvaW50ZWwveGVfcG11LmMNCj4gPiA+IEBAIC05ODcsMTIgKzk4
NywxOCBAQCBzdGF0aWMgdW5zaWduZWQgaW50IGVuYWJsZV9hbmRfcHJvdmlzaW9uX3ZmcyhpbnQg
ZmQpDQo+ID4gPiAgCW51bV92ZnMgPSBpZ3Rfc3Jpb3ZfZ2V0X2VuYWJsZWRfdmZzKGZkKTsNCj4g
PiA+ICAJaWd0X3JlcXVpcmUobnVtX3ZmcyA9PSAyKTsNCj4gPiA+ICANCj4gPiA+IC0JLyogU2V0
IDMybXMgZm9yIFZGIGV4ZWN1dGlvbiBxdWFudHVtIGFuZCA2NG1zIGZvciBQRiBleGVjdXRpb24g
cXVhbnR1bSAqLw0KPiA+ID4gKwkvKg0KPiA+ID4gKwkgKiBTZXQgMzJtcyBmb3IgVkYgZXhlY3V0
aW9uIHF1YW50dW0gYW5kIDY0bXMgZm9yIFBGIGV4ZWN1dGlvbiBxdWFudHVtLg0KPiA+ID4gKwkg
KiBTZXQgdGhlIHByZWVtcHQgdGltZW91dCBmb3IgdGhlIFZGIGFuZCBQRiB0byBiZSBkb3VibGUg
dGhlaXIgZXhlY3V0aW9uIHF1YW50dW0uDQo+ID4gPiArCSAqLw0KPiA+ID4gIAl4ZV9mb3JfZWFj
aF9ndChmZCwgZ3QpIHsNCj4gPiA+ICAJCXhlX3NyaW92X3NldF9zY2hlZF9pZl9pZGxlKGZkLCBn
dCwgMCk7DQo+ID4gPiAtCQlmb3IgKGludCBmbiA9IDA7IGZuIDw9IG51bV92ZnM7IGZuKyspDQo+
ID4gPiArCQlmb3IgKGludCBmbiA9IDA7IGZuIDw9IG51bV92ZnM7IGZuKyspIHsNCj4gPiA+ICAJ
CQl4ZV9zcmlvdl9zZXRfZXhlY19xdWFudHVtX21zKGZkLCBmbiwgZ3QsIGZuID8gdmZfZXhlY19x
dWFudHVtIDoNCj4gPiA+ICAJCQkJCQkgICAgIHBmX2V4ZWNfcXVhbnR1bSk7DQo+ID4gPiArCQkJ
eGVfc3Jpb3Zfc2V0X3ByZWVtcHRfdGltZW91dF91cyhmZCwgZm4sIGd0LCAyMDAwICoNCj4gPiA+
ICsJCQkJCQkJKGZuID8gdmZfZXhlY19xdWFudHVtIDogcGZfZXhlY19xdWFudHVtKSk7DQo+ID4g
DQo+ID4gbWF5YmUgYmV0dGVyIHRvIGhhdmUgc29tZSB0ZW1wIHZhcnMvY29uc3Qgd2l0aCB0aGVz
ZSBwZi92ZiBwcmVlbXB0X3RpbWVvdXQgdmFsdWVzDQo+ID4gbGlrZSBpdCBpcyBkb25lIGZvciB2
Zi9wZiBleGVjX3F1YW50dW0NCj4gPiBzbyB3ZSB3aWxsIGhhdmUgdGhlbSBkZWZpbmVkIHRvZ2V0
aGVyDQo+IA0KPiBHaXZlbiB0aGF0IHRoZSBwcmVlbXB0IHRpbWVvdXQgdmFsdWUgaXMgZ29pbmcg
dG8gYmUgYSBmaXhlZCBtdWx0aXBsZSBvZiB0aGUgZXhlYyBxdWFudHVtDQo+IChleGFjdCBtdWx0
aXBsaWVyIHVuZGVjaWRlZCwgcHJvYmFibHkganVzdCAxIGdpdmVuIHlvdXIgcHJpb3IgY29tbWVu
dCksIGl0IHByb2JhYmx5DQo+IGRvZXNuJ3QgbWFrZSBtdWNoIHNlbnNlIHRvIGRlZmluZSB0aGUg
c2FtZSB2YWx1ZXMgaW4gdHdvIGRpZmZlcmVudCBsb2NhdGlvbnMuDQo+IA0KPiBXaGF0IEkgY2Fu
IGRvLCBob3dldmVyLCBpcyBkZWZpbmUgYSB0ZW1wb3JhcnkgdmFyaWFibGUgdG8gc3RvcmUgdGhl
IHRhcmdldCBleGVjIHF1YW50dW0NCj4gZm9yIHRoZSBnaXZlbiBmbiBudW1iZXIgYW5kIGp1c3Qg
b3BlcmF0ZSBvbiB0aGF0LiAgU29tZXRoaW5nIGxpa2U6DQo+IA0KPiAiIiINCj4geGVfZm9yX2Vh
Y2hfZ3QoZmQsIGd0KSB7DQo+ICAgICAgICAgICAgICAgICB4ZV9zcmlvdl9zZXRfc2NoZWRfaWZf
aWRsZShmZCwgZ3QsIDApOw0KPiAgICAgICAgICAgICAgICAgZm9yIChpbnQgZm4gPSAwOyBmbiA8
PSBudW1fdmZzOyBmbisrKSB7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHRhcmdldF9kdXJf
bXMgPSBWRl9FWEVDX1FVQU5UVU07IC8vIFZGX0VYRUNfUVVBTlRVTSA9IDMyDQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIHRhcmdldF9kdXJfbXMgKj0gZm4gPyAxIDogUEZfTVVMVElQTElFUjsg
Ly8gUEZfTVVMVElQTElFUiA9IDINCj4gICAgICAgICAgICAgICAgICAgICAgICAgeGVfc3Jpb3Zf
c2V0X2V4ZWNfcXVhbnR1bV9tcyhmZCwgZm4sIGd0LCB0YXJnZXRfZHVyX21zKTsNCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgeGVfc3Jpb3Zfc2V0X3ByZWVtcHRfdGltZW91dF91cyhmZCwgZm4s
IGd0LA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFBGX1RPX0VRX1JBVElPICogdGFyZ2V0X2R1cl9tcyk7IC8vIFBGX1RPX0VRX1JBVElP
ID0gMTAwMA0KPiAgICAgICAgICAgICAgICAgfQ0KPiAgICAgICAgIH0NCj4gIiIiDQo+IA0KPiBX
b3VsZCB0aGF0IGJlIGFtZW5hYmxlPw0KDQpPa2F5LCBJJ20ganVzdCBnb2luZyB0byBhcHBseSB0
aGlzIGNoYW5nZSBhbmQgaWYgaXQncyBub3QgYWdyZWVhYmxlLCB5b3UgY2FuIGxldCBtZSBrbm93
DQppbiB2MiB3aGVyZSBpdCdzIGFwcGxpZWQuDQotSm9uYXRoYW4gQ2F2aXR0DQoNCj4gDQo+IC1K
b25hdGhhbiBDYXZpdHQNCj4gDQo+ID4gDQo+ID4gPiArCQl9DQo+ID4gPiAgCX0NCj4gPiA+ICAN
Cj4gPiA+ICAJLyogcHJvYmUgVkZzICovDQo+ID4gPiBAQCAtMTAxMSw4ICsxMDE3LDEwIEBAIHN0
YXRpYyB2b2lkIHVucHJvdmlzaW9uX2FuZF9kaXNhYmxlX3ZmcyhpbnQgZmQpDQo+ID4gPiAgDQo+
ID4gPiAgCXhlX2Zvcl9lYWNoX2d0KGZkLCBndCkgew0KPiA+ID4gIAkJeGVfc3Jpb3Zfc2V0X3Nj
aGVkX2lmX2lkbGUoZmQsIGd0LCAwKTsNCj4gPiA+IC0JCWZvciAoaW50IGZuID0gMDsgZm4gPD0g
bnVtX3ZmczsgZm4rKykNCj4gPiA+ICsJCWZvciAoaW50IGZuID0gMDsgZm4gPD0gbnVtX3Zmczsg
Zm4rKykgew0KPiA+ID4gIAkJCXhlX3NyaW92X3NldF9leGVjX3F1YW50dW1fbXMoZmQsIGZuLCBn
dCwgMCk7DQo+ID4gPiArCQkJeGVfc3Jpb3Zfc2V0X3ByZWVtcHRfdGltZW91dF91cyhmZCwgZm4s
IGd0LCAwKTsNCj4gPiA+ICsJCX0NCj4gPiA+ICAJfQ0KPiA+ID4gIA0KPiA+ID4gIAl4ZV9zcmlv
dl9kaXNhYmxlX3Zmc19yZXN0b3JlX2F1dG9fcHJvdmlzaW9uaW5nKGZkKTsNCj4gPiANCj4gPiAN
Cj4gDQo=
