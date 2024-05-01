Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99C1C4345F
	for <igt-dev@archiver.kernel.org>; Wed,  1 May 2024 03:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC381120B3;
	Wed,  1 May 2024 03:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X612xMGK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875061120B0
 for <igt-dev@lists.freedesktop.org>; Wed,  1 May 2024 03:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714535981; x=1746071981;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kCtHq9HsJa5rcWRpGcN0pyl/YBanAlVSa5Du7j8zxzI=;
 b=X612xMGK2COSmSO3fBUW8aVMWntfrIGhNgVAh7eGEBFYnBHBOY9hJdrR
 Xv8+qHz9ebNgeK+chGPB2G/xjO1HZdmjUPdeIyPR9WCGdhNStOMkiUCBg
 O38rAmYFtBeh8Ivul1CI+qQaK5OCwbm3sZ5fWtD7gKbyk/Y9vA/oUEn38
 VRD2wPntsXCz75axqjg5CDRB8yWW7UeS2MdYECQ338hLKYeqbwoO2Jnl+
 DSgySLZ3VVAjeYkWeoSEFsxCSiOXSZNGRDALqB6OstOgUVb4BIn24P7jH
 36DF5wMBedS/lnpv80fEuPf/3/PXp2+H1P+C3PtfDzfAF8FILw1nEPWVh w==;
X-CSE-ConnectionGUID: 7DIgAlDwStG1oSidF5ocFg==
X-CSE-MsgGUID: Hv9uB7zTS7mRobTRC6GQ4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="35653747"
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; d="scan'208";a="35653747"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 20:59:41 -0700
X-CSE-ConnectionGUID: 8hrmmdvuSCq2t+Bc9e3vpQ==
X-CSE-MsgGUID: yXzG/VesRs6H+ubIFvYmBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; d="scan'208";a="31385545"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Apr 2024 20:59:41 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 20:59:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 20:59:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Apr 2024 20:59:40 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 20:59:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QiLjjqiRJ04yNlj7sd4h8UN+VXWzIGLcYOBPRo8meyigAGVCfKo0QQCa2kmm/j2BOJZ7EGRMsrJ9Smeme3y3HoPCiophUduR9VLcnWmWQrlR/MbAZLlqK+s4FuqewBF7TvLjl+shBNhbGuwAP2DjQDbblDvh0Sdr4nb4UK3835P/pE7XvyJXLIeu03e8Ue4XoVX4c6qb3CoAC4WV3Kgj71n6FJG0j4GB6atNqNo7VlQUEgrKON7HQr0uBkyPm/maMvAxqYFF20owkT2/qQu0L4QuUc512kn2ZI53LWWsZP8zpeb/0gkBQTbnm+c22y8Mxd466cQA4yef+9bdc5ViLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCtHq9HsJa5rcWRpGcN0pyl/YBanAlVSa5Du7j8zxzI=;
 b=WkkqOkC4RsW2rjvrkdLnhMLZWyoj3M+8WcJrDmL0y0tu7x0YFn21Yt71KoRfla5hGmmDr8oFGWVMCVvs1gRg7M9LMM+IfmiV3VbqA2aXhhQMiczCr7q2jz6kc/dp1W251WM8tCSz+2PoCinRQp7ouhT/KhlIdUepgvuxuervjmVn9ENjWF+H9ZSbcxdZsC3cpr5f6GjA1PuC7J8IAQEi4BcRPxW/eEYnUxLl5bueeUF9DNgLqrkPZOAC7PQuhbkc08/OrUw4I3y6M4Tk/DjATVkaWnBZvzvody3PYPxdGqVIWxPpovMqWYEFusXSfHHDhLPzGalMzBXkhx7d1g+LDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by DM3PR11MB8684.namprd11.prod.outlook.com (2603:10b6:0:4a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Wed, 1 May
 2024 03:59:37 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7519.021; Wed, 1 May 2024
 03:59:37 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH RFC i-g-t 2/2] tests/intel/xe_svm: basic xe_svm test
