Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497B9C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 07:43:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C7310F50A;
	Thu, 25 Apr 2024 07:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hgoCKXx5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B634810F50A
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 07:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714030984; x=1745566984;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BIjPPM9mNGWqLn/zJUM/psOi5EG58c4VMraG4ygjwco=;
 b=hgoCKXx5MWBaqRuYKG4Jr0LgNQ8HdW9B+2zbO0yTWqeT2AD4IEMf80dI
 Ju6oIibmN0mCFAEfDc1hGEDp5rvnPcnEG7n30iTAmfxOz7uKvL3UvsMKb
 tbs0eGTPNyMvdgw2zy+L5k0HWg98p2i5l46QrcBjJo89dy9MS+5TTHqzP
 BWz4Gvj2aNGw55Txaxcs1lDhIumDSXpJLr7NDBw/1FqwDM1JEw9HxKxyT
 mgOphHggW59G7N1epD9llvtwBadHEFPobcOy+wIhc2W2EBVbbEuEQ6w2M
 pMuOBVZen9XRmJQgp6//VUWJxOx4s9IRFennEowk/BfQdY/6A3+j9hw3Y Q==;
X-CSE-ConnectionGUID: AYwZ8Y3/SyG/UW1K4oiCXw==
X-CSE-MsgGUID: PMJ0wr0YQmyFWIBsrgpiHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="13483904"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="13483904"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 00:43:04 -0700
X-CSE-ConnectionGUID: U5Rz11bITBC37dIqEeJZGg==
X-CSE-MsgGUID: pAR4CLkzQ2m1iI8wk3sB8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="29442499"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Apr 2024 00:43:03 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 00:43:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 00:43:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 00:43:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 00:43:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iem3jI/8lf/mbZsJ2H0NnQjNSVLYwYAaiFUIdUbpL4F0rDB1rMrQ3WM/JB0e71exHdB8KjRNblsSgIybHuz9t3JrLRYI3uVUnWaviQn4VKJz4vihAg+I+fiGrPzW0FMTEmNevj56i4IA8AudpLVIE6XkPQYzzOXDiK4IcLstVRJT6C7iCmf296N95WB5K3/nyKBuWZYuG7+UbavTOxXGoAvV0C4iUjVBIvsjnK8EZyWEigH0wKcsoPgOOq1WIStc/7V5UcPgH9HMJFjTrlcEgF4+BOyaApx9UVDP4rnbcZWy3jcKrUIaP8LYz4j9m89gMha64bXeg7Sozr+pJ8VSJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIjPPM9mNGWqLn/zJUM/psOi5EG58c4VMraG4ygjwco=;
 b=MBAHdfMyn2sE89m6PoGrl/FYH/JbBXj+GDefFG6G5IHnZZKl7iwZ3Gf2kpzHS4hAqHo2uQ67bGZewp9ysGLEXQYuYUI94rVGGlh2nYCS2+C6xFJzr7NcgeJeNqgwsaBJtvgRC6pvtIFGhZRYEB6V8payle/BUS/ueNpvJPlK4f+monyHRCn4Ql9hYDM85+Mqz3qCdfvv8K/QICqnuZ6iL2/GBYE64wg6+MtHAb7aRHHb1BJwyYOryfoUOTngVn2PJ1Isnq0ESELM6P04F/OZypwLZLcgVycu7d/BDfAJ4FEsGOu53Y82vHV1xlIAmtMC3dAYXxMudomC7SUpNkPmTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) by
 MN6PR11MB8244.namprd11.prod.outlook.com (2603:10b6:208:470::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Thu, 25 Apr
 2024 07:42:53 +0000
Received: from DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::5afc:274:3b02:f45]) by DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::5afc:274:3b02:f45%4]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 07:42:53 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>, Manasi Navare
 <navaremanasi@chromium.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: Drew Davenport <ddavenport@chromium.org>, =?utf-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Sean Paul <seanpaul@chromium.org>
Subject: RE: [PATCH v3 1/2] tests/kms_vrr: Add a subtest for seamless modeset
 to a virtual LRR mode
Thread-Topic: [PATCH v3 1/2] tests/kms_vrr: Add a subtest for seamless modeset
 to a virtual LRR mode
Thread-Index: AQHaloP2K8yy2wIZvUOn+U3OKqNmHLF4mkcAgAAAuDA=
Date: Thu, 25 Apr 2024 07:42:53 +0000
Message-ID: <DM8PR11MB565531ACC371041E7EC7AC90E0172@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <20240424201344.783935-1-navaremanasi@chromium.org>
 <64cef3df-1610-4d53-a44c-905220e09b76@intel.com>
