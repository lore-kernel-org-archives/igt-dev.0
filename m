Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D6CC52D7C
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 07:04:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A4A10E88F;
	Wed, 21 Aug 2024 07:04:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWzR7xRB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D924B10E45A
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 07:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724223869; x=1755759869;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=344XONKzY7gcGelmR5nKQVJoF2eS+0tMyqssM0yMLYI=;
 b=dWzR7xRBXGvqVhaqry3hha3TM2AA1eCCOShWZum6Z4YsB6V+f45T8WTR
 Z3zOkWyCqsePRsezwJj1wyhDVzF9DJAeljXDArBrPND44XIyPkjLn3/tx
 1dJVXF7fazVrWXj2q0JpRxKoBQrseBg9TDNUGcLHT4yXg+6juf91AopWh
 lbo6hdVLYjBfIgU3tB+FbbciCFvcv0H1Lz0yesJJRBXbJGBTW/DTRJKf7
 EOPSdC05heuWN3oybyMUcmekZjT1fVcKxV4VFqvAd7BshK7060SJJkSkv
 FmTe01kIX5sMM3YgS6lSPEdOLfm18XYA9uZSJ6sSecp0oSCnt6ZVGRaZ+ A==;
X-CSE-ConnectionGUID: TUq0Q6sFQFOfcvMWOOsJNA==
X-CSE-MsgGUID: KzD1I2UCTC6EAstQMVuQMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22706146"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22706146"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 00:04:29 -0700
X-CSE-ConnectionGUID: DLWB70poSdSP17FrzIoEig==
X-CSE-MsgGUID: J/xdB79lSq2lXCE9gjjXDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="91778711"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 00:04:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 00:04:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 00:04:27 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 00:04:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8EnFSSNEBdsm1c2RDOeSoOPxXYyQ+V6dYhPHrlr2lUAB8pghUvZsih4g+8OQUuXuc+QQVlHdvn7338egO1G5d9El4SwZpF4fBAeuMzZMI4nU2IcnDxIX6OIa7gCuD6oAJqBs9GXQG9fLohxCwzat2l7aHns7mu6Hksvlf9z2KmLAc8fCqt3QHM+ZoGUijFqV9sP4rTEllbXZwYLASpnBkUxZD4FhyGeSfo1pJn+Da+RudcTiKqG+tKKZu9l2reMnr1PvyooLAEAhfUrPi7jfIMbgC3YgbjU1MMQhbQA1avAn4nYoGGHUIrMrFOF9QtOVvHoxN6rM1Fc5HdRc24UtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=344XONKzY7gcGelmR5nKQVJoF2eS+0tMyqssM0yMLYI=;
 b=zFzNLNkKRNZMyBDZOgP52a0Bw6be92K+Wo4ruG3H3t7iGvu8Pqbj8SJbSPEsO436neXzqk/HN35NirAGB42eEnwGu/5ArmFnqVwQSFXY9dRHxreVm9kvjDjoYtbP3xY5V6yg+c87wFMueFMAu7+fT18maP8nsr0sXLzmH0ZCdQRzenHUvoHx//f1xacFhp2jkqLdgu8KJry6LMFbhNkBtNM9j5L8+oeHTDTI1NOmfPp8JVanJWNBfD5oESkg7syWKmJaejPBAFd38D+mJiA3LRK228TbN6mFYgXvWNHtMZcEYmyYGt/Bb76q/BrCwD2vCIjnqw3isgjQo+49pCgt2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by MW4PR11MB6864.namprd11.prod.outlook.com (2603:10b6:303:21b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Wed, 21 Aug
 2024 07:03:58 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%5]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 07:03:57 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
CC: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Subject: Re: [PATCH i-g-t v2] lib/gpgpu_shader: Fix compilation warning and
 write dword shader
Thread-Topic: [PATCH i-g-t v2] lib/gpgpu_shader: Fix compilation warning and
 write dword shader
Thread-Index: AQHa7kqtxnhYlzqYdEe3s59qe3/RsLIu5EIAgAJvvAA=
Date: Wed, 21 Aug 2024 07:03:57 +0000
Message-ID: <d36dc4076906e156bae9d2cdc58357baaa6854de.camel@intel.com>
References: <20240814130423.1140740-1-dominik.grzegorzek@intel.com>
 <20240819175130.ou26fda5jnhqbs3l@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20240819175130.ou26fda5jnhqbs3l@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|MW4PR11MB6864:EE_