Thread-Topic: [PATCH RFC i-g-t 2/2] tests/intel/xe_svm: basic xe_svm test
Thread-Index: AQHamywVHcvKHSFsWk+9J+e+OXEIt7GBwIOA
Date: Wed, 1 May 2024 03:59:37 +0000
Message-ID: <SA1PR11MB6991E03DD2D5651252F0AA4492192@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240430182747.589234-1-krishnaiah.bommu@intel.com>
 <20240430182747.589234-3-krishnaiah.bommu@intel.com>
In-Reply-To: <20240430182747.589234-3-krishnaiah.bommu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|DM3PR11MB8684:EE_
x-ms-office365-filtering-correlation-id: 8079ba9d-31cf-40a9-065c-08dc69931ec7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?eGlSaTVkcWozSVVFa3pETHNyRi80ek5VVlNqdCtRelozTHRacnoxVUQ5em96?=
 =?utf-8?B?L1o4Q0ZiRzVpNDR0NjQyUTdISGxwU2E4VXBKbGNkOXlPYkhPUVVud1lieEwr?=
 =?utf-8?B?Z0prcXdzQzRFZE9iL0xqSU1Hbk9lQWhUUGxCVTVrTDhBOU1iaHlSSldrQlBU?=
 =?utf-8?B?UzBLNzlCdi9mMEk2UEROM2F1b3BTZVg5YmdCNzhVU3NseEtzZG1yaEFhYTk0?=
 =?utf-8?B?bUoxbjNVV3JQeGUrRlpLZzN6Z29CNjcrWC95dmhZckJXTEdaTkk3R2UyVWs0?=
 =?utf-8?B?VS8rRC8wbVZEVVpSaEVUSGhmbERpbkRMTDVYOExhcGQ2RDZGMmZVNHVMSTZk?=
 =?utf-8?B?Uk1tV2RaUFcxNmhtZWI5ckJuMFZYQ3JIaHdDd2syTXVVWDZFSlVheVZvUHJp?=
 =?utf-8?B?WmFaWlZZNUhmNHhtNlFwY2dGSm5ITGtuOWlMdEhEVDhJRjlMc2xSYjVpRTBM?=
 =?utf-8?B?a2dIcDFYdm5kNWtBVXdOdzIwZkhaRE4rWksxbE41VkgvVHZJN1ZhOE9yV0x3?=
 =?utf-8?B?dit1MHZkYXVSK1hSd1p1WUp0K3pWdnBWUThSdlBNc1k3ZlcyYm5peTRYeGRP?=
 =?utf-8?B?K3BHOXl5dkdIRW5nZkVDWlloWGdxL1VWYk5iaVRQUTJUQUdzMjNYUDBsREg4?=
 =?utf-8?B?N1dmWisxWmtGUVVoS0JIWDJRUzRleVlUOGRmWFQ2UVVwK2tKTGtYNGJJR1d6?=
 =?utf-8?B?U2d1dHJlMUx5Z1VwNERxdHZEV3hpYk1lSlNUTzJ5RXI5REY2TGNkQU84T2dp?=
 =?utf-8?B?N3ZMVWo5VDg2UjZJeEdzYnBoci80MlFWUXUvYTZ0Q2d5Tkl6bmN4V1YzMk9W?=
 =?utf-8?B?eW5HM2JpQitBMjJla0EzR2VEdzhmMFQwenJLWHI5Ry9DMkZLY0wzYURRMUF1?=
 =?utf-8?B?ajJPajA5dCtPcjZnSXNCWjh6U1UzNFRPbUU1SUIzSVlUS1QyOElWVGtXbXVi?=
 =?utf-8?B?bXAxZG9kalI3N3NXMEwySm4xbmFxTkdhSS80RXAxNlN4NU42QTBHSEl3V2x5?=
 =?utf-8?B?ckdUcXM5dGVYNitKRSszWVcvVmcvWWV0a21LdlkzZ0JlYUx5RVNOak5JdDJ1?=
 =?utf-8?B?Z1cxUGxWTE8wZ25ROUJvSENVTkRQZ1pjZ0h2bVd0K1pSSnpJaWR2dlNGWjlP?=
 =?utf-8?B?dVNsa2s5MlFtZ0c0YWM3TDNPRm5jbWZZcjF3TmVScEEwWnZiMEwxK3pobVdx?=
 =?utf-8?B?YUVsNmIyRDREQUFWcWdiZDAxWkVNSnZrOW4xa1AreE5JTFcyR0diNUZpTUxZ?=
 =?utf-8?B?ekFUZ2ZGclJOcGJpNkVXSllRVGNEaDdCeWVaMlZLL29WSE9XVGVjcnc0d1Ra?=
 =?utf-8?B?dWRGM09MVTZiSFhkU1IyT2FMdDJaU1dGbXB3Z3NmNlM4dklkSjhzeXYveG1Y?=
 =?utf-8?B?K0lxbjdITXpxcEtGUVIxb0E0UXl5S3hSR25ySkp3bmtVc1J2WFc2bGNka250?=
 =?utf-8?B?empXdkFOU0JVRnZwV29XY01uWXNBK2IrQnpZY0FaS0NoS2RZTVgyNXE5TjBr?=
 =?utf-8?B?SWRSY0RUVVF3TGRKUkQyZ0czamQvRVozM2lycUI2RC9IZ1RNRWFveFIzdldN?=
 =?utf-8?B?NWxJb2hRbG1TRWh0NkRXeEYydXR3eDlVbTNNUUNUMzk5MGVCek5XRk9SNFNG?=
 =?utf-8?B?dTQwZDAyK3FmazVNL3FRdmVycnZFZEpGY2NQSDhyVFNlNXRnMDlJeXlsMXF5?=
 =?utf-8?B?K2dudElRb3dtOVkzTUZkbTE5bVQ2aHhvRUZGd2Vma0JBZ3pFQ1hnVW1IYjNq?=
 =?utf-8?B?YUF3YklhSzNwUW83M3lNOU9XVHJwQ0t2c0JhQVh3VzVDaHg3Z2NyeFE3TDRn?=
 =?utf-8?B?VHk2S3NUdHJDa2lHQ2dndz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UE81WjloQXlzT3FQTGR0dG1tL09Ncy8zTC9KTFVWUkJVeGdxb2x2NHk4RThZ?=
 =?utf-8?B?bFU4bDRlWDhnbE9DRjEwSzlkZlpnRHFIVXN4aWpyTUZENkFLdDc2OSt0UjhW?=
 =?utf-8?B?RXl2ZlFTUVN2Yy94a3BrMkVWcExCa2owaXh4TlZ4TGp4MDZ1L2x3RHhuNEtU?=
 =?utf-8?B?YzlHbWJaMjVTeWRBSmp6REFqZ01VVjlaU29lSVYzaWhIOUVmSzk2WWJMU2lp?=
 =?utf-8?B?REFnYW9pNDBzT3dwaTJGTFg3WXNsT0JzZENERFZBSzZhVGU0UDZLSCtoNVdX?=
 =?utf-8?B?cm1Tc0cyWldGS2pKVVRBWkN2d2dYYUlVYjdIdU05dzkxY05JSlhLd3Z2RUZE?=
 =?utf-8?B?SzdEdktsSjZLdDJTOHpNZGQ1UlRlZUo1Wm80RHMzR3hBMWgxT2ZZcFY5U1pa?=
 =?utf-8?B?Y2c4VTYxaGhFalBaYVZnZnVVVVJ0WGdBUVFDZm9VMW1idVdYMHNtOThyUzh1?=
 =?utf-8?B?cER3eG5tTnQ1Z2ZrRmxBVWsydy9OMFh1bFdScE9CRit2RXRtRGsvV1VtT3lC?=
 =?utf-8?B?SFZkZTYvUytWd0x0TU9uMmhqWGlVZTdTMFNONmxjTkQySkxFZjQ2cHlPNURm?=
 =?utf-8?B?bnJlWWx3N2FRVGs2alhYRFdmd0NyMmdyY3dZM1gyQXpSV3RRZXI4Rk5wY3Zq?=
 =?utf-8?B?a1RXMWh6dzJMMGpEMG5OdlRPOHhwcFNNRHFBTElvUFhQeENnTGVOcW53a3JE?=
 =?utf-8?B?a2JHZ1ZBcVBiWGZXeHE1aVpLUFp6Yk50S1Z0aXUwMDR0M0UvRVlSWHEvRVpJ?=
 =?utf-8?B?cWJPaDQ1OHZvb2toNUp5dXBEYit5VXBvZEFBOEFxd0c2UGVRMjNTWFVrcHYv?=
 =?utf-8?B?ZFV3aURJZkNwRXJsYlpZN0J4WWUyTm9WMm9qYnE1bkp4RENEOGVlSFF2TXd2?=
 =?utf-8?B?QWNNaDEvWHd4d3djU0Y1T1ZjRFlTMFRvUkcvdmViaWgyYmdYTWNXSkVlRkc3?=
 =?utf-8?B?R0NNUHlWY1ZuK3ZhQnduRVZ4dTJQZ21FcThLUGI3VHRob2xheVU5Z0UxQkZX?=
 =?utf-8?B?VmlqSFdvL3dSMHNlcEhQKzd6VDloYnZjSHVyRlRXTXpqYlA1bDREaE5GWlhn?=
 =?utf-8?B?MU9zb2l0YkhtUVExS2M0N3A5OTIzYUZDSFY2cWNjczRRa2RiMmlPQ2RmV0ZG?=
 =?utf-8?B?dXFjbGlDa2J4aHZQUHg2Z3krT25ydjBtRW9hbVY1dGdMVUhScytlcDkxeC9H?=
 =?utf-8?B?NXNFWVo3eU9EWW4rQldGeTl0TEdFSnovVFRnUWFqRTF0enE0RmZSU1JJQnVQ?=
 =?utf-8?B?R1ZvVkg3S29MVTEvV2p6ZDNCdHdoSU5PTlRDOHllelZlbXZqaE0xSCtLOFdV?=
 =?utf-8?B?OUpvcHVhb0MzNURSVTh2cDVaVjhBTkZLQ1RWWlUxU0FCRm5JK2pNM29tR1RV?=
 =?utf-8?B?cEw3LzJLT0kwTWIvWmc5alU3c1VNSXlBTWVaMG1Qc2dSMmhZaGlTdVREVm1T?=
 =?utf-8?B?ckRPK0Y2UnFycHRqR3pQMkRPQ1lacnk2MHBhMVBCVzJReE9iNnRnTWN3eGht?=
 =?utf-8?B?MzFtU2dtYU40RDdnWTZrWUVZdFJTY09jKzBJbnYvSjQ1Qy9ZTmh3b3RaR1dY?=
 =?utf-8?B?OE02bHVqUXZQL3RkckpKd0RmT1RiM1h2V0Z6OEpuZmkvSmkwMEV2WG1JNzNm?=
 =?utf-8?B?bE42OERCaVFNQjFlcnNvZHR0dDA3TStDbTF1emlHSFd1SWZncWFsZDJCYUhh?=
 =?utf-8?B?blBIMTlObDIzRDhBbHRreXRCSHF6TE4yNk5PMkI3L1VDMjBnMHFuMk9WSW43?=
 =?utf-8?B?aWJRbjhEbFJHcWdhR2VYcm9pU1FZTE9ndmd0R0FVNlprUy9jUE5pOERLWWJN?=
 =?utf-8?B?UGFiSlM5dHBYQ1ZPQW9VaG8rMktUUlYwdkdoa3htWUZpWEE1c0pvaStSY1Bw?=
 =?utf-8?B?R1BRV0NEMkQ4SERQN3JHdGEyTGpSaFZ1bi91bGMyVU54WGVXNEVVbkU4dkdm?=
 =?utf-8?B?cnFiNXQ4MXdnRGc3djcyeDRSQW40bXlSeGVqaytPUk8rNjV5TVdsOVhERms2?=
 =?utf-8?B?bTk5UE5Cd2hBQWJ0WDd2Uzd0SldLbStTOXU1STA5ODdTSDdKc2lmRVpxN3kz?=
 =?utf-8?B?M1VjVTBjMUprOWhpYmxMUCtsS0EyMklNWXVMbmlPWjhSZzNKTFU0TWhQc2xr?=
 =?utf-8?Q?ozTA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8079ba9d-31cf-40a9-065c-08dc69931ec7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2024 03:59:37.7197 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BKv9GES/kFb0zqEd+Q27lTG2wsLau1bnMNuDMsHFnHAvPC1tbOyzXDMdfStUwtyx5krULIyQmFoYXOfHOnhu+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8684
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQm9tbXUsIEtyaXNobmFp
YWggPGtyaXNobmFpYWguYm9tbXVAaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBBcHJpbCAz
MCwgMjAyNCAyOjI4IFBNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBD
YzogQm9tbXUsIEtyaXNobmFpYWggPGtyaXNobmFpYWguYm9tbXVAaW50ZWwuY29tPjsgWmVuZywg
T2FrDQo+IDxvYWsuemVuZ0BpbnRlbC5jb20+OyBHaGltaXJheSwgSGltYWwgUHJhc2FkDQo+IDxo
aW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggUkZDIGkt
Zy10IDIvMl0gdGVzdHMvaW50ZWwveGVfc3ZtOiBiYXNpYyB4ZV9zdm0gdGVzdA0KDQpUaGlzIGlz
IG5vdCBzdm0gdGVzdCB5ZXQuLi4NCg0KDQo+IA0KPiBBZGQgYmFzaWMgdGVzdCB0byB2YWxpZGF0
ZSBoZWxwZXIgZnVuY3Rpb25zIGludHJvZHVjZWQgaW4NCj4gJ2xpYi94ZS94ZV91dGlsOiBoZWxw
ZXIgZnVuY3Rpb24nLiBUaGlzIHRlc3Qgd3JpdGVzIHZhbHVlcw0KPiB0byB0aGUgZGVzdGluYXRp
b24gYnVmZmVyIHVzaW5nIEdQVSAoTUlfU1RPUkVfRFdPUkRfSU1NX0dFTjQpLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogQm9tbXUgS3Jpc2huYWlhaCA8a3Jpc2huYWlhaC5ib21tdUBpbnRlbC5jb20+
DQo+IENjOiBPYWsgWmVuZyA8b2FrLnplbmdAaW50ZWwuY29tPg0KPiBDYzogSGltYWwgUHJhc2Fk
IEdoaW1pcmF5IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIHRl
c3RzL2ludGVsL3hlX3N2bS5jIHwgOTkNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysNCj4gIHRlc3RzL21lc29uLmJ1aWxkICAgIHwgIDEgKw0KPiAgMiBmaWxl
cyBjaGFuZ2VkLCAxMDAgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3Rz
L2ludGVsL3hlX3N2bS5jDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfc3ZtLmMg
Yi90ZXN0cy9pbnRlbC94ZV9zdm0uYw0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAw
MDAwMDAwMDAuLmE5NTQ4NjFiYw0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL3Rlc3RzL2ludGVs
L3hlX3N2bS5jDQo+IEBAIC0wLDAgKzEsOTkgQEANCj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBNSVQNCj4gKyAvKg0KPiArICAqIENvcHlyaWdodCDCqSAyMDIzIEludGVsIENvcnBvcmF0
aW9uDQoNCg0KMjAyNA0KPiArICAqLw0KPiArDQo+ICsvKiogQGZpbGUgeGVfc3ZtLmMNCj4gKyAq
DQo+ICsgKiBUZXN0IHNoYXJlZCB2aXJ0dWFsIG1lbW9yeS4NCj4gKyAqDQo+ICsgKiBTaGFyZWQg
dmlydHVhbCBtZW1vcnkoc3ZtIGluIHNob3J0KSBpcyBhIHhlIGRyaXZlciBmZWF0dXJlDQo+ICsg
KiB3aGljaCBwcm92aWRlIHNoYXJlZCB2aXJ0dWFsIGFkZHJlc3Mgc3BhY2UgYi90IENQVSBhbmQg
R1BVDQo+ICsgKiBwcm9ncmFtLiBUaGlzIG1lYW5zIGFwcGxpY2F0aW9uIHdyaXRlciBjYW4ganVz
dCBtYWxsb2Mgb3IgbW1hcCwNCj4gKyAqIGFuZCB1c2UgdGhlIHJldHVybmVkIHB0ciBmb3IgYm90
aCBDUFUgYW5kIEdQVSBwcm9ncmFtLg0KPiArICoNCj4gKyAqIFRoaXMgdGVzdCB0aGUgc2hhcmVk
IHZpcnR1YWwgbWVtb3J5IGZ1bmN0aW9ucy4gVGhpcyBpbmNsdWRlcw0KPiArICogYmFzaWMgbWFs
bG9jLCBtbWFwIHRlc3QsIGFuIGludmFsaWQgdmEgdGVzcywgYSBtcHJvdGVjdCB0ZXN0IGFuZCBh
DQo+ICsgKiByYW5kb20gYWNjZXNzIHRlc3QuDQo+ICsgKi8NCj4gKw0KPiArLyoqDQo+ICsgKiBU
RVNUOiB4ZV9zdm0NCj4gKyAqIERlc2NyaXB0aW9uOiBUZXN0IHNoYXJlZCB2aXJ0dWFsIG1lbW9y
eQ0KPiArICogU3ViLWNhdGVnb3J5OiBNZW1vcnkgbWFuYWdlbWVudA0KPiArICogRnVuY3Rpb25h
bGl0eTogc3ZtDQo+ICsgKiBSdW4gdHlwZTogRlVMTA0KPiArICoNCj4gKyAqIFNVQlRFU1Q6IHN2
bS1iYXNpYy1tYWxsb2MNCj4gKyAqLw0KPiArDQo+ICsjaW5jbHVkZSA8ZmNudGwuaD4NCj4gKw0K
PiArI2luY2x1ZGUgImlndC5oIg0KPiArI2luY2x1ZGUgImxpYi9pZ3Rfc3luY29iai5oIg0KPiAr
I2luY2x1ZGUgImxpYi9pbnRlbF9yZWcuaCINCj4gKyNpbmNsdWRlICJsaWIveGUveGVfdXRpbC5o
Ig0KPiArI2luY2x1ZGUgInhlX2RybS5oIg0KPiArDQo+ICsjaW5jbHVkZSAieGUveGVfaW9jdGwu
aCINCj4gKyNpbmNsdWRlICJ4ZS94ZV9xdWVyeS5oIg0KPiArI2luY2x1ZGUgPHN0cmluZy5oPg0K
PiArDQo+ICsvKioNCj4gKyAqIFVzZSBtYWxsb2Mgb3IgbW1hcCBtZW1vcnkgZm9yIGRpcmVjdCBH
UFUgc3VibWlzc2lvbg0KPiArICovDQo+ICtzdGF0aWMgdm9pZCBzdm1fYmFzaWMoaW50IGZkLCB1
aW50MzJfdCB2bSwgc3RydWN0DQo+IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVjaSkN
Cj4gK3sNCj4gKwl1aW50NjRfdCBncHVfdmEgPSAweDFhMDAwMDsNCj4gKwl1aW50MzJfdCB2YWwg
PSAweGMwZmZlZTsNCj4gKwlzaXplX3QgYm9fc2l6ZSA9IHhlX2JiX3NpemUoZmQsIFBBR0VfQUxJ
R05fVUZFTkNFKTsNCg0KDQpUaGlzIGlzIGRlc3RpbmF0aW9uIGJ1ZmZlciBzaXplLCBub3QgdWZl
bmNlIHNpemUNCg0KDQpPYWsNCj4gKw0KPiArCXN0cnVjdCB4ZV9idWZmZXIgZHN0X2J1ZiA9IHsN
Cj4gKyAgICAgICAgICAgLmZkID0gZmQsDQo+ICsgICAgICAgICAgIC5ncHVfYWRkciA9ICh1aW50
NjRfdClncHVfdmEsDQo+ICsJICAgLnZtID0gdm0sDQo+ICsJICAgLnNpemUgPSBib19zaXplLA0K
PiArCSAgIC5wbGFjZW1lbnQgPSB2cmFtX2lmX3Bvc3NpYmxlKGZkLCBlY2ktPmd0X2lkKSwNCj4g
KwkgICAuZmxhZyA9IERSTV9YRV9HRU1fQ1JFQVRFX0ZMQUdfTkVFRFNfVklTSUJMRV9WUkFNLA0K
PiArICAgICB9Ow0KPiArDQo+ICsgICAgIHN0cnVjdCB4ZV9idWZmZXIgY21kX2J1ZiA9IHsNCj4g
KyAgICAgICAgICAgLmZkID0gZmQsDQo+ICsgICAgICAgICAgIC5ncHVfYWRkciA9ICh1aW50NjRf
dClncHVfdmEgKyBib19zaXplLA0KPiArCSAgIC52bSA9IHZtLA0KPiArCSAgIC5zaXplID0gYm9f
c2l6ZSwNCj4gKwkgICAucGxhY2VtZW50ID0gdnJhbV9pZl9wb3NzaWJsZShmZCwgZWNpLT5ndF9p
ZCksDQo+ICsJICAgLmZsYWcgPSBEUk1fWEVfR0VNX0NSRUFURV9GTEFHX05FRURTX1ZJU0lCTEVf
VlJBTSwNCj4gKyAgICAgfTsNCj4gKw0KPiArICAgICB4ZV9jcmVhdGVfYnVmZmVyKCZkc3RfYnVm
KTsNCj4gKyAgICAgeGVfY3JlYXRlX2NtZGJ1ZigmY21kX2J1ZiwgaW5zZXJ0X3N0b3JlLA0KPiAo
dWludDY0X3QpZHN0X2J1Zi5ncHVfYWRkciwgdmFsLCBlY2kpOw0KPiArICAgICB4ZV9zdWJtaXRf
Y21kKCZjbWRfYnVmKTsNCj4gKyAgICAgaWd0X2Fzc2VydF9lcSgqKHVpbnQzMl90ICopZHN0X2J1
Zi5jcHVfYWRkciwgdmFsKTsNCj4gKyAgICAgeGVfZGVzdHJveV9jbWRidWYoJmNtZF9idWYpOw0K
PiArICAgICB4ZV9kZXN0cm95X2J1ZmZlcigmZHN0X2J1Zik7DQo+ICt9DQo+ICsNCj4gK2lndF9t
YWluDQo+ICt7DQo+ICsJaW50IGZkOw0KPiArCXVpbnQzMl90IHZtOw0KPiArCXN0cnVjdCBkcm1f
eGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICpod2U7DQo+ICsNCj4gKwlpZ3RfZml4dHVyZSB7DQo+
ICsJCWZkID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9YRSk7DQo+ICsJCWlndF9yZXF1aXJlKHhl
X3N1cHBvcnRzX2ZhdWx0cyhmZCkpOw0KPiArCQl2bSA9IHhlX3ZtX2NyZWF0ZShmZCwNCj4gRFJN
X1hFX1ZNX0NSRUFURV9GTEFHX0xSX01PREUgfA0KPiBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfRkFV
TFRfTU9ERSwgMCk7DQo+ICsJfQ0KPiArDQo+ICsNCj4gKwlpZ3Rfc3VidGVzdF9mKCJzdm0tYmFz
aWMtbWFsbG9jIikNCj4gKwkJeGVfZm9yX2VhY2hfZW5naW5lKGZkLCBod2UpDQo+ICsJCQlzdm1f
YmFzaWMoZmQsIHZtLCBod2UpOw0KPiArDQo+ICsJaWd0X2ZpeHR1cmUgew0KPiArCQl4ZV92bV9k
ZXN0cm95KGZkLCB2bSk7DQo+ICsJCWRybV9jbG9zZV9kcml2ZXIoZmQpOw0KPiArCX0NCj4gK30N
Cj4gKw0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvbWVzb24uYnVpbGQgYi90ZXN0cy9tZXNvbi5idWls
ZA0KPiBpbmRleCA2NWI4YmYyM2IuLjZiZGQ3NjM0MyAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvbWVz
b24uYnVpbGQNCj4gKysrIGIvdGVzdHMvbWVzb24uYnVpbGQNCj4gQEAgLTMxNiw2ICszMTYsNyBA
QCBpbnRlbF94ZV9wcm9ncyA9IFsNCj4gIAkneGVfc3Bpbl9iYXRjaCcsDQo+ICAJJ3hlX3N5c2Zz
X2RlZmF1bHRzJywNCj4gIAkneGVfc3lzZnNfc2NoZWR1bGVyJywNCj4gKwkneGVfc3ZtJywNCj4g
IF0NCj4gDQo+ICBtc21fcHJvZ3MgPSBbDQo+IC0tDQo+IDIuMjUuMQ0KDQo=