In-Reply-To: <64cef3df-1610-4d53-a44c-905220e09b76@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5655:EE_|MN6PR11MB8244:EE_
x-ms-office365-filtering-correlation-id: 204fa3bb-20cf-4d71-78cc-08dc64fb5096
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?NjNHYXRXdVlnN3dhTjdaTit4KzVYVDFrOUQ0VWlua2d5TGRhdjVwRGFXZ2Zy?=
 =?utf-8?B?d3VDQUhPa2hIMkhXd2RZYXVPZDYwM1VxZG16d1RsOWxZRThKelloc3MwU01Z?=
 =?utf-8?B?T0NIaTRKUmhRUzFlQ0dmL29VN2hKNHp3RENycHdXNW50WVNyOWErMWtyK2p1?=
 =?utf-8?B?d1JLc2doT2laYlFDSTc1ZjZwNThpYWhqbS9oWlNnUlM1WWZEVUgxWWk4QTZX?=
 =?utf-8?B?WG1qb1pNK3NCdTY0VlV2azZJNUNBUXFyY0VoekJpUG5GcUt3RFBZditFa0Rl?=
 =?utf-8?B?b2JhOWRNeHFDd3g3OW5CMXhndmxEOGVmZ2ZhUmZ3TGI5T1ErT2Y4aU1WcEth?=
 =?utf-8?B?V3NieFkzMm9uMGxOZjNmbVNvOXRTR0pxZDlvblJTd3FFU3ZnS1ZiNXhnWnhQ?=
 =?utf-8?B?eHdzTkNyenVqMFlhRTI0czh3cEY5aHFrRWdSVXRiTkVPc1A5UXlMYytEM1dW?=
 =?utf-8?B?UHZENncyR1ZSd1VwKzc4dUwrdExYaHVOb25jQTR5dWlQUnl4MHFLbTZOaHAr?=
 =?utf-8?B?ZXJTLzhBaVRjSWd5NTM2c3RLbi9DWGlqVzFCaTh4SVZmNS8yb1BpTlZGQnls?=
 =?utf-8?B?TWxlWFNNSng0K09Bdytjb0hIZE83SVIzcEdHZXhGczI3QWdMM2ZrSWc5cWE5?=
 =?utf-8?B?Zzk3VGo3dTNvdjA4UlF2THhHeUFnWEgrZkVoUERyQ0czZnZoSnpKUzF1WW5y?=
 =?utf-8?B?bG5QU0FrTy9pd3lCSy9FbFFOZkl4MjNOQkRkTUoxSDZ2b3BhSTFFc1lXWlFt?=
 =?utf-8?B?RUh0dGgwYkxoZCsyYlZvVzN1UWdtT1pDdGkyNENoNjd4WFNsL1Q3Z0UxV0RD?=
 =?utf-8?B?RUhWUE14U2lGaEt1Wmo4cHl4cmZlazkwWDhIMGtSS2J1bThBQnQyVTQrZU1z?=
 =?utf-8?B?R3VlVDBtNTZEbEd6RzIwNm9CQjJhT05TMk5MVTBIS1FCQWdZcUd3VXpHTGk2?=
 =?utf-8?B?S05ORVpFOVRlZzBBMFJIOWdoODVid1Y3UXd3NlJRY09yOWMzZ1plK0FVazJN?=
 =?utf-8?B?K0pJM2xSVFNSMDAzaERUV0hLeFR0R3VNWm9sVmh4bE1NU0tHank1RGpuVkN1?=
 =?utf-8?B?OWRzeGwvcEU0TnNXWDEvR3JqaWZSWEtRdUU4NnVRMjZaSENQb2lLcG9sSU5J?=
 =?utf-8?B?MG8rZm0xWlBqS3U4ODEyMldkR1lQdmg3N3VDSmYwWEIvdURCOXJmWkZZMEhE?=
 =?utf-8?B?cjZ1R1BFQVFiV2JzU1BSNUZ5YkpXdnU3OUszSndpVURMSy9WQjZmQVNXRjdt?=
 =?utf-8?B?VmU3Qkh1cHVOT05sanpCTE5xMEsydmxvQ1BhZDc2aVNZb0hwWkRjY3VwdzIr?=
 =?utf-8?B?cSt5d0JqclBFekRkZ3B6ZFo1SUZNTGluMWNBZU5QOFNYTXhoRzVjYUdkcFdR?=
 =?utf-8?B?NHVaVUZPSVJkSW9RSXdzQUp1U3pXd0tON2tyc3dNY2Z3dmEwb1JxbGlwMFZ3?=
 =?utf-8?B?a203U2I4UFpIYkh5cTRuUmdXZ3hjbzZra2dDRUVQbkQ3eTJySnM0cXpyTVp2?=
 =?utf-8?B?UndsNTI5NVNkWWtNLzA4eFk5RlRsUTZRSXB4QTNmSi9mUDlPeW5JdnRtVVdG?=
 =?utf-8?B?a21wa2ZxbUZtamJ0SmhJZ0txMmdueTVGL3lETXJFTERUVWZlQnI5c2pkSlE4?=
 =?utf-8?B?ZlRFblBJaFJybk5kV2hQV3ZNa0dXbHRBKzJndFNNc09JYjk0bXQ5Zm1zcDMv?=
 =?utf-8?B?cEhyeGJ2TVY4aENhYXg3Ky9sY2RZdE13TktwaUg3clNsY1RUelgyK1NRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5655.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Slk4MDRSVElwQUVlSnpTeGNKV1lFMitnZjl1dndzS2dZaU5OVU5aTGt6ZFdF?=
 =?utf-8?B?Um1xd0NMc01qd3dxblBDM2F4TE5STCsrY2FPS0ZacWNNakRGRU15U0dPUHVG?=
 =?utf-8?B?WkFaZytROUNVZUpScGFBcXRKN01UanZwRGE1b0JwUFVVZkhRdHQ1RkYzYmpH?=
 =?utf-8?B?dGNKUTF1RG9nYURwS1VzZDRETjQwWWdocklJK1pmRFhOS2EzclRWR2VjcG9s?=
 =?utf-8?B?U1FrMkJuaisvQlVyN1FTRlFzR0FWeEsvdGdvNFA1ZU11ZFhmWEtUbXovelQ2?=
 =?utf-8?B?bkQ3VVQzLytlSVdXTDVUSjkyM2ZnbDVBUUEvSUwxZ0NkQ1dCeXZPVlg5UHFn?=
 =?utf-8?B?MlorSTYwUWZBbjBCQmRvcEZpSThYVFdEWVIxMXR4QXdodHAxRjcrbTgveVdh?=
 =?utf-8?B?VWFnRldHOTIrLzU4akRXWHpkeVdITXB4YWZXczFXV21NTUhtNGpZYXpuemlL?=
 =?utf-8?B?d2h6dVMwMVRkaUkvY2xTbEc3cUZady9aUHdUS2FJYmpQUUo3dW9qQXVqUm5s?=
 =?utf-8?B?WEV2VWZFbkMycGdvRzBhZjlVa3d3RVM0RHl6WThFbEtFRUhqa3llTzEvUlNP?=
 =?utf-8?B?MXNZRGFMclhXZC9JWjB0VXBRUjJjK2hvNjlLVGxWV0N3VTVHZzhzdm1pWTY3?=
 =?utf-8?B?Q2JVamdSNU5TVmhHQ3VlSGhrYW94UEh3VlRTSERzVTdXRUFOekFaamEyWmpl?=
 =?utf-8?B?dGFadjd3ZDExaHBSUnhsM29tUkgzaXpkVnpvMmJXSStvQjBwR001UlZiSDFO?=
 =?utf-8?B?QUpoak10YmR3NDFpMXhjOU1EcGpjN1ExZ0NRSDVGTjFzVWxVbmdKTmhUalJQ?=
 =?utf-8?B?Y0JRWEJCa01QNHZmTzBBVkoyTVZIWFlwVCtjM2t2cHExb1FEdlRlbldLd0tq?=
 =?utf-8?B?NC90enUrSlYwR1FiUnBydmJxbFRRTjM1eWRCN2hSVHpWR1RmT1NOTUxLa1RT?=
 =?utf-8?B?elRPTHZpVTRBN0JxTzRuRGRsSVJkbVpQM3E0ZU1FeUU2bU5zVXJxSU8xSmRq?=
 =?utf-8?B?WlhpNXgwN1NHMHFTZEY2Uld2TEtRcUVvUWgwTnZXNW9ZU0dicVJNM2ZWKzg1?=
 =?utf-8?B?Y1R1RE1iTzM0UFRzVm1SeDNNRE1hQjcycWxYd0VsNURKb0tPY2ZSUkZhTDho?=
 =?utf-8?B?OEl6cVdmUHlJdE5iVTh5YW1mRUZJdnIxTmR0ODA2UVU5TGJ1Z0JBdUMza0pW?=
 =?utf-8?B?Tk5RdW1VWXB0YVpaempLMlBZRVYxZEZYTFpoMmlaMGJiRmhCcFVGdE9EeXV4?=
 =?utf-8?B?cDlTaVNlYnlkamlCd2RFSlk0NWp5dURVWE5mOEJ4SjIxTmNteVRtbVJKLzBZ?=
 =?utf-8?B?dTJiVGtNZzUvcDBGcVgyWTZ2WHh4SVpVYWtLcnB1aXJVNVpBZ0F4S0wrL3dw?=
 =?utf-8?B?UE05RUhWQ2M0VXBmd25wenhBTFdWVHJwYmdacG9CV1dySWpJWHI4dldrSGJL?=
 =?utf-8?B?NU8zQVFlb1dNQVM5SURIUXI2Y1BPNTllaDNpRVVCOEVjdmxlZmw5bkRBenE5?=
 =?utf-8?B?WmhMQkNyMms2NDBzR1dmMXErNFRqRHJHR2dDR1phUUJoM3ZxOUlWbFREbW1Q?=
 =?utf-8?B?eW9kTzQyWi9OdnYvUzRXR3QyU1RabUN6bDZOTlV1WEUrOFV6bXhiM2JwNmRy?=
 =?utf-8?B?WGp0UzFNSkI1US8rRWl5TDFjUGJ5bERCVGROSEtOd1RkaW12bllEekJuZjJj?=
 =?utf-8?B?czM1TllrK3c5RlZ6L0Mxd1F3dUE5WUpBZldBOGRjNmlQWGErakRSMWh0MVpF?=
 =?utf-8?B?Q0VtUVVPcFh4NVF1YW1KdHVORktIUUFlVjZuQUJ2NzU3em5ha0h4UEZNRFhD?=
 =?utf-8?B?Lzg2RjFQOVliaktER3MyTjFnVUtNRVdpKzZQUkRjNjd6S3lhdW1EMitZV2JW?=
 =?utf-8?B?dkV0TXo0SGFJbFhKdUxlUkdtdHRXWEZXQXRMRHpqOWcrMEZpL3hZSDFVMlVr?=
 =?utf-8?B?VCszb2lFVm9rcHQ0RCsyWXN2Z1F0Zm14Z3cxSnN0a0RqVEoreE5LenNWNDRG?=
 =?utf-8?B?aElpRzI0SXY0cUtJN1lOYVcwaHZoejdFOUpWMjZlQVhFTHcvQkVHZTZ1Yk5n?=
 =?utf-8?B?L1J5RVViUHFCT3dJTzVkdkcvRVpHbml1Q1NoQUxFUURwS21sTEluNWptS0p0?=
 =?utf-8?Q?c0/fas4sthQNZLiASlbLPLYcj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5655.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 204fa3bb-20cf-4d71-78cc-08dc64fb5096
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2024 07:42:53.0960 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I1e3yLOb9H4X5GgSVWhUA4WPmWti5hJBwBEW52ZjjVG5To2WkWd4vuOprBFSSkr2mjG6owY6ea7u5lCFVt8l4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8244
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