x-ms-office365-filtering-correlation-id: 25a9a191-67da-4b79-dec3-08dcc1af6cff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZnAvWjFPQWVjb1RwWVNjZWc4NTZERk4rNUdEeEVvcytCa29uQTVQU0JNSTNk?=
 =?utf-8?B?RnNtNEMyQ2xwMkZBSEJDRXpjb1NZSEx1N1J5M0dieVBsank4SCtaUzk4OGFz?=
 =?utf-8?B?MC80TFh3enZWb2I3T004Slk0eG5ZZVg4a2lyaEl5MnIweXBabUxlR2hIZzVs?=
 =?utf-8?B?UXE2dTNUNHNHbllHSHhuc0FydUg4YWZwd3V3SnpHaU5UQkNvNC9YTUo1N1Zs?=
 =?utf-8?B?bmVtcWFlaWt4aEF6ODNVeU1meTNyN1RrSTFFUWx2R0wrSGlaMUhibzFZWjRr?=
 =?utf-8?B?YUp4M0RMVkVtZ1dOVEVTU0RpMElmUlJySUVnRGpsd2Q1WnpBUGZwQlNDYXNR?=
 =?utf-8?B?Ti9Ddm1HM0xDSnBuVWZ6VEo3UWk3Umdic0kxc1JXOWZmcnN1QjRXQUZPSkFp?=
 =?utf-8?B?eUYyMzFDVVp4ekFWSVBFQU9tYU0rYktNeEUrczJvWGRJeEhQRk5LVlRDd1Fp?=
 =?utf-8?B?Z25KZHYzN0hxVGFVdlNNZnRCL2JNdER2cUsyeVgxaEZjaGd1Tm1ubmpwYjRG?=
 =?utf-8?B?TWxucXpWZDB0OUdCTmJIR0M1WE9DQjVsdGtEV3FiWnNuNVVrZXJuUElQd1Fu?=
 =?utf-8?B?UlJHZUlVUEFLYjB4WG8xZHVXaGhQY0V0T3NGeFZGcDRtUTlPNm95RlZUUXR4?=
 =?utf-8?B?NEZWWGozcytDVnNQYXhUOE5GODdGeGVaT0NDR25iNDVnWlh3RXJwQUZVdFd4?=
 =?utf-8?B?TEgzajhHTTJTT3RkVkJwUnpUSExRY0RScVJRQWtvR0J4bVl1VWpvVDl6NmRs?=
 =?utf-8?B?ZGdEcmFodkREdy8yMThhQytibSsyMHE4dllHbXBmdk95ckhWbDZuRm4wWjN2?=
 =?utf-8?B?Z1NnMHFEKzhNMk54aWk3azQzYm1ialVsRXpqR3FWZWVQVG5nM0RmMzE1UzZr?=
 =?utf-8?B?WWhqSnREalFFMXpGWlBOSzFnKzdsN3krUmlnR2haT2UyQnRsYWNLbHVQY0FG?=
 =?utf-8?B?b2ttdTE2NlloZWF4cXJOdXk1ZHJ6SU5mazJuVjg4bzFTdHNVWUpmb2haZUxY?=
 =?utf-8?B?OEhNOWV1VUpYR0VCWDBBRnJ4dWp0ZUNRNWhjUE9xM2oxSTBTYlFSZWZueFIz?=
 =?utf-8?B?b1Fia3N2VW5lcEQ2OFl2eUl3SFIyWmM0cjZzZE4xdFZMSVBWWkM4MmlNakFs?=
 =?utf-8?B?UE41USs4UTBKdlFDYjJrTjRwTU1aSW1IVGVKSE5FaXpyemxub1dMK0R3M0ds?=
 =?utf-8?B?dUJYR3JPdkI0ZGlIZjdSSC85MHJ6KzBEUElOcVpad2ViL3F1VTlGWGZ0STFl?=
 =?utf-8?B?V2hPK2VKUFhPeWdiZGRWUitmMGswU2d6MG4wdUNJNHZvWitxSU9saGpJMGRO?=
 =?utf-8?B?WXJ2VW4zODNqSjBRT2FUT3E3VE5SY2xGNGZteVVBd3pMcnpLQlFLVWJvNGYr?=
 =?utf-8?B?SUdYaWpnaDFBMDVVN2FNOWtIdW4vOVU1MXRmZ3NEWlBOTDN0ZjVWUGhLMjhB?=
 =?utf-8?B?MHVOYmpraVE5SDF1c2t3YmdvanNQSkZQaTQzVnEwdnBXcWI4NEQ3MTZZb1Br?=
 =?utf-8?B?c0tjTkM4M21uZWFmRjZCY1RaV2lSeTR3UGpRc2tVMTA2d2YzV1U1ZUtoWHlO?=
 =?utf-8?B?ajNaS01NOXl0V3Vtd0xvZG9EZml5ZjNnL0JhRHJYSHA3a0d0N0NrOGZFb0ow?=
 =?utf-8?B?cnlUSjF6M01iY3hWL1YreC9rU1krYlFDeVBKWGhMSHRvd2RvV0RWdGh2ci81?=
 =?utf-8?B?bFJkZFFmT1BpZmFONzBHMFd1LzF4QTd1SlpwKytYSXRCR0g4dE85VjFNTlFv?=
 =?utf-8?B?ZklXVDhmK1FNd25Fc1U2WnFjV3hlbDYxNGlWWGNyOERmK01GWktzS1Z5ZWdo?=
 =?utf-8?B?UEdRVHE1TUtXK0NFayswM1M0MC9YSW5Obkc0Y1RBdFpSczF6VC91NTQ4akYy?=
 =?utf-8?B?a3Q3RHlDWWZ2VDRWZ3ZYN3laRHdIcWhlcWJ5WS8rZ09XcXc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z25nbFdoc1NLSU5hRFpHVXZPck1LVTRZbmd6MlMycUlpUyt3MGJPWkVmQ3lW?=
 =?utf-8?B?UThWQk9XMFowbE00SCs5cXUzT1JmUEtQemdGMFhnT1BxZG92OEp3RTZBSjI2?=
 =?utf-8?B?OFcvWDdDcHhWaHNYdmJzb1BCc0hlc2FNdDFUbkdsSnE1N0k3UVFXNnplSStt?=
 =?utf-8?B?QUlIekdVMzFod2NockVSWXZqdU9jUDNrRnVvV2l5WkhYbDVGYTFzK05hUVlT?=
 =?utf-8?B?cFFFSjAvZzJFNTFDZVVYNlFIRFRmQ1FvUGlOcUFhUDNmZXY5TCtjcjduZ2cv?=
 =?utf-8?B?Ym5Lb1N5ckd1cHc3bWxPVW1GK0VxdDRaWldmV0htMlFTZlJnVDNlQzNkMTdT?=
 =?utf-8?B?UGJMV3NOTmdxcWNCK1NVc2UvWGc5WW1DVkdYWVpMcW8wa29TZXhHSDl0dmZG?=
 =?utf-8?B?TVAvYkpLa0dtNXRLM2Y5YkxuRm1jSi80VEhYendqQ3lLbDZITm01ZFpRaG1R?=
 =?utf-8?B?NjdURU91N3k2SzQ0Q1hJQTI1Qit6SnNwb3ZIa2VxN0RzYzJ3cDZ5aTlPbVd2?=
 =?utf-8?B?dmhDc0lYdGE1NG43ZExzT0dCV2Jqb3VXNFpHQkZkcDNEdldIMS9sVzQrYlZB?=
 =?utf-8?B?Ujk3OVc4SEpKdk1hZmZmWWpqM0lvOHZHNXg5Vy9NcXh4cVJ0dlZvWnM1bEZv?=
 =?utf-8?B?dWVrUW1rblNzTzczcysyTmVraTRKUmxKQXB0cWQzZXhvaUlGMlVYU3hTekVJ?=
 =?utf-8?B?OFFTTkNzTm1zMmRjV0JlMEdiOWxyM0JsSE1iTU9CeXN1T3V2TlFValc5azBz?=
 =?utf-8?B?bmc1M0U2bHRpRmJvb2FEWWlBeDJKUDlvNUVNaW5MSm16VUpvbU1jTm5sMVdZ?=
 =?utf-8?B?ckFoTktPY2Y2ZVhUTm1jU01QMVhQejYzSE9SdUcydmsvcUR0aEVRWUV1S1Q2?=
 =?utf-8?B?SUVNR3hXVU9MeVhFOUphbUNBSWdBVFJtUzJCaTFsL2xKeHJmeHJabjd0UWhE?=
 =?utf-8?B?S25wM1lYcnVYcExIc2FoYjNUb2JCb3IrSUlEM3M2NHB3NGJYbHNEM3V6d0ZH?=
 =?utf-8?B?NkcwT0ZJdm1nN3dHTFNXak5HdmkzMGkrWlZMN014QmhNUEE3OEt4cjFNWGxw?=
 =?utf-8?B?SVBndllXRU1ySHI4NjlrT0xPTFZ2SXV3UWNiMi9qeGw3d0p3WFlIZ0tXSWtT?=
 =?utf-8?B?NVRYcVpHemFWYkhmYit3ZkZxekZ0KzFyKzNoR25QQjd6cGpFVjNIVE1CT0Ru?=
 =?utf-8?B?SjQxSDJrcDJBMVFrdTlxN2d0cXR4aTVqMVpSTFlKNlZhK3dEWkE4eHdvRUg4?=
 =?utf-8?B?TDhzQlFvcEx6MTVZYWRvN0lTSUdvM2ZBVS8rZWYxYTBMQ2lCSFpCR2VtVkND?=
 =?utf-8?B?cEo5YzQ4YUJubkJmTitUeko0S2VoNlZaTkUyakhZUWFGZTBDQVhjWXk4TkFw?=
 =?utf-8?B?SmtpZkFIUldCK0ZiTGtBUE4rZlUvVEkxWElqeXo2RWJSbHBHN0Z4U0cwb3Ez?=
 =?utf-8?B?eUJ4NHRLcVhsT3dmekpqczJNc1RQVjh1M0lmbVliaVZrRHk2L1I2c2Rtd21Z?=
 =?utf-8?B?a2FUSFY1dFFITzdmWnlhdWh3aDVKT0hQMGFzUmkvWE1VMW1hYmJHMitxY0Rn?=
 =?utf-8?B?NWxQZ0kxUE1WK2l2eG9UaEtLU3p6dUZwSVhaUEJ3QXNlcko4eUZTK1FyRDBM?=
 =?utf-8?B?QmVmYUFMa29TUkNXSmlHaGxzSmpSd3hPS3FQVTRGbittS1l3QkoyV0hQZkpv?=
 =?utf-8?B?VlU0cjg0d251c1JjYlc0UzFoVEdCdUkxZmxPL2xKdCswQ2pEb0lONzQwYktQ?=
 =?utf-8?B?aThIZXM3ZzFJcEVjaXo4T2hVVzZNY1oyOGt0by93cXVXc0VzQWxMTXFHd2p1?=
 =?utf-8?B?OWprblJ2blBQbk5abWtrUHlJYzZ1ZzkyKzh2dGpWNWI2T2svMDN2MWtlNmR0?=
 =?utf-8?B?Q1VHTmdQdjN1Y0pIa1dwbVVYQ3NkZEh6aWlDUEJhSlVuY1QvTjRaZTJQbzlH?=
 =?utf-8?B?WnpGeW02bHI4aDdvWjJwRENXTzFKMlFBejdSaXFtV0E4WHhWZ1ljb0Jvdld6?=
 =?utf-8?B?MlJwM3o2T3V3NEd4WTdIOXBlT3djb0xQWkFYSnZxWGs3dStmUmZJWlQrUVc3?=
 =?utf-8?B?TVFhL1B1d1BkSzk0U0tNUnNLYUNXd3RqYXY1S1U3Wjc2eTFIenhxU2dFVkxw?=
 =?utf-8?B?VUdtSmVvTFpHYVB1QXRGV2MvV2R2K1EzUGJ3Q2p2YjNESDNZYm9IQTRQUEhs?=
 =?utf-8?Q?9MUmuMhdZ+P2mmrqGZih3rU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C17729F1B542D45AADC235DA08465AA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25a9a191-67da-4b79-dec3-08dcc1af6cff
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2024 07:03:57.1359 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TKoX2sfhLLCCFd/hTAwilMpnHFWwUIfsxxMSOvKHBPL1wpPLGtqNDbsUYD2ivI1ND1ozCgaE6hvHr6v9XKvLbrHHFqRRXp/EAXxpiTT9xfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6864
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

