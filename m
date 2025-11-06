Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F3ECCF9F8
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 09:14:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177A310E142;
	Thu,  6 Nov 2025 09:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="loE032hL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A46610E142
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 09:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762420482; x=1793956482;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ngQcbfgdY8UXYv4xiJdlSDnhR4LfaJfksx03QPKVk+8=;
 b=loE032hLYwhYkHtkgt8Q4uJYjUZCw3wSclYJS272H+QC3dMTBh13GDaw
 f8E+ev3IP45DgEbAx9Pntpw/O9aNlfQRcq1g9gNyrzPiOoXP4I3YZG3vD
 8fsj4S55BzOwv3htqEZ47kWPnyjsT1imD297YRDe0xplJiQcWGBDn/p76
 qjoyDatCngnIbHAX7UAdL/vwz/cSIAdpM0ct4mLh1+XtqN//GQajZKVJm
 dWaykNWruvGkgyQ0Xa8kwE+oiZzVpeBM5mMYpNa40nM69Q/XoWhQ1SSBz
 xXVzlU1dOqs1Y1PTPMeeBVV17A5IeNlMuiszQR8a4VhJKq/hyfpGVD3Xi w==;
X-CSE-ConnectionGUID: CdR5dd84REO9bj9Xwi3fDg==
X-CSE-MsgGUID: uRTSft7ITWW1yeuSPwvNtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="87181410"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="87181410"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 01:14:41 -0800
X-CSE-ConnectionGUID: BneszsNsRsq5cNb4uycqKQ==
X-CSE-MsgGUID: lKszXkVQQPOzTcoqfXeQkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="192880411"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 01:14:41 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 01:14:40 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 01:14:40 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 01:14:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x+1h5c+j5occiWhA+Jm3fHkaUK9IPqmCQpST2y239XiDLBQwM759O+NbQMBK03HlR0jWLU0bINuRWWy/Mym9YtWYARZqffkNDBAadoWyeF8Utll5oUBMyDISFw7JnHsl8XpRCrEXNAacMwDHfcMjJZN3qO+Oc8pCnhOuk4cCu6KSYx0mXEJKFCEz1NFyZUPFJMw1ob4WK58qlXQBRrAGYiaP36q/U+GyMTUPV+vGKy0RtHF5VDxeWRig4cMS7f5+waet5jDVMsZwNYP2r9cVoLrcUq/EF6yshEK7RWjYWMSyM8CFSGHP2kc2mfdVLPpPoMAspDxJKN20/Wyve7RNIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngQcbfgdY8UXYv4xiJdlSDnhR4LfaJfksx03QPKVk+8=;
 b=HcaEJFtU6Jo7HNrMqSr98rmYfOQc1OkYug344scqccVYX5COAGA0CCSTpE0EyClMVLPnBjSIqSJ8k7Agomwf8bpciUOANNLW8R22OSyqu5v2xmzh1jf79AX6M+8DIZaFBVk1ZC1MgA2F1oQ6GBlc/93BAXK9CmpAjJofzRE1VdKDQTrJS0oQi6BF751xW9BC0pb+yt3bikRZaWd+HCkukLC+/9HU+TtTnGdW4hsX0+foI5/CeHrn5aBO0HMUJQw0GhcRifrm4pGt0LTpGpEuiBxifRdHce/Wo2h92BrmASLC+xCB3N0vodX8+q0ECuEDjvlVUzUBlNwy51hMYVM4ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SJ0PR11MB5133.namprd11.prod.outlook.com (2603:10b6:a03:2ac::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 09:14:38 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 09:14:38 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH] tests/intel/xe_pat: Add subtest to validate
 NO_COMPRESSION flag
Thread-Topic: [PATCH] tests/intel/xe_pat: Add subtest to validate
 NO_COMPRESSION flag
Thread-Index: AQHcTM9ACUWSboZGGkO7/+mzrqsoObTilVdggADZNICAAfE/IA==
Date: Thu, 6 Nov 2025 09:14:38 +0000
Message-ID: <CH3PR11MB8434D47B379190B89E01E36D8DC2A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20251103143027.2882191-2-sanjay.kumar.yadav@intel.com>
 <CH3PR11MB8434E6ADBD3922747C35006E8DC4A@CH3PR11MB8434.namprd11.prod.outlook.com>
 <a95d8f5c-feec-4703-81d6-7a31f3b0cbd2@intel.com>