SGksIA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2IDxpZ3Qt
ZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgTW9kZW0sDQo+
IEJoYW51cHJha2FzaA0KPiBTZW50OiBUaHVyc2RheSwgMjUgQXByaWwgMjAyNCAxMC4zOQ0KPiBU
bzogTWFuYXNpIE5hdmFyZSA8bmF2YXJlbWFuYXNpQGNocm9taXVtLm9yZz47IGlndC0NCj4gZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogRHJldyBEYXZlbnBvcnQgPGRkYXZlbnBvcnRA
Y2hyb21pdW0ub3JnPjsgVmlsbGUgU3lyasOkbMOkDQo+IDx2aWxsZS5zeXJqYWxhQGxpbnV4Lmlu
dGVsLmNvbT47IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHYzIDEvMl0gdGVzdHMva21zX3ZycjogQWRkIGEgc3VidGVzdCBmb3Igc2VhbWxl
c3MNCj4gbW9kZXNldCB0byBhIHZpcnR1YWwgTFJSIG1vZGUNCj4gDQo+IEhpIE1hbmFzaSwNCj4g
DQo+IE9uIDI1LTA0LTIwMjQgMDE6NDMgYW0sIE1hbmFzaSBOYXZhcmUgd3JvdGU6DQo+ID4gVGhp
cyBzdWJ0ZXN0IHZhbGlkYXRlcyBMUlIgZmFzdHNldCBmdW5jdGlvbmFsaXR5IGJ5IHRlc3Rpbmcg
c2VhbWxlc3MNCj4gPiBzd2l0Y2hpbmcgd2l0aG91dCBmdWxsIG1vZGVzZXQgdG8gYW55IG9mIHRo
ZSB2aXJ0dWFsIExSUiBtb2RlIHdpdGhpbiBWUlINCj4gcmFuZ2UuDQo+ID4gSGVyZSB3ZSBzdGFy
dCBmcm9tIGhpZ2hlc3QgcmVmcmVzaCByYXRlIG1vZGUgYW5kIHRoZW4gc3dpdGNoIHRvDQo+ID4g
dmlydHVhbCBMUlIgbW9kZXMgaW4gdGhlIHN0ZXBzIG9mIDEwSHogd2l0aGluIHRoZSBWUlIgcmFu
Z2UuDQo+ID4NCj4gPiBUaGlzIGlzIHVzZWQgdG8gdGVzdCB0aGUgTFJSIGZhc3RzZXQgZnVuY3Rp
b25hbGl0eSBvZiB0aGUgZHJpdmVyLg0KPiA+DQo+ID4gdjU6DQo+ID4gLSBQYXNzIGEgcmVmZXJl
bmNlIHRvIGZsaXBfYW5kX21lYXN1cmUgKGJoYW51KQ0KPiA+IC0gQWRkIGEgbmV3IGxpbmUgYmV0
d2VlbiBiZXR3ZWVuIGRlY2xhcmF0aW9uIGFuZCBjb2RlIGxvZ2ljDQo+ID4NCj4gPiB2NDoNCj4g
PiAtIENoYW5nZSB0aGUgdGVzdCBuYW1lIHRvIGFsaWduIHdpdGggZHJycy92cnIgdGVzdHMgKEJo
YW51KQ0KPiA+IC0gRml4IHNvbWUgYnVpbGQgd2FybmluZ3MgZHVlIHRvIHJlYmFzZQ0KPiA+IC0g
VXNlIGEgbG9jYWwgdmlydHVhbF9tb2RlIHZhcmlhYmxlDQo+ID4NCj4gPiB2MzoNCj4gPiAtIEZp
eCBidWlsZCBlcnJvciBkdWUgdG8gcmViYXNlIChNYW5hc2kpDQo+ID4NCj4gPiBDYzogRHJldyBE
YXZlbnBvcnQgPGRkYXZlbnBvcnRAY2hyb21pdW0ub3JnPg0KPiA+IENjOiBCaGFudXByYWthc2gg
TW9kZW0gPGJoYW51cHJha2FzaC5tb2RlbUBpbnRlbC5jb20+DQo+ID4gQ2M6IFZpbGxlIFN5cmrD
pGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQo+ID4gQ2M6IFNlYW4gUGF1bCA8
c2VhbnBhdWxAY2hyb21pdW0ub3JnPg0KPiA+IFNpZ25lZC1vZmYtYnk6IE1hbmFzaSBOYXZhcmUg
PG5hdmFyZW1hbmFzaUBjaHJvbWl1bS5vcmc+DQo+ID4gLS0tDQo+ID4gICB0ZXN0cy9rbXNfdnJy
LmMgfCA3Mw0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNjkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfdnJyLmMgYi90ZXN0cy9rbXNfdnJy
LmMgaW5kZXgNCj4gPiAxNWM2MmIzNGIuLjdmNjRkNjgwNiAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0
cy9rbXNfdnJyLmMNCj4gPiArKysgYi90ZXN0cy9rbXNfdnJyLmMNCj4gPiBAQCAtNjYsNiArNjYs
MTEgQEANCj4gPiAgICAqIERlc2NyaXB0aW9uOiBUZXN0IHRvIHN3aXRjaCBSUiBzZWFtbGVzc2x5
IHdpdGhvdXQgbW9kZXNldC4NCj4gPiAgICAqIEZ1bmN0aW9uYWxpdHk6IGFkYXB0aXZlX3N5bmMs
IGRycnMNCj4gPiAgICAqDQo+ID4gKyAqIFNVQlRFU1Q6IHNlYW1sZXNzLXJyLXN3aXRjaC12aXJ0
dWFsDQo+ID4gKyAqIERlc2NyaXB0aW9uOiBUZXN0IHRvIGNyZWF0ZSBhIFZpcnR1YWwgTW9kZSBp
biBWUlIgcmFuZ2UgYW5kIHN3aXRjaCB0byBpdA0KPiA+ICsgKiAJCXdpdGhvdXQgYSBmdWxsIG1v
ZGVzZXQuDQo+ID4gKyAqIEZ1bmN0aW9uYWxpdHk6IExSUg0KPiA+ICsgKg0KPiA+ICAgICogU1VC
VEVTVDogbWF4LW1pbg0KPiA+ICAgICogRGVzY3JpcHRpb246IE9zY2lsbGF0ZXMgYmV0d2VlbiBo
aWdoZXN0IGFuZCBsb3dlc3QgcmVmcmVzaCBlYWNoIGZyYW1lDQo+IGZvcg0KPiA+ICAgICogICAg
ICAgICAgICAgIG1hbnVhbCBmbGlja2VyIHByb2ZpbGluZw0KPiA+IEBAIC04OSw5ICs5NCwxMCBA
QCBlbnVtIHsNCj4gPiAgIAlURVNUX0ZMSVBMSU5FID0gMSA8PCAzLA0KPiA+ICAgCVRFU1RfU0VB
TUxFU1NfVlJSID0gMSA8PCA0LA0KPiA+ICAgCVRFU1RfU0VBTUxFU1NfRFJSUyA9IDEgPDwgNSwN
Cj4gPiAtCVRFU1RfRkFTVFNFVCA9IDEgPDwgNiwNCj4gPiAtCVRFU1RfTUFYTUlOID0gMSA8PCA3
LA0KPiA+IC0JVEVTVF9ORUdBVElWRSA9IDEgPDwgOCwNCj4gPiArCVRFU1RfU0VBTUxFU1NfVklS
VFVBTF9SUiA9IDEgPDwgNiwNCj4gPiArCVRFU1RfRkFTVFNFVCA9IDEgPDwgNywNCj4gPiArCVRF
U1RfTUFYTUlOID0gMSA8PCA4LA0KPiA+ICsJVEVTVF9ORUdBVElWRSA9IDEgPDwgOSwNCj4gPiAg
IH07DQo+ID4NCj4gPiAgIGVudW0gew0KPiA+IEBAIC0yMTQsNiArMjIwLDE4IEBAIGxvd19ycl9t
b2RlX3dpdGhfc2FtZV9yZXMoaWd0X291dHB1dF90DQo+ICpvdXRwdXQsIHVuc2lnbmVkIGludCB2
cnJfbWluKQ0KPiA+ICAgCXJldHVybiBtb2RlOw0KPiA+ICAgfQ0KPiA+DQo+ID4gK3N0YXRpYyBk
cm1Nb2RlTW9kZUluZm8NCj4gPiArdmlydHVhbF9ycl92cnJfcmFuZ2VfbW9kZShpZ3Rfb3V0cHV0
X3QgKm91dHB1dCwgdW5zaWduZWQgaW50DQo+ID4gK3ZpcnR1YWxfcmVmcmVzaF9yYXRlKSB7DQo+
ID4gKwlkcm1Nb2RlTW9kZUluZm8gbW9kZSA9ICppZ3Rfb3V0cHV0X2dldF9tb2RlKG91dHB1dCk7
DQo+ID4gKwl1aW50NjRfdCBjbG9ja19oeiA9IG1vZGUuY2xvY2sgKiAxMDAwOw0KPiA+ICsNCj4g
PiArCW1vZGUudnRvdGFsID0gY2xvY2tfaHogLyAobW9kZS5odG90YWwgKiB2aXJ0dWFsX3JlZnJl
c2hfcmF0ZSk7DQo+ID4gKwltb2RlLnZyZWZyZXNoID0gdmlydHVhbF9yZWZyZXNoX3JhdGU7DQo+
ID4gKw0KPiA+ICsJcmV0dXJuIG1vZGU7DQo+ID4gK30NCj4gPiArDQo+ID4gICAvKiBSZWFkIG1p
biBhbmQgbWF4IHZyciByYW5nZSBmcm9tIHRoZSBjb25uZWN0b3IgZGVidWdmcy4gKi8NCj4gPiAg
IHN0YXRpYyByYW5nZV90DQo+ID4gICBnZXRfdnJyX3JhbmdlKGRhdGFfdCAqZGF0YSwgaWd0X291
dHB1dF90ICpvdXRwdXQpIEBAIC02NDEsNiArNjU5LDQ5DQo+ID4gQEAgdGVzdF9zZWFtbGVzc19y
cl9iYXNpYyhkYXRhX3QgKmRhdGEsIGVudW0gcGlwZSBwaXBlLCBpZ3Rfb3V0cHV0X3QNCj4gKm91
dHB1dCwgdWludDMNCj4gPiAgIAkJICAgICB2cnIgPyAib24iIDogIm9mZiIsIHZyciA/ICJub3Qg
cmVhY2hlZCIgOiAiZXhjZWVkZWQiLCByZXN1bHQpOw0KPiA+ICAgfQ0KPiA+DQo+ID4gK3N0YXRp
YyB2b2lkDQo+ID4gK3Rlc3Rfc2VhbWxlc3NfdmlydHVhbF9ycl9iYXNpYyhkYXRhX3QgKmRhdGEs
IGVudW0gcGlwZSBwaXBlLA0KPiA+ICtpZ3Rfb3V0cHV0X3QgKm91dHB1dCwgdWludDMyX3QgZmxh
Z3MpIHsNCj4gPiArCXVpbnQzMl90IHJlc3VsdDsNCj4gPiArCXVuc2lnbmVkIGludCB2cmVmcmVz
aDsNCj4gPiArCXVpbnQ2NF90IHJhdGVbXSA9IHswfTsNCj4gPiArDQo+ID4gKwlpZ3RfaW5mbygi
VXNlIEhJR0hfUlIgTW9kZSBhcyBkZWZhdWx0XG4iKTsNCj4gPiArCWttc3Rlc3RfZHVtcF9tb2Rl
KCZkYXRhLT5zd2l0Y2hfbW9kZXNbSElHSF9SUl9NT0RFXSk7DQo+ID4gKw0KPiA+ICsJcHJlcGFy
ZV90ZXN0KGRhdGEsIG91dHB1dCwgcGlwZSk7DQo+ID4gKwlyYXRlWzBdID0NCj4gPiArcmF0ZV9m
cm9tX3JlZnJlc2goZGF0YS0+c3dpdGNoX21vZGVzW0hJR0hfUlJfTU9ERV0udnJlZnJlc2gpOw0K
PiA+ICsNCj4gPiArCS8qDQo+ID4gKwkgKiBTaW5rIHdpdGggRFJSIGFuZCBWUlIgY2FuIGJlIGlu
IGRvd25jbG9jayBtb2RlIHNvDQo+ID4gKwkgKiBzd2l0Y2ggdG8gaGlnaGVzdCByZWZyZXNoIHJh
dGUgbW9kZS4NCj4gPiArCSAqLw0KPiA+ICsJaWd0X291dHB1dF9vdmVycmlkZV9tb2RlKG91dHB1
dCwgJmRhdGEtDQo+ID5zd2l0Y2hfbW9kZXNbSElHSF9SUl9NT0RFXSk7DQo+ID4gKwlpZ3RfYXNz
ZXJ0KGlndF9kaXNwbGF5X3RyeV9jb21taXRfYXRvbWljKCZkYXRhLT5kaXNwbGF5LA0KPiA+ICtE
Uk1fTU9ERV9QQUdFX0ZMSVBfRVZFTlQsIE5VTEwpID09IDApOw0KPiA+ICsNCj4gPiArCXJlc3Vs
dCA9IGZsaXBfYW5kX21lYXN1cmUoZGF0YSwgb3V0cHV0LCBwaXBlLCByYXRlLCAxLA0KPiBURVNU
X0RVUkFUSU9OX05TKTsNCj4gPiArCWlndF9hc3NlcnRfZihyZXN1bHQgPiA3NSwNCj4gPiArCQkg
ICAgICJSZWZyZXNoIHJhdGUgKCV1IEh6KSAlIlBSSXU2NCJuczogVGFyZ2V0IHRocmVzaG9sZCBu
b3QNCj4gcmVhY2hlZCwgcmVzdWx0IHdhcyAldSUlXG4iLA0KPiA+ICsJCSAgICAgZGF0YS0+c3dp
dGNoX21vZGVzW0hJR0hfUlJfTU9ERV0udnJlZnJlc2gsIHJhdGVbMF0sDQo+IHJlc3VsdCk7DQo+
ID4gKw0KPiA+ICsJLyogU3dpdGNoIHRvIFZpcnR1YWwgUlIgKi8NCj4gPiArCWZvciAodnJlZnJl
c2ggPSBkYXRhLT5yYW5nZS5taW4gKyAxMDsgdnJlZnJlc2ggPCBkYXRhLT5yYW5nZS5tYXg7DQo+
IHZyZWZyZXNoICs9IDEwKSB7DQo+ID4gKwkJZHJtTW9kZU1vZGVJbmZvIHZpcnR1YWxfbW9kZSA9
DQo+IHZpcnR1YWxfcnJfdnJyX3JhbmdlX21vZGUob3V0cHV0LA0KPiA+ICt2cmVmcmVzaCk7DQo+
ID4gKw0KPiA+ICsJCWlndF9pbmZvKCJSZXF1ZXN0aW5nIFZpcnR1YWwgTW9kZSB3aXRoIFJlZnJl
c2ggUmF0ZSAoJXUgSHopOg0KPiBcbiIsIHZyZWZyZXNoKTsNCj4gPiArCQlrbXN0ZXN0X2R1bXBf
bW9kZSgmdmlydHVhbF9tb2RlKTsNCj4gPiArDQo+ID4gKwkJaWd0X291dHB1dF9vdmVycmlkZV9t
b2RlKG91dHB1dCwgJnZpcnR1YWxfbW9kZSk7DQo+ID4gKwkJaWd0X2Fzc2VydChpZ3RfZGlzcGxh
eV90cnlfY29tbWl0X2F0b21pYygmZGF0YS0+ZGlzcGxheSwgMCwNCj4gTlVMTCkNCj4gPiArPT0g
MCk7DQo+ID4gKw0KPiA+ICsJCXJhdGVbMF0gPSByYXRlX2Zyb21fcmVmcmVzaCh2cmVmcmVzaCk7
DQo+ID4gKwkJcmVzdWx0ID0gZmxpcF9hbmRfbWVhc3VyZShkYXRhLCBvdXRwdXQsIHBpcGUsIHJh
dGUsIDEsDQo+IFRFU1RfRFVSQVRJT05fTlMpOw0KPiA+ICsJCWlndF9hc3NlcnRfZihyZXN1bHQg
PiA3NSwNCj4gPiArCQkJICAgICAiUmVmcmVzaCByYXRlICgldSBIeikgJSJQUkl1NjQibnM6IFRh
cmdldA0KPiB0aHJlc2hvbGQgbm90IHJlYWNoZWQsIHJlc3VsdCB3YXMgJXUlJVxuIiwNCj4gPiAr
CQkJICAgICB2cmVmcmVzaCwgcmF0ZVswXSwgcmVzdWx0KTsNCj4gPiArCX0NCj4gPiArfQ0KPiA+
ICsNCj4gPiAgIHN0YXRpYyB2b2lkIHRlc3RfY2xlYW51cChkYXRhX3QgKmRhdGEsIGVudW0gcGlw
ZSBwaXBlLCBpZ3Rfb3V0cHV0X3QNCj4gKm91dHB1dCkNCj4gPiAgIHsNCj4gPiAgIAlpZiAodnJy
X2NhcGFibGUob3V0cHV0KSkNCj4gPiBAQCAtNjg2LDcgKzc0Nyw3IEBAIHN0YXRpYyBib29sIG91
dHB1dF9jb25zdHJhaW50KGRhdGFfdCAqZGF0YSwNCj4gaWd0X291dHB1dF90ICpvdXRwdXQsIHVp
bnQzMl90IGZsYWdzDQo+ID4gICAJaWd0X291dHB1dF9vdmVycmlkZV9tb2RlKG91dHB1dCwNCj4g
PiAmZGF0YS0+c3dpdGNoX21vZGVzW0hJR0hfUlJfTU9ERV0pOw0KPiA+DQo+ID4gICAJLyogU2Vh
cmNoIGZvciBhIGxvdyByZWZyZXNoIHJhdGUgbW9kZS4gKi8NCj4gPiAtCWlmICghKGZsYWdzICYg
KFRFU1RfU0VBTUxFU1NfVlJSIHwgVEVTVF9TRUFNTEVTU19EUlJTKSkpDQo+ID4gKwlpZiAoIShm
bGFncyAmIChURVNUX1NFQU1MRVNTX1ZSUiB8IFRFU1RfU0VBTUxFU1NfRFJSUyB8DQo+ID4gK1RF
U1RfU0VBTUxFU1NfVklSVFVBTF9SUikpKQ0KPiANCj4gRG9lcyB0aGlzIHZpcnR1YWwgUlIgYXBw
bGljYWJsZSB0byBlRFAgb25seSBvciBzdXBwb3J0cyBvdGhlciBjb25uZWN0b3IgdHlwZXMNCj4g
dG9vPyBJZiBpdCBpcyBlRFAgc3BlY2lmaWMgWypdLCB0aGVuIHdlIG11c3QgYWRkIGEgY2hlY2sg
Zm9yIHRoYXQuDQo+IA0KPiBbKl06DQo+IGh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvZHJt
L2lndC1ncHUtdG9vbHMvdHJlZS90ZXN0cy9rbXNfdnJyLmMjbjY2MA0KPiANCj4gV2l0aCBhYm92
ZSBjb21tZW50IGFkZHJlc3NlZCwgdGhpcyBwYXRjaCBpcw0KPiBSZXZpZXdlZC1ieTogQmhhbnVw
cmFrYXNoIE1vZGVtIDxiaGFudXByYWthc2gubW9kZW1AaW50ZWwuY29tPg0KPiANCj4gLSBCaGFu
dQ0KQXJlIHRob3NlIEJBVCByZXN1bHRzIGFjY2VwdGFibGUgdG9vPyANCg0KQnIsDQpKYW5pDQoN
Cg0KPiANCj4gPiAgIAkJcmV0dXJuIHRydWU7DQo+ID4NCj4gPiAgIAlkYXRhLT5zd2l0Y2hfbW9k
ZXNbTE9XX1JSX01PREVdID0NCj4gbG93X3JyX21vZGVfd2l0aF9zYW1lX3JlcyhvdXRwdXQsDQo+
ID4gZGF0YS0+cmFuZ2UubWluKTsgQEAgLTg0MSw2ICs5MDIsMTAgQEAgaWd0X21haW5fYXJncygi
ZHJzOiIsIGxvbmdfb3B0cywNCj4gaGVscF9zdHIsIG9wdF9oYW5kbGVyLCAmZGF0YSkNCj4gPiAg
IAkJCSAgICAgImJldHdlZW4gZmxpcCB0aW1lc3RhbXBzIGNvbnZlcmdlcyB0byB0aGUNCj4gcmVx
dWVzdGVkIHJhdGUiKTsNCj4gPiAgIAkJaWd0X3N1YnRlc3Rfd2l0aF9keW5hbWljKCJmbGlwLWJh
c2ljLWZhc3RzZXQiKQ0KPiA+ICAgCQkJcnVuX3Zycl90ZXN0KCZkYXRhLCB0ZXN0X2Jhc2ljLCBU
RVNUX0ZBU1RTRVQpOw0KPiA+ICsNCj4gPiArCQlpZ3RfZGVzY3JpYmUoIlRlc3QgdG8gc3dpdGNo
IHRvIGFueSBjdXN0b20gdmlydHVhbCBtb2RlIGluDQo+IFZSUiByYW5nZSB3aXRob3V0IG1vZGVz
ZXQuIik7DQo+ID4gKwkJaWd0X3N1YnRlc3Rfd2l0aF9keW5hbWljKCJzZWFtbGVzcy1yci1zd2l0
Y2gtdmlydHVhbCIpDQo+ID4gKwkJCXJ1bl92cnJfdGVzdCgmZGF0YSwgdGVzdF9zZWFtbGVzc192
aXJ0dWFsX3JyX2Jhc2ljLA0KPiA+ICtURVNUX1NFQU1MRVNTX1ZJUlRVQUxfUlIpOw0KPiA+ICAg
CX0NCj4gPg0KPiA+ICAgCWlndF9maXh0dXJlIHsNCg==