T24gTW9uLCAyMDI0LTA4LTE5IGF0IDE5OjUxICswMjAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6
DQo+IEhpIERvbWluaWssDQo+IE9uIDIwMjQtMDgtMTQgYXQgMTU6MDQ6MjMgKzAyMDAsIERvbWlu
aWsgR3J6ZWdvcnplayB3cm90ZToNCj4gPiAxKSBGaXggc3JjMV9udWxsIG1hY3JvIGRlZmluaXRp
b24gdG8gbWF0Y2ggcGxhdGZvcm1zIHdoaWNoIGFyZSBtZW50aW9uZWQgaW4NCj4gPiB0aGUgY29t
bWVudCBhYm92ZSB0aGUgZGVjbGFyYXRpb24uIChERzIrKQ0KPiA+IA0KPiA+IEZpeGVzOg0KPiA+
IGlnYTY0IC1YYXV0by1kZXBzIC1XYWxsIC1wPTEycDcxIGxpYi9pZ2E2NF9nZW5lcmF0ZWRfY29k
ZXMuYy5kL2lnYTY0X2Fzc2VtYmx5X2VvdC4xMnA3MS5hc20NCj4gPiBsaW5lIDIuMzc6IHdhcm5p
bmc6IFNyYzEuTGVuZ3RoIHNob3VsZCBzdWZmaXggc3JjMSByZWdpc3RlciAoZS5nLiByMTA6NCkN
Cj4gPiAoVykgc2VuZC5ndHd5ICg4fE0wKSBudWxsIHIxMTIgbnVsbCAwIDB4MDIwMDAwMDAge0VP
VH0NCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeDQo+ID4gMikgWmVy
byBvdXQgcjQgcmVnaXN0ZXIgaW4gbWVkaWEgYmxvY2sgd3JpdGUgbWVzc2FnZSB0byBwcmV2ZW50
DQo+ID4gICAgZXJyb3JzIHdoZW4gdGhlIHNhbWUgcmVnaXN0ZXIgd2FzIHVzZWQgZWFybGllciBp
biB0aGUgc2hhZGVyLg0KPiA+IA0KPiANCj4gQ291bGQgeW91IHNwbGl0IHRoaXMgcGF0Y2ggaW50
byB0d28gZml4ZXM/IE5vdyBzdWJqZWN0IHN1Z2dlc3QNCj4gdGhhdCB5b3UgZml4ZWQgb25lIHRo
aW5nIGFuZCB3cml0ZSBuZXcgZHdvcmQgc2hhZGVyLCB3aGlsZSBpdA0KPiBsb29rcyBsaWtlIHR3
byBmaXhlcz8NCj4gDQo+IFJlZ2FyZHMsDQo+IEthbWlsDQpTdXJlLCBJIHdpbGwgc3BsaXQgdGhl
bS4NCg0KUmVnYXJkcywNCkRvbWluaWsNCj4gDQo+ID4gdjI6IGNsZWFyIHI0IGJlZm9yZSBzZXR0
aW5nIHI1ICh3aXRoIHNtYWxsIGdyZnMgdGhlIGluc3RydWN0aW9uIGFsc28gY2xlYXJzIHI1KQ0K
PiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IERvbWluaWsgR3J6ZWdvcnplayA8ZG9taW5pay5ncnpl
Z29yemVrQGludGVsLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogQW5kcnplaiBIYWpkYSA8YW5kcnpl
ai5oYWpkYUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGxpYi9ncGdwdV9zaGFkZXIuYyAgICAg
ICAgICB8ICA0ICsrLS0NCj4gPiAgbGliL2lnYTY0X2dlbmVyYXRlZF9jb2Rlcy5jIHwgMTggKysr
KysrKysrKystLS0tLS0tDQo+ID4gIGxpYi9pZ2E2NF9tYWNyb3MuaCAgICAgICAgICB8ICAyICst
DQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0p
DQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2xpYi9ncGdwdV9zaGFkZXIuYyBiL2xpYi9ncGdwdV9z
aGFkZXIuYw0KPiA+IGluZGV4IDk5MTQ1NWM0OS4uODBiYWQzNDJhIDEwMDY0NA0KPiA+IC0tLSBh
L2xpYi9ncGdwdV9zaGFkZXIuYw0KPiA+ICsrKyBiL2xpYi9ncGdwdV9zaGFkZXIuYw0KPiA+IEBA
IC0yODEsNiArMjgxLDggQEAgdm9pZCBncGdwdV9zaGFkZXJfX3dyaXRlX2R3b3JkKHN0cnVjdCBn
cGdwdV9zaGFkZXIgKnNoZHIsIHVpbnQzMl90IHZhbHVlLA0KPiA+ICAJCQkgICAgICAgdWludDMy
X3QgeV9vZmZzZXQpDQo+ID4gIHsNCj4gPiAgCWVtaXRfaWdhNjRfY29kZShzaGRyLCBtZWRpYV9i
bG9ja193cml0ZSwgIgkJCQlcblwNCj4gPiArCS8vIENsZWFyIG1lc3NhZ2UgaGVhZGVyCQkJCQkJ
CVxuXA0KPiA+ICsoVykJbW92ICgxNnxNMCkgICAgICAgICAgICAgIHI0LjA8MT46dWQgICAgMHgw
OnVkCQkJCVxuXA0KPiA+ICAJLy8gUGF5bG9hZAkJCQkJCQkJXG5cDQo+ID4gIChXKQltb3YgKDF8
TTApICAgICAgICAgICAgICAgcjUuMDwxPjp1ZCAgICBBUkcoMyk6dWQJCQlcblwNCj4gPiAgKFcp
CW1vdiAoMXxNMCkgICAgICAgICAgICAgICByNS4xPDE+OnVkICAgIEFSRyg0KTp1ZAkJCVxuXA0K
PiA+IEBAIC0zMDMsOCArMzA1LDYgQEAgdm9pZCBncGdwdV9zaGFkZXJfX3dyaXRlX2R3b3JkKHN0
cnVjdCBncGdwdV9zaGFkZXIgKnNoZHIsIHVpbnQzMl90IHZhbHVlLA0KPiA+ICAJLy8gTG9hZCBy
Mi40LTcgd2l0aCB0ZyBpZCBZICsgQVJHKDEpOnVkCQkJCQlcblwNCj4gPiAgKFcpCW1vdiAoMXxN
MCkgICAgICAgICAgICAgICByMi4xPDE+OnVkICAgIHIwLjY8MDsxLDA+OnVkCQkJXG5cDQo+ID4g
IChXKQlhZGQgKDF8TTApICAgICAgICAgICAgICAgcjIuMTwxPjp1ZCAgICByMi4xPDA7MSwwPjp1
ZCAgICBBUkcoMSk6dWQJXG5cDQo+ID4gLQkvLyBwYXlsb2FkIHNldHVwCQkJCQkJCVxuXA0KPiA+
IC0oVykJbW92ICgxNnxNMCkgICAgICAgICAgICAgIHI0LjA8MT46dWQgICAgMHgwOnVkCQkJCVxu
XA0KPiA+ICAJLy8gU3RvcmUgWCBhbmQgWSBibG9jayBzdGFydCAoMTYwOjE5MSBhbmQgMTkyOjIy
MykJCQlcblwNCj4gPiAgKFcpCW1vdiAoMnxNMCkgICAgICAgICAgICAgICByNC41PDE+OnVkICAg
IHIyLjA8MjsyLDE+OnVkCQkJXG5cDQo+ID4gIAkvLyBTdG9yZSBYIGFuZCBZIGJsb2NrIG1heF9z
aXplICgyMjQ6MjMxIGFuZCAyMzI6MjM5KQkJCVxuXA0KPiA+IGRpZmYgLS1naXQgYS9saWIvaWdh
NjRfZ2VuZXJhdGVkX2NvZGVzLmMgYi9saWIvaWdhNjRfZ2VuZXJhdGVkX2NvZGVzLmMNCj4gPiBp
bmRleCA2YTA4YzQ4NDQuLjg3MjcwYmI0NiAxMDA2NDQNCj4gPiAtLS0gYS9saWIvaWdhNjRfZ2Vu
ZXJhdGVkX2NvZGVzLmMNCj4gPiArKysgYi9saWIvaWdhNjRfZ2VuZXJhdGVkX2NvZGVzLmMNCj4g
PiBAQCAtMywxMCArMywxMSBAQA0KPiA+ICANCj4gPiAgI2luY2x1ZGUgImdwZ3B1X3NoYWRlci5o
Ig0KPiA+ICANCj4gPiAtI2RlZmluZSBNRDVfU1VNX0lHQTY0X0FTTVMgMmM1MDNjYmZiZDdiMzA0
M2U5YTUyMTg4YWU0ZGE3YTgNCj4gPiArI2RlZmluZSBNRDVfU1VNX0lHQTY0X0FTTVMgOTZhYmYx
YWEyZDBjYzkwMGViYmE4MjAzY2VmZGQzMGMNCj4gPiAgDQo+ID4gIHN0cnVjdCBpZ2E2NF90ZW1w
bGF0ZSBjb25zdCBpZ2E2NF9jb2RlX21lZGlhX2Jsb2NrX3dyaXRlW10gPSB7DQo+ID4gIAl7IC5n
ZW5fdmVyID0gMjAwMCwgLnNpemUgPSA1NiwgLmNvZGUgPSAoY29uc3QgdWludDMyX3QgW10pIHsN
Cj4gPiArCQkweDgwMTAwMDYxLCAweDA0MDU0MjIwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLA0K
PiA+ICAJCTB4ODAwMDAwNjEsIDB4MDUwNTQyMjAsIDB4MDAwMDAwMDAsIDB4YzBkZWQwMDMsDQo+
ID4gIAkJMHg4MDAwMDA2MSwgMHgwNTE1NDIyMCwgMHgwMDAwMDAwMCwgMHhjMGRlZDAwNCwNCj4g
PiAgCQkweDgwMDAwMDYxLCAweDA1MjU0MjIwLCAweDAwMDAwMDAwLCAweGMwZGVkMDA1LA0KPiA+
IEBAIC0xNCwxNSArMTUsMTUgQEAgc3RydWN0IGlnYTY0X3RlbXBsYXRlIGNvbnN0IGlnYTY0X2Nv
ZGVfbWVkaWFfYmxvY2tfd3JpdGVbXSA9IHsNCj4gPiAgCQkweDgwMDAwMDY5LCAweDAyMDU4MjIw
LCAweDAyMDAwMDE0LCAweGMwZGVkMDAwLA0KPiA+ICAJCTB4ODAwMDAwNjEsIDB4MDIxNTAyMjAs
IDB4MDAwMDAwNjQsIDB4MDAwMDAwMDAsDQo+ID4gIAkJMHg4MDAwMTk0MCwgMHgwMjE1ODIyMCwg
MHgwMjAwMDIxNCwgMHhjMGRlZDAwMSwNCj4gPiAtCQkweDgwMTAwMDYxLCAweDA0MDU0MjIwLCAw
eDAwMDAwMDAwLCAweDAwMDAwMDAwLA0KPiA+IC0JCTB4ODAwNDFhNjEsIDB4MDQ1NTAyMjAsIDB4
MDAyMjAyMDUsIDB4MDAwMDAwMDAsDQo+ID4gKwkJMHg4MDA0MTk2MSwgMHgwNDU1MDIyMCwgMHgw
MDIyMDIwNSwgMHgwMDAwMDAwMCwNCj4gPiAgCQkweDgwMDAwMDYxLCAweDA0NzU0MjIwLCAweDAw
MDAwMDAwLCAweGMwZGVkMDAyLA0KPiA+ICAJCTB4ODAxMzIwMzEsIDB4MDAwMDAwMDAsIDB4ZDAw
ZTA0OTQsIDB4MDQwMDAwMDAsDQo+ID4gIAkJMHg4MDAwMDAwMSwgMHgwMDAxMDAwMCwgMHgyMDAw
MDAwMCwgMHgwMDAwMDAwMCwNCj4gPiAgCQkweDgwMDAwMDAxLCAweDAwMDEwMDAwLCAweDMwMDAw
MDAwLCAweDAwMDAwMDAwLA0KPiA+ICAJCTB4ODAwMDA5MDEsIDB4MDAwMTAwMDAsIDB4MDAwMDAw
MDAsIDB4MDAwMDAwMDAsDQo+ID4gIAl9fSwNCj4gPiAtCXsgLmdlbl92ZXIgPSAxMjcwLCAuc2l6
ZSA9IDU2LCAuY29kZSA9IChjb25zdCB1aW50MzJfdCBbXSkgew0KPiA+ICsJeyAuZ2VuX3ZlciA9
IDEyNzAsIC5zaXplID0gNjAsIC5jb2RlID0gKGNvbnN0IHVpbnQzMl90IFtdKSB7DQo+ID4gKwkJ
MHg4MDA0MDA2MSwgMHgwNDA1NDIyMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwNCj4gPiAgCQkw
eDgwMDAwMDYxLCAweDA1MDU0MjIwLCAweDAwMDAwMDAwLCAweGMwZGVkMDAzLA0KPiA+ICAJCTB4
ODAwMDAwNjEsIDB4MDUyNTQyMjAsIDB4MDAwMDAwMDAsIDB4YzBkZWQwMDQsDQo+ID4gIAkJMHg4
MDAwMDA2MSwgMHgwNTQ1NDIyMCwgMHgwMDAwMDAwMCwgMHhjMGRlZDAwNSwNCj4gPiBAQCAtMzgs
NyArMzksOCBAQCBzdHJ1Y3QgaWdhNjRfdGVtcGxhdGUgY29uc3QgaWdhNjRfY29kZV9tZWRpYV9i
bG9ja193cml0ZVtdID0gew0KPiA+ICAJCTB4ODAwMDAwMDEsIDB4MDAwMTAwMDAsIDB4MzAwMDAw
MDAsIDB4MDAwMDAwMDAsDQo+ID4gIAkJMHg4MDAwMDkwMSwgMHgwMDAxMDAwMCwgMHgwMDAwMDAw
MCwgMHgwMDAwMDAwMCwNCj4gPiAgCX19LA0KPiA+IC0JeyAuZ2VuX3ZlciA9IDEyNjAsIC5zaXpl
ID0gNTIsIC5jb2RlID0gKGNvbnN0IHVpbnQzMl90IFtdKSB7DQo+ID4gKwl7IC5nZW5fdmVyID0g
MTI2MCwgLnNpemUgPSA1NiwgLmNvZGUgPSAoY29uc3QgdWludDMyX3QgW10pIHsNCj4gPiArCQkw
eDgwMTAwMDYxLCAweDA0MDU0MjIwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLA0KPiA+ICAJCTB4
ODAwMDAwNjEsIDB4MDUwNTQyMjAsIDB4MDAwMDAwMDAsIDB4YzBkZWQwMDMsDQo+ID4gIAkJMHg4
MDAwMDA2MSwgMHgwNTE1NDIyMCwgMHgwMDAwMDAwMCwgMHhjMGRlZDAwNCwNCj4gPiAgCQkweDgw
MDAwMDYxLCAweDA1MjU0MjIwLCAweDAwMDAwMDAwLCAweGMwZGVkMDA1LA0KPiA+IEBAIC01Myw3
ICs1NSw4IEBAIHN0cnVjdCBpZ2E2NF90ZW1wbGF0ZSBjb25zdCBpZ2E2NF9jb2RlX21lZGlhX2Js
b2NrX3dyaXRlW10gPSB7DQo+ID4gIAkJMHg4MDAwMDAwMSwgMHgwMDAxMDAwMCwgMHgzMDAwMDAw
MCwgMHgwMDAwMDAwMCwNCj4gPiAgCQkweDgwMDAwOTAxLCAweDAwMDEwMDAwLCAweDAwMDAwMDAw
LCAweDAwMDAwMDAwLA0KPiA+ICAJfX0sDQo+ID4gLQl7IC5nZW5fdmVyID0gMTI1MCwgLnNpemUg
PSA1NiwgLmNvZGUgPSAoY29uc3QgdWludDMyX3QgW10pIHsNCj4gPiArCXsgLmdlbl92ZXIgPSAx
MjUwLCAuc2l6ZSA9IDYwLCAuY29kZSA9IChjb25zdCB1aW50MzJfdCBbXSkgew0KPiA+ICsJCTB4
ODAwNDAwNjEsIDB4MDQwNTQyMjAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsDQo+ID4gIAkJMHg4
MDAwMDA2MSwgMHgwNTA1NDIyMCwgMHgwMDAwMDAwMCwgMHhjMGRlZDAwMywNCj4gPiAgCQkweDgw
MDAwMDYxLCAweDA1MjU0MjIwLCAweDAwMDAwMDAwLCAweGMwZGVkMDA0LA0KPiA+ICAJCTB4ODAw
MDAwNjEsIDB4MDU0NTQyMjAsIDB4MDAwMDAwMDAsIDB4YzBkZWQwMDUsDQo+ID4gQEAgLTY5LDcg
KzcyLDggQEAgc3RydWN0IGlnYTY0X3RlbXBsYXRlIGNvbnN0IGlnYTY0X2NvZGVfbWVkaWFfYmxv
Y2tfd3JpdGVbXSA9IHsNCj4gPiAgCQkweDgwMDAwMDAxLCAweDAwMDEwMDAwLCAweDMwMDAwMDAw
LCAweDAwMDAwMDAwLA0KPiA+ICAJCTB4ODAwMDA5MDEsIDB4MDAwMTAwMDAsIDB4MDAwMDAwMDAs
IDB4MDAwMDAwMDAsDQo+ID4gIAl9fSwNCj4gPiAtCXsgLmdlbl92ZXIgPSAwLCAuc2l6ZSA9IDUy
LCAuY29kZSA9IChjb25zdCB1aW50MzJfdCBbXSkgew0KPiA+ICsJeyAuZ2VuX3ZlciA9IDAsIC5z
aXplID0gNTYsIC5jb2RlID0gKGNvbnN0IHVpbnQzMl90IFtdKSB7DQo+ID4gKwkJMHg4MDA0MDA2
MSwgMHgwNDA1NDIyMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwNCj4gPiAgCQkweDgwMDAwMDYx
LCAweDA1MDU0MjIwLCAweDAwMDAwMDAwLCAweGMwZGVkMDAzLA0KPiA+ICAJCTB4ODAwMDAwNjEs
IDB4MDUyNTQyMjAsIDB4MDAwMDAwMDAsIDB4YzBkZWQwMDQsDQo+ID4gIAkJMHg4MDAwMDA2MSwg
MHgwNTQ1NDIyMCwgMHgwMDAwMDAwMCwgMHhjMGRlZDAwNSwNCj4gPiBkaWZmIC0tZ2l0IGEvbGli
L2lnYTY0X21hY3Jvcy5oIGIvbGliL2lnYTY0X21hY3Jvcy5oDQo+ID4gaW5kZXggZjRlZjVjYjE2
Li4wM2NjNzI2ZDQgMTAwNjQ0DQo+ID4gLS0tIGEvbGliL2lnYTY0X21hY3Jvcy5oDQo+ID4gKysr
IGIvbGliL2lnYTY0X21hY3Jvcy5oDQo+ID4gQEAgLTcsNyArNyw3IEBADQo+ID4gICNkZWZpbmUg
SUdBNjRfTUFDUk9TX0gNCj4gPiAgDQo+ID4gIC8qIHNlbmQgaW5zdHJ1Y3Rpb24gZm9yIERHMisg
cmVxdWlyZXMgMCBsZW5ndGggaW4gY2FzZSBzcmMxIGlzIG51bGwsIEJTcGVjOiA0NzQ0MyAqLw0K
PiA+IC0jaWYgR0VOX1ZFUiA8IDEyNzENCj4gPiArI2lmIEdFTl9WRVIgPD0gMTI1MA0KPiA+ICAj
ZGVmaW5lIHNyYzFfbnVsbCBudWxsDQo+ID4gICNlbHNlDQo+ID4gICNkZWZpbmUgc3JjMV9udWxs
IG51bGw6MA0KPiA+IC0tIA0KPiA+IDIuMzQuMQ0KPiA+IA0KDQo=