In-Reply-To: <a95d8f5c-feec-4703-81d6-7a31f3b0cbd2@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SJ0PR11MB5133:EE_
x-ms-office365-filtering-correlation-id: 3c9d6bdd-d302-44dc-d307-08de1d14e96a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?MmZuaDlPNS9idzRzZU9KRlNrTFNXYWREdHZtRjduSlRvVzA5bVc1RlJCUVVr?=
 =?utf-8?B?RjYvc1hieXo3SnkzM2E0ZGdtKzQ5eERWN2pOOXlsNFF1OStyUVMvc2dXbXl3?=
 =?utf-8?B?NHF3WFRBMlFUb25KTUJRQ3MxMndvNzI3Mm5hcDE0dEtQNzFNcHlTYktHeVVW?=
 =?utf-8?B?cDUyQjBoSXg1eTdqZlFuV2ZlM1dJNlpYRDdWMFl6MTdZejUyN2dBVXdneGF0?=
 =?utf-8?B?U3c1Vjh3L3hUNXU1WjV2eC9MS1RwaFNYdTV1V0kyNFlrUWJGdm5SZG1wanF3?=
 =?utf-8?B?Y21rN005ZUVhZTdzMmZCNzF5S0NreXB5cEc3aVNVWFZNOVVyeFVWZ0E1QnlF?=
 =?utf-8?B?UG5zRWNmSVZ0NUliRlRaTk11dGc0VEthcTBNUmNwVnl4andYcTJ3U0lJQmxD?=
 =?utf-8?B?cExBcVFtcHhCc0FZV3FCTlZKRlUwczMxK2htTU9Kb3V1MW5kUFRrU0pVbzM0?=
 =?utf-8?B?Ukd2ZjJ4ZHN6RFFZd3hKWmpYeDBtSC9EMHZmOUJvTmhsYlVsRTdpNGNGSmtH?=
 =?utf-8?B?Mm1mOERtT0JPNzlaZU9xZTRHNWJCOWpjNSt3b21LUTEvMDE1bytPMmlIa1Ir?=
 =?utf-8?B?dEJNVmJXUDRwcnVsaENSbE93NkF4ayt4Q1U1bmRZZnNKcFR1aFZTTm9JRk9O?=
 =?utf-8?B?ZmhLT1pOVk55N0Y2RWJmK0xFRFpVdHNtcmZBZ2N4MEVaZ0J5anhjb2ovU3Qr?=
 =?utf-8?B?djZKbnVTa2trK3hxRVJZQkdIZUQxbzJIdGt2bWRSbEl2RiticS9yWkJDVkV0?=
 =?utf-8?B?am9FWHBNNzJmdjczZ3NKb2Vlb3FOTkNaNG51REFSZWh4YmQ4MDFQamN3WFo2?=
 =?utf-8?B?UDV4blBEeG1ZWkZpU0FLaDdibFc3cjNWUmNjb3B3YWx4WnZHeG1RcENhTDRQ?=
 =?utf-8?B?Q2dRVzErNWdXTkF3OEMrT1J2anVHKzJ5d1Yzd0J5S0luWndvdEVCbkZWK1FG?=
 =?utf-8?B?TU5VSHZlaEFRUCtBZEltRTBoTmhQM3ZLKzU2eDNjL1VLM0d5SEY0N2d2TmVJ?=
 =?utf-8?B?Nnp1UkdWaGNpZS9LT1FtdFNpa0hJbUVuZ3hLS2lUa2kxaUFtMlF2MmJhZGdj?=
 =?utf-8?B?MVI5SEpoV1R1T1lvZU1oTGROMEpXaUY3cjgwbEhYMUgrUHUvZWNFTVpWd21X?=
 =?utf-8?B?bkhlTS9uYmVBMldwUGFKaTVYSE1UK1FoTmdLRmJOZXdvWkM1WThLL0Q2aGxy?=
 =?utf-8?B?dDh5YzIrTlMwWFp1dzFRcUx2b2ZLeEdmOHU0TW1vRG5mR1NMaHBNNGUvTEZJ?=
 =?utf-8?B?Z3ovMkhJSEw1anNqc2wwdEREd2NwZ0t0VWF5b0c0T040bUt5SU9DYzhaRng2?=
 =?utf-8?B?OXNHZFNWNzl1OE5SMFovUmYrOHcxTDlnN1k3eTdydGFmZmIydHVmd1RNV1BS?=
 =?utf-8?B?Nys5c1p3dGhIYmg0OWhOVFBaZkxEalI3TDZKTDNPRFcyWGlFeExqcmVQY3di?=
 =?utf-8?B?bGVLdGlaRkJIRW0rZERiTmJpU1M1VStGL0tDa2hvTWVjS1Y5N0V0SmhKbTJm?=
 =?utf-8?B?dWJCQUNJcTJHdUxMS1VMdTk2NStVUTRjZFlhK1gwS3dsb0trUTNuSk1kdUd2?=
 =?utf-8?B?WjBLaEJnSHNENXUvbXorK2Z5dWtidFdzOFZCS1p3ZklxcHYvMlFTU3JhM1Vr?=
 =?utf-8?B?NFVDSERpbGYwVVlKdzRHamQxSFk4Q1ZGRGh3VEdtSDBUViswaFptMzlWVVNZ?=
 =?utf-8?B?VWQ2Szluc2drd1lRZHBrMElSbFBTZUpnck1CZHNmRnVpdkd0V1lHMFArSmQ4?=
 =?utf-8?B?MCtPaDh5eXJEQmFVOVRCd25KMmtFQmM2ZlB3UU5zbnRZZytsdU1ydDFMeUkw?=
 =?utf-8?B?L2N0b2kzVXlNZFRDd2Qwd0FxTy84VzVheTN3bUhMVkxJRVlReVF1TmxJWnpP?=
 =?utf-8?B?L1ZsRUJ0S0lYekROUXh1REJxandrdEtUUk9sY3RXMUgvb1Z0bmJvbmJ3d1ZC?=
 =?utf-8?B?Z2FoZUs4TnMxNXJjZG9OZVREalZzczk0Z0N0SEFoTlJxYXpEeGdpRWpiS3Bi?=
 =?utf-8?B?ZnZxVG4vUi93PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHdtRlVpbEdaQkZpeXlsL1BzQ1NDVmFCVitlM2c4VzNLZHFvYUpUZEF4bkFU?=
 =?utf-8?B?a29RRXhlbitSazJmNGNpODNSTlJWcXUvRVNOVUo2SzRCRThUWEpqY2c3ZXA5?=
 =?utf-8?B?bHJHU1c4UzhxcVY4RFoxYzVaZE4xQXNvRGlWU0lTMFRyR1RUT3pidmp2U1cx?=
 =?utf-8?B?ZE9KSzcyR2RnV1FDcjhoOEpWZ1ZqZnU0YitSVXZOOWZjb1lJV2tFQmc1WHIx?=
 =?utf-8?B?Tk5hSmdhU3NUUnhXcTUzWFZRNnpPdmJQdVVweDlWVHZwcGxMQnVxTjRCMTcx?=
 =?utf-8?B?bnZ4WHdRNHdadVdUbnpCd1YyZzNCYmFkczdQZXJ0ZnFKbjkrK3lNSkpMTVAw?=
 =?utf-8?B?bmtDNTMxWXlLTit5dTY1OGF5a2kzV2J3US9KR2ZzUHpOSlpDeTRXajhVUUgr?=
 =?utf-8?B?M3dWYURsK21DejFqWnVGSjcyVXFvK3R1WFNubHhRT21zNTdqTFc0UjZmZGRx?=
 =?utf-8?B?M3RheHBUKzFXUzI0azZxQWNwZTR2V3lZWVRLSEE1MDVpMUZBa2ZDSDRVSk1S?=
 =?utf-8?B?bk9CQWVvUXFLTVhaTVBKdnR0dU8xcG5VYU4wS0loVjRwTS9HUVJPdHB1RmRY?=
 =?utf-8?B?a0VsMmd3R0JSVXVtY0JEemRaWjFtK3VReUpFWWM4WWVnNy9Rb0FKQXRNSW1F?=
 =?utf-8?B?cnlmeVI5NTlHS1Q4MmVTZjlWZGwzNXVUR01nMDFhbngxVUk2bllESTFNbEdD?=
 =?utf-8?B?YUJsc1VWWThEQkh4dzc4Z1RoamhHa1d3enY1S21VNE5Jd05CZUVqTzlnU0Yw?=
 =?utf-8?B?R0t2WnZNaGtHWGdrVHZweXFVcEhCNmRYdW1uU01lcllzeDlzOHBvU2VhK1pH?=
 =?utf-8?B?am16ZStiRWk0UzlsQWkzLzlBWmhTK0NUbjJwdFlMa1B6d1dZQmJkVFNqSlM5?=
 =?utf-8?B?VkEvS3oxOFA1QWMydmx0aG5mYUZiN0Nya1dRbjdXQXpWVmx6YlF5M1hPMk9l?=
 =?utf-8?B?VHpXalNUMENlMExKdVllMW52Q3hHZzltVndMSWJaZU82dWVORW9mNWo2U1NQ?=
 =?utf-8?B?QWlGM3JyMXFVVm96UDhoZU5BUSs1cG5oejBoS2J5N3MzbGVwNjduNnhSNlNm?=
 =?utf-8?B?ZkczVDFxQS8xMnVGWnFXMm9GR2YxdEc4Q1o3clYwUHFjaU5FbWJMSE1hNkQy?=
 =?utf-8?B?b2plMjZFM3p4a0tZRVZqUTJ4Mksyc0VXZWNJMzNySmp1TVNGWW1aNTQrbWlC?=
 =?utf-8?B?Ty9jUGwxMjMySUwzTUtNV0xyUDVQdVEwZWdqQUhEczgwTDJUeVBCSW5SdnFk?=
 =?utf-8?B?NEtLL3VodE05TDRaZGh0LzIzRFFvK3RJYkQxMkV5Y3NEM2E2d0Fydk0rN3Vy?=
 =?utf-8?B?cXN6dStvaDBWeThKK3pHZVpCUVFpU0tJMitKejZyYVY1V3h4Zms3Ym8yRUh3?=
 =?utf-8?B?RmV5NGkvRWhiMHVRWFhTbXVkeFlvbURDZXdNb0pwUlNhcERsd1NYN2JveCtT?=
 =?utf-8?B?VDJIdEFzYWZGR0lla2RzSERxYWlzeXkzZ0pRWXNOblJkY2NXRjIyYkJyblNk?=
 =?utf-8?B?cFBXRzNOK2dlOC9vbm5Id29IY1h4cXJNWnF2MTkwUXlLaUFXRmg0THVlSVZs?=
 =?utf-8?B?UjRmS0hvenNlK3ZReWM3TnZlaFRkUnh5NG90dThJVXAyaHNxYks5cUx1NFFs?=
 =?utf-8?B?SDNURFJjUmlVdkJCZG16MGpxMi85Nys1OTlkNEpjYUJLa0UyM1BVSnR1Q0RK?=
 =?utf-8?B?RzBpV0I1MHZiTk1YOURoZWNvbzhKRkY2a2JzSmJKU1RyVDVXS0Y1VGIwWksr?=
 =?utf-8?B?NjB0NFJONTMydVFKazQ1QWNMamF1NGlJOGw0ejdzRnpPWEtObkhQcWJaaU1t?=
 =?utf-8?B?Z244Yzd5ZW9VRUo1a2Fnei94TjExaDNGQXA0bzJaSDNTMHB2Qms1bjh5Mi9X?=
 =?utf-8?B?MzVobncrSjBEYVdBMkhTT2NiUjVFWDBrdHdRcCtxRXVnZWlVb21QclY1cmpW?=
 =?utf-8?B?SGZqSW53NmRGZTJnaCtkcVlQc25kd1hkaC9sUS9ZbkR4cFIvMEFEUk94SEZQ?=
 =?utf-8?B?MTlsOGg5SENuc21sWjRrM0FEczRtNWRMdzdVQU8wc2MrNEpXSmV0T1BYR1k3?=
 =?utf-8?B?UGRIQ1Q5bnNhSlo2UXlvc1JmbjFsQ3o4WEtsNWZNeGIwTmJabzQ1NUNWNHNR?=
 =?utf-8?B?RjJkK1FmWFZTQlNaSXphMGEvOFI4Z21wcU9YalBpc3JWWGxyODN6ZzZQN2Z1?=
 =?utf-8?B?Mmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c9d6bdd-d302-44dc-d307-08de1d14e96a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 09:14:38.5627 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +bP+gU5wpv2qFuWV314G+H5jb7CF79YKNyqJ3Fxjn+Ec+m2O67x/ZriebopZJ2JzbIN+l3eDERKviuT6fwh6u36cf+86muKeYq8v6NsOrxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5133
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWWFkYXYsIFNhbmpheSBL
dW1hciA8c2FuamF5Lmt1bWFyLnlhZGF2QGludGVsLmNvbT4NCj4gU2VudDogMDUgTm92ZW1iZXIg
MjAyNSAwODo1NyBBTQ0KPiBUbzogRGFuZGFtdWRpLCBQcml5YW5rYSA8cHJpeWFua2EuZGFuZGFt
dWRpQGludGVsLmNvbT47IGlndC0NCj4gZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzog
QXVsZCwgTWF0dGhldyA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQ
QVRDSF0gdGVzdHMvaW50ZWwveGVfcGF0OiBBZGQgc3VidGVzdCB0byB2YWxpZGF0ZQ0KPiBOT19D
T01QUkVTU0lPTiBmbGFnDQo+IA0KPiANCj4gT24gMDQtMTEtMjAyNSAyMDowNSwgRGFuZGFtdWRp
LCBQcml5YW5rYSB3cm90ZToNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiA+PiBGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
PiBPbiBCZWhhbGYgT2YNCj4gPj4gU2FuamF5IFlhZGF2DQo+ID4+IFNlbnQ6IDAzIE5vdmVtYmVy
IDIwMjUgMDg6MDAgUE0NCj4gPj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
ID4+IENjOiBBdWxkLCBNYXR0aGV3IDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KPiA+PiBTdWJq
ZWN0OiBbUEFUQ0hdIHRlc3RzL2ludGVsL3hlX3BhdDogQWRkIHN1YnRlc3QgdG8gdmFsaWRhdGUN
Cj4gPj4gTk9fQ09NUFJFU1NJT04gZmxhZw0KPiA+Pg0KPiA+PiBBZGQgYm8tY29tcC1kaXNhYmxl
LWJpbmQgc3VidGVzdCB0byB2ZXJpZnkgdGhhdCBhIEJPIGNyZWF0ZWQgd2l0aA0KPiA+PiBEUk1f
WEVfR0VNX0NSRUFURV9GTEFHX05PX0NPTVBSRVNTSU9OIGNhbm5vdCBiZSBiaW5kIHdpdGggYQ0K
PiA+PiBjb21wcmVzc2VkIFBBVCBpbmRleCBvbiBYZTIrIChiaW5kIHNob3VsZCBmYWlsIHdpdGgg
LUVJTlZBTCkuDQo+ID4+DQo+ID4+IFRoaXMgZW5zdXJlcyB0aGUgZmxhZyB3b3JrcyBhcyBpbnRl
bmRlZCB0byBza2lwIENDUyBvcGVyYXRpb25zIGFuZA0KPiA+PiByZWxhdGVkIHN0YXRlIG1hbmFn
ZW1lbnQgZm9yIHN1Y2ggQk9zLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBTYW5qYXkgWWFk
YXYgPHNhbmpheS5rdW1hci55YWRhdkBpbnRlbC5jb20+DQo+ID4+IFN1Z2dlc3RlZC1ieTogTWF0
dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KPiA+PiAtLS0NCj4gPj4gICAuLi4v
ZHJtLXVhcGktZXhwZXJpbWVudGFsL2ludGVsX2RybV9sb2NhbC5oICAgfCAgMiArDQo+ID4+ICAg
dGVzdHMvaW50ZWwveGVfcGF0LmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNTMgKysrKysr
KysrKysrKysrKysrKw0KPiA+PiAgIDIgZmlsZXMgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKQ0K
PiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0tdWFwaS1leHBlcmltZW50YWwvaW50
ZWxfZHJtX2xvY2FsLmgNCj4gPj4gYi9pbmNsdWRlL2RybS0gdWFwaS1leHBlcmltZW50YWwvaW50
ZWxfZHJtX2xvY2FsLmgNCj4gPj4gaW5kZXggYjQ4YzllMjE5Li5mYzJhYWE0NjIgMTAwNjQ0DQo+
ID4+IC0tLSBhL2luY2x1ZGUvZHJtLXVhcGktZXhwZXJpbWVudGFsL2ludGVsX2RybV9sb2NhbC5o
DQo+ID4+ICsrKyBiL2luY2x1ZGUvZHJtLXVhcGktZXhwZXJpbWVudGFsL2ludGVsX2RybV9sb2Nh
bC5oDQo+ID4+IEBAIC0yMCw2ICsyMCw4IEBAIGV4dGVybiAiQyIgew0KPiA+PiAgICAqIGNsZWFu
IHRoZXNlIHVwIHdoZW4ga2VybmVsIHVhcGkgaGVhZGVycyBhcmUgc3luYydkLg0KPiA+PiAgICAq
Lw0KPiA+Pg0KPiA+PiArI2RlZmluZSBEUk1fWEVfR0VNX0NSRUFURV9GTEFHX05PX0NPTVBSRVNT
SU9OICgxIDw8IDMpDQo+ID4+ICsNCj4gPj4gICAjaWYgZGVmaW5lZChfX2NwbHVzcGx1cykNCj4g
Pj4gICB9DQo+ID4+ICAgI2VuZGlmDQo+ID4+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9w
YXQuYyBiL3Rlc3RzL2ludGVsL3hlX3BhdC5jIGluZGV4DQo+ID4+IDE2OTQwNTc5OS4uNTE3OWM2
M2ZkIDEwMDY0NA0KPiA+PiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9wYXQuYw0KPiA+PiArKysgYi90
ZXN0cy9pbnRlbC94ZV9wYXQuYw0KPiA+PiBAQCAtNzg1LDYgKzc4NSw1NiBAQCBzdGF0aWMgdm9p
ZCBwcmltZV9leHRlcm5hbF9pbXBvcnRfY29oKHZvaWQpDQo+ID4+ICAgCWRybV9jbG9zZV9kcml2
ZXIoZmQyKTsNCj4gPj4gICB9DQo+ID4+DQo+ID4+ICsvKioNCj4gPj4gKyAqIFNVQlRFU1Q6IGJv
LWNvbXAtZGlzYWJsZS1iaW5kDQo+ID4+ICsgKiBUZXN0IGNhdGVnb3J5OiBmdW5jdGlvbmFsaXR5
IHRlc3QNCj4gPj4gKyAqIERlc2NyaXB0aW9uOiBWYWxpZGF0ZXMgdGhhdCBiaW5kaW5nIGEgQk8g
Y3JlYXRlZCB3aXRoDQo+ID4+ICsgKiB0aGUgTk9fQ09NUFJFU1NJT04gZmxhZyB1c2luZyBhIGNv
bXByZXNzZWQgUEFUIGluZGV4IGZhaWxzDQo+ID4+ICsgKiB3aXRoIC1FSU5WQUwgb24gWGUyKyBw
bGF0Zm9ybXMuDQo+ID4+ICsgKi8NCj4gPj4gKw0KPiA+PiArc3RhdGljIHZvaWQgYm9fY29tcF9k
aXNhYmxlX2JpbmQoaW50IGZkKSB7DQo+ID4+ICsJc2l6ZV90IHNpemUgPSB4ZV9nZXRfZGVmYXVs
dF9hbGlnbm1lbnQoZmQpOw0KPiA+PiArCXVpbnQzMl90IGRldmlkID0gaW50ZWxfZ2V0X2RybV9k
ZXZpZChmZCk7DQo+ID4+ICsJdWludDhfdCBjb21wX3BhdF9pbmRleCwgdW5jb21wX3BhdF9pbmRl
eDsNCj4gPj4gKwl1aW50MzJfdCB2bSwgYm87DQo+ID4+ICsJaW50IHJldDsNCj4gPj4gKw0KPiA+
PiArCXJldCA9IF9feGVfYm9fY3JlYXRlX2NhY2hpbmcoZmQsIDAsIHNpemUsIHZyYW1faWZfcG9z
c2libGUoZmQsIDApLA0KPiA+PiArDQo+ID4+IERSTV9YRV9HRU1fQ1JFQVRFX0ZMQUdfTk9fQ09N
UFJFU1NJT04sDQo+ID4+ICsJCQkJICAgICBEUk1fWEVfR0VNX0NQVV9DQUNISU5HX1dDLCAmYm8p
Ow0KPiA+PiArDQo+ID4+ICsJaWYgKHJldCkgew0KPiA+PiArCQlpZ3RfYXNzZXJ0KGludGVsX2dy
YXBoaWNzX3ZlcihkZXZpZCkgPCBJUF9WRVIoMjAsIDApKTsNCj4gPj4gKwkJaWd0X2Fzc2VydF9l
cShyZXQsIC1FT1BOT1RTVVBQKTsNCj4gPj4gKwkJcmV0dXJuOw0KPiA+PiArCX0NCj4gPj4gKw0K
PiA+PiArCWlndF9hc3NlcnQoaW50ZWxfZ3JhcGhpY3NfdmVyKGRldmlkKSA+PSBJUF9WRVIoMjAs
IDApKTsNCj4gPiBDb2RlIGZyb20gcmV0IGNvbmRpdGlvbiBhbmQgdGhlIGFib3ZlIGFzc2VydCBs
aW5lIGNhbiBiZSByZW1vdmVkIGFzIGl0IGNhbg0KPiBiZSBqdXN0IGNoZWNrZWQgd2l0aCBpZ3Rf
cmVxdWlyZSB3aGljaCBJIG1lbnRpb25lZCBiZWxvdy4NCj4gPj4gKwl2bSA9IHhlX3ZtX2NyZWF0
ZShmZCwgMCwgMCk7DQo+ID4+ICsNCj4gPj4gKwljb21wX3BhdF9pbmRleCA9IGludGVsX2dldF9w
YXRfaWR4X3VjX2NvbXAoZmQpOw0KPiA+PiArCXVuY29tcF9wYXRfaW5kZXggPSBpbnRlbF9nZXRf
cGF0X2lkeF91YyhmZCk7DQo+ID4+ICsNCj4gPj4gKwkvKiBFeHBlY3QgZmFpbHVyZSB3aGVuIGJp
bmRpbmcgd2l0aCBjb21wcmVzc2VkIFBBVCBpbmRleCAqLw0KPiA+PiArCWlndF9hc3NlcnRfZXEo
X194ZV92bV9iaW5kKGZkLCB2bSwgMCwgYm8sIDAsIDB4MTAwMDAwLA0KPiA+PiArCQkJCSAgIHNp
emUsIDAsIDAsIE5VTEwsIDAsDQo+ID4+ICsJCQkJICAgMCwgY29tcF9wYXRfaW5kZXgsIDApLA0K
PiA+PiArCQkgICAgICAtRUlOVkFMKTsNCj4gPj4gKw0KPiA+PiArCS8qIEV4cGVjdCBzdWNjZXNz
IHdoZW4gYmluZGluZyB3aXRoIHVuY29tcHJlc3NlZCBQQVQgaW5kZXggKi8NCj4gPj4gKwlpZ3Rf
YXNzZXJ0X2VxKF9feGVfdm1fYmluZChmZCwgdm0sIDAsIGJvLCAwLCAweDEwMDAwMCwNCj4gPj4g
KwkJCQkgICBzaXplLCAwLCAwLCBOVUxMLCAwLA0KPiA+PiArCQkJCSAgIDAsIHVuY29tcF9wYXRf
aW5kZXgsIDApLA0KPiA+PiArCQkgICAgICAwKTsNCj4gPj4gKwl4ZV92bV91bmJpbmRfc3luYyhm
ZCwgdm0sIDAsIDB4MTAwMDAwLCBzaXplKTsNCj4gPj4gKw0KPiA+PiArCWdlbV9jbG9zZShmZCwg
Ym8pOw0KPiA+PiArDQo+ID4+ICsJeGVfdm1fZGVzdHJveShmZCwgdm0pOw0KPiA+PiArfQ0KPiA+
PiArDQo+ID4+ICAgLyoqDQo+ID4+ICAgICogU1VCVEVTVDogZGlzcGxheS12cy13Yi10cmFuc2ll
bnQNCj4gPj4gICAgKiBUZXN0IGNhdGVnb3J5OiBmdW5jdGlvbmFsaXR5IHRlc3QgQEAgLTE0NTEs
NiArMTUwMSw5IEBADQo+ID4+IGlndF9tYWluX2FyZ3MoIlYiLCBOVUxMLCBoZWxwX3N0ciwgb3B0
X2hhbmRsZXIsDQo+ID4+IE5VTEwpDQo+ID4+ICAgCWlndF9zdWJ0ZXN0KCJwcmltZS1leHRlcm5h
bC1pbXBvcnQtY29oIikNCj4gPj4gICAJCXByaW1lX2V4dGVybmFsX2ltcG9ydF9jb2goKTsNCj4g
Pj4NCj4gPj4gKwlpZ3Rfc3VidGVzdCgiYm8tY29tcC1kaXNhYmxlLWJpbmQiKQ0KPiA+IFRoZSBi
ZWxvdyBjb25kaXRpb24gaXMgZW5vdWdoOyB0ZXN0IHdpbGwgd29yayBmb3IgeGUyKyBwbGF0Zm9y
bXMgZWxzZSBpdCB3aWxsDQo+IHNraXAuIE5vIG5lZWQgdG8gd3JpdGUgdGhlIGNvbmRpdGlvbiBp
biB0aGUgZnVuY3Rpb24uDQo+ID4gaWd0X3JlcXVpcmUoaW50ZWxfZ3JhcGhpY3NfdmVyKGRldl9p
ZCkgPj0gSVBfVkVSKDIwLDApKTsNCj4gVXNpbmcgaWd0X3JlcXVpcmUoKSBhdCB0aGUgc3VidGVz
dCBsZXZlbCB3b3VsZCBzaW1wbHkgc2tpcCB0aGUgdGVzdCBvbg0KPiBwcmUtWGUyIHBsYXRmb3Jt
cywNCj4gYnV0IGluIHRoaXMgY2FzZSwgd2Ugd2FudCB0byBleHBsaWNpdGx5IHZhbGlkYXRlIHJl
amVjdGlvbiBiZWhhdmlvci4NCj4gSW5zdGVhZCBvZiBzaWxlbnRseSBza2lwcGluZywNCj4gdGhl
IHRlc3Qgc2hvdWxkIGFzc2VydCB0aGF0IGJ1ZmZlciBvYmplY3QgY3JlYXRpb24gZmFpbHMgd2l0
aCAtRU9QTk9UU1VQUCBpZg0KPiB0aGUgZmVhdHVyZSBpcyB1bnN1cHBvcnRlZC4NCj4gVGhpcyBl
bnN1cmVzIHRoZSBkcml2ZXIgY29ycmVjdGx5IHJlamVjdHMgQ0NTIGRpc2FibGUtYmluZCByZXF1
ZXN0cyBvbiBvbGRlcg0KPiBwbGF0Zm9ybXMsIGFuZCBhbHNvIGFzc2VydHMgdGhhdCB0aGUgZmVh
dHVyZSBpcyBhY2NlcHRlZCBvbiBYZTIrIHBsYXRmb3Jtcy4NCkJ1dCB0aGlzIGRvZXNu4oCZdCBt
YWtlIHNlbnNlLCBhcyB0aGUgdGVzdCB3aWxsIHN1Y2Nlc3NmdWxseSBwYXNzIG9uIHByZSB4ZTIr
IHBsYXRmb3JtcyBhcyB0aGUgYXNzZXJ0IGNvbmRpdGlvbiBpcyBzdWNjZXNzZnVsIGFuZCB0aGUg
cmVhc29uIGlzIHVua25vd24sIG9uIGEgaGlnaCBsZXZlbCBpdCBsb29rcyBsaWtlIHRlc3QgZXhl
Y3V0ZWQgc3VjY2Vzc2Z1bGx5IG9uIHRoZXNlIHBsYXRmb3JtcyB1bmxlc3MgeW91IGdvIGluc2lk
ZSB0aGUgY29kZSwgYnV0IHRoZSB0ZXN0IHNob3VsZCBza2lwIHdpdGggcmVhc29uIHNheWluZyBp
dHMgdW5zdXBwb3J0ZWQgb24gcHJlIHhlMitwbGF0Zm9ybXMNCllvdSBjYW4gd3JpdGUgDQppZ3Rf
c2tpcF9vbl9mKHJldCA9PSAtRU9QTk9UU1VQUCwgIk5PX0NPTVBSRVNTSU9OIGZsYWcgbm90IHN1
cHBvcnRlZCBvbiBwcmUgeGUyIHBsYXRmb3JtcyIpLiBTbywgdGhhdCB5b3VyIGNoZWNrIGlzIGFs
c28gdGVzdGVkIGluc3RlYWQgb2Ygc2ltcGx5IHNraXBwaW5nLCByZWFzb24gd2lsbCBhbHNvIGJl
IGtub3duLg0KPiANCj4gQ29ycmVzcG9uZGluZyBLTUQgcGF0Y2ggZm9yIHJlZmVyZW5jZToNCj4g
aHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzY4NDc0OS8/c2VyaWVzPTE1
NjY1OCZyZXY9Mg0KPiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgYW0gbWlzc2luZyBzb21ldGhpbmc/
DQo+ID4+ICsJCWJvX2NvbXBfZGlzYWJsZV9iaW5kKGZkKTsNCj4gPj4gKw0KPiA+PiAgIAlpZ3Rf
c3VidGVzdF93aXRoX2R5bmFtaWMoInBhdC1pbmRleC14ZWxwIikgew0KPiA+PiAgIAkJaWd0X3Jl
cXVpcmUoaW50ZWxfZ3JhcGhpY3NfdmVyKGRldl9pZCkgPD0gSVBfVkVSKDEyLCA1NSkpOw0KPiA+
PiAgIAkJc3VidGVzdF9wYXRfaW5kZXhfbW9kZXNfd2l0aF9yZWdpb25zKGZkLA0KPiA+PiB4ZWxw
X3BhdF9pbmRleF9tb2RlcywNCj4gPj4gLS0NCj4gPj4gMi40My4wDQo=
