Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC8F606A89E
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 08:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DXigFxjo;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=j5KSosb2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC6510E961;
	Mon, 16 Nov 2026 08:11:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8172F10E26C
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 08:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794816582; x=1826352582;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gV6Q62NFahq1bh6A0A8u7P9+IpomJ2xo4MTIh5NTjpM=;
 b=DXigFxjofghmDy3i0/aGbqaMfk73hlMsTOxBVYnj/asSYqXh2Ntwa4pT
 UfQlhjDkU1hrIzd8OUt/TGNd5k7CIqwT3UXgxuGnoa6ef0NpG5o0/igMT
 jWJRgAsQJuU/EUEigO2vw23yzagLL8Igp0RiIOi8SIDcg+/TeQJxAIy9i
 WC4efN1d4Ypk0TiM3qK06lvDiCmvQk3zNg2o0GGycrNAtnqPCqAhHT22h
 vk5kTAE7+JVEBfA/86r6loyYg/CzAyy9umnNrU8JvYJAab/ckNDQaRNT4
 NFkLLYtThA1OFF0fxaI11EhLxTkDXsLTa9tCDdF24qRaw6+advtlJwOeB w==;
X-CSE-ConnectionGUID: ZgNWkAtETZ+BQpNgScQq+g==
X-CSE-MsgGUID: lEibYh7IRMSpO1AvenQOZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3421950"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3421950"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 00:09:23 -0800
X-CSE-ConnectionGUID: DL9oJhO2QXCtZ+zvrKr2Ng==
X-CSE-MsgGUID: fuG9MLfjTOWURRR1xzdzlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9472062"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 00:09:22 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 00:09:21 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 00:09:21 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.20)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 00:09:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ND5f2/ki45CAV41tSI/hyCbrDKHVYkxBV50kApeohjdJp5sQmqbbnwjFgGVkarIwive0PqHaxjxtwtuGzkN0nQ8jPNF6WB/ESK7sSeaIQVxnXygHFbPIRnbLrgpVy4A7evNb1ahTxn3t3PmSeE/WCbFa7GqtO3mi4P6KoGBqDoIvPR3APcCXTRw5IPef8M0rHaBE0pTadisTq/8pzCHE+d0sIqxCfH1YU30OxQkZuzcgBJhNIFb/jXpVAMMKSmq/z7AtzPT9E14w7jF2Y2fsZNDMgKN41G9Ad3E6I11mmWUIuygnvMG+iQ+7wEKO1Ze8+S/4Lx49hDecWTGLVbA5WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gV6Q62NFahq1bh6A0A8u7P9+IpomJ2xo4MTIh5NTjpM=;
 b=QnU5lqMWVzdfWrHmNo0s4ff77gp07pZW1uJiMz0e+Mxvf+5DlzG5aVRPx6mDtsMYAwKkF38xk+aszyvENTz+S8BrsoR6iQS0i2hTxCaeXDV2OAMrMFST8lCA1MwOE/9hDcBhq9v9GG9Zv/DS/r6yHKfYNZCbVYhoxGU7MRtdJUplsKewijUeUNl4R9q75bmOeAnk1cIMa0Kriw4+cE6A2c2h/xWRbRVG2CUVM1AFAmW27+OofrgF6n+GNAP1Dkcf/FYeLpUNo1MHTAj7aFass2Nb4iqC5oX4ixJfiLFDzI8Ypn2+6ZnXq/0Po1+X2Cd26spe5pT9LcAk/3WbjDxrgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gV6Q62NFahq1bh6A0A8u7P9+IpomJ2xo4MTIh5NTjpM=;
 b=j5KSosb2sxW4J+x/Dm9lstG5kfWohhWn7DglUTnWxLvQtHIhbXKqCfOVEH7sFq9jLZCBGjsPPuTpJwOIy5aVRI9+etvs9CFb+BVVIRLA4OY+9f2X++MZp5hpgv0NhkMUEiNsnJnuekSH8XnYIZ+7omM8qQmMr5ij2ANUf51fxUE=
Received: from BL1PR11MB5413.namprd11.prod.outlook.com (2603:10b6:208:30b::16)
 by IA3PR11MB444632.namprd11.prod.outlook.com (2603:10b6:208:53e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 08:08:59 +0000
Received: from BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811]) by BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 08:08:59 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Anirban, Sk" <sk.anirban@intel.com>, "Grzelak, Michal"
 <michal.grzelak@intel.com>, "B, Jeevan" <jeevan.b@intel.com>, "Sharma,
 Swati2" <swati2.sharma@intel.com>, "Samala, Pranay" <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t v3 3/3] tests/intel/xe_survivability: Reload audio
 driver on exit
Thread-Topic: [PATCH i-g-t v3 3/3] tests/intel/xe_survivability: Reload audio
 driver on exit
Thread-Index: AQHdcdV9hR7i125plk6sLEvTgOrumrcwX7dA
Date: Mon, 16 Nov 2026 08:08:58 +0000
Message-ID: <BL1PR11MB54137CA792E98B4208A56C02E27C2@BL1PR11MB5413.namprd11.prod.outlook.com>
References: <20261111114600.4104768-1-chaitanya.kumar.borah@intel.com>
 <20261111114600.4104768-3-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20261111114600.4104768-3-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5413:EE_|IA3PR11MB444632:EE_
x-ms-office365-filtering-correlation-id: 89eb0435-6870-4707-7cf7-08df43b8de2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|261009223027099003|5023799004|11063799006|56012099006|10067099003|4143699003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261022105027099003|261021121427099003|38070700021;
x-microsoft-antispam-message-info: dB+DCsY1EPJ+Z/Bi284X23tvuIBoP2EKxqaPmsY/5E2WBzL5pxGhrpakChOe+AuU/qmVa0ooaQ8IkfeGkDTf9FdAoHt5H5D4XiaM9gJOIFQYk0wBbG/1yROJD5HVdDCROg+qgQI/x51C5oxKTqxhVtJUsvN53Q8WwejXGSk01NUWv6DaYfb2rzk8XV5jM/ta1dDoyWNdE9ZH2s9zFHXBUhXb5Vq1KG1MXBGnguH9c44rYITTnyZknQQEyxFBtD+lgpH33GaBXn/lwUifffKYIy6mOsXIgTvx7ai8bf1ax9/1oPa08E/PWd755CzMGiqM3h79azc5s9+DJlg0+sEzvuXA0oxt1KXho+/RaCq8cNylP/mWbk4mcFK5M0KmRAp2VGwD9Pl3Cen1/hQjsIxGfy0XmqFZAscMCQtvPQCGH6ahZ92K++VH5Nb8pBny58/78SIYlCJa0jOJJlDN2QVXsdWehT3Z/ocS8sbuGsiy0xtqNsTenqmpsODnwPnL6fuvfe7jxVM8thsEhfUjIFRpAqBpDc2mdaC7en/7FMqBfasZXSUjLeOQ1QE3K6Tawn/VezEkyx2q7mwBq3RJfICGKm6uM/XNgScG2t+xgPQc+cQaM8pD5mBBcwoie2C6xBb9d7yvpcqYjbxfeNmQQZOGx5hNhk4JUq3cFum022OrIH2gvDVgs/Z2vY91a5mtEvQ7RogCKw89y+cZ1/FgcuxsHeXAC1a8hW2uHgeXGPAJn0U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5413.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(261009223027099003)(5023799004)(11063799006)(56012099006)(10067099003)(4143699003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0lQam15c3NrM3BsbTVQbjZVbDIxTHRQSC82U1FBV0tsWFZEYm40cDNwU0RW?=
 =?utf-8?B?QkFYL3o3TzFiOHIweklNdjd0RE1TQTJTb1pZMEtRODZJRnR6aUJia0wweXNs?=
 =?utf-8?B?REZkT2tCS21EMGZQUWhzekVvZWZBaE1BNEEzSFNJdWxXZ2VnMGIyTHhHUWN3?=
 =?utf-8?B?N0FqUWxlY2dydzF4eW1hbTk5dTk3aUxTR3JQUStYSnhUdmpuTG9zYWU0cXZN?=
 =?utf-8?B?UXBITGF4WFVCMmpGREswVnQzWFBLbHY4MnlscXNONjFid3JWam9jcEpqdWpD?=
 =?utf-8?B?bVBXcjdkdW5wT3ozV0FtQ2ZYY2VqVTFKWnpITWc4VWFzOUdOaXpVTnhxMFJN?=
 =?utf-8?B?RlZjT1RCZUdZNkphZUR2anhPdXNoalFsN0x0SzUyYmRqUFpEODNVaHlpNDE3?=
 =?utf-8?B?MUtXSXoyQ1YralhhajR1Zno2WGJPL1NkWmRuNWZCZHZtc0FPdG1Hd3VtWWJj?=
 =?utf-8?B?MVV4YUwzNVJVbDJpM3p5M05tT2xTWVYzUDloVWUwUDJlSVBJL0dLMlZZMFlP?=
 =?utf-8?B?WG92b0VYK0pEN0hVL0pZWVZQOHNSNi84WVpRdi9aMEdZM25janFDTWNUNUp3?=
 =?utf-8?B?YWwrSzByTnNjTi9aZHZzSnhpVjNpaGxJaTEyN0g5L0xDS09sUDR2VTVPNHFp?=
 =?utf-8?B?Z09XUW04THk1Q1pmRWlIY0VJY3J4OVBTMjlYYUFvdkJoaENOWDBFMFZYSjFE?=
 =?utf-8?B?T3YyUi9DUUxBbi9reGpSK0htVFhld3Q4QzVGT2REbWJpV3JLTzhLRTE3NjJz?=
 =?utf-8?B?a3pidWJ2ajNMTGRXV0pxZFI1bFdsd3BzS0E4LzVMVnJabDd4ZVRCYTNhNEZi?=
 =?utf-8?B?REl4Um01RWhrQStUSFgvVkVVSXYzM25MQlZOYU9JMXJ4TjlBVHI1Y2RWN1ZK?=
 =?utf-8?B?V0MvSnZ0TU1Ga2I2ZWw4Umhib3VTdmo0eHl0dnlvdUI1cjhFTHkrbDNVcmk3?=
 =?utf-8?B?N3YrY3VUc3g1dnJoWDBTaXhOSnAxQnpnVjQvM291UFhxTE1qTWo4MTFzK2VC?=
 =?utf-8?B?ZUFUQ1pRNVF2OEttd3lvVjlRQkJwWW9JNjhYaExZZ0VPcGNYSXJPdnZheW1I?=
 =?utf-8?B?Q0FKdnRVdmNDMjhzK05ScFB2N3dBaEczY3dQUXNvMXpwMjlzenVvNFN2eTh5?=
 =?utf-8?B?bGxLeER0VFpNWURaZzJ5MGl5Ry9XbDdLelhMYmtlbFZWb0xtcmd2aHEwdjk1?=
 =?utf-8?B?VnJIOGdPVTVkUmdPcU1qclV3Vnhvbm12cmtNTnZtdWdtamIxbm53V0NwT0dt?=
 =?utf-8?B?SS9lQzFweXBRRldqTkhHSitEdStHeDQzczhDdlR2cUc1ZXRhazMvRk42UVhs?=
 =?utf-8?B?b3RjQk8yNWRWbXN6MGZsVkFOU3Y1S0d0V0xuMndFU1VuUUNaMmZVK2dmOERo?=
 =?utf-8?B?VFQ0V2Uva2UwLzFoU3NiS1d4R3BjZ1NqSzZhV0hoVjNjeVh6Wjh5ZUNUMXFI?=
 =?utf-8?B?Y0srb0FvK2xqWERrZ0hmd0cxMU1oV1p2Q3dmRHFib2xOVEM3OEFCWjNEV2lW?=
 =?utf-8?B?ckpKQThsbFkzenowcU1Kb3lXdzhEa0IxNWJ3Y09uRkhOZ2dCd2NxR1pBR21W?=
 =?utf-8?B?WW1zMzRibTAzZkI3UVFnM2Jab3F3aHNQL3h2ejVITmFhWCs4WEN0cXBpMlJp?=
 =?utf-8?B?OUNOd1RlTlhkN3lKckRIQzNObnh0YUhGNUVwdjFNYndsdE83Q1lSNFlWOGZl?=
 =?utf-8?B?SXh2OTJERzlGZWNraDBCSDNmOWljcXdxMDlCT2FIMjlBZVhVcGNTejNBRnA0?=
 =?utf-8?B?Nmt1Y3RlZU9xM1ZiSTc5ZVhwV0tnL1ZYSzZPbGFqMTd0MDNsblltdEErMTFT?=
 =?utf-8?B?QmtJZlpQd3ZHSlJvc1lWWHE0aDdUU1JLdXhSQWg4MGpmT1lpRHVvSjhlMERR?=
 =?utf-8?B?TkRJYjI3U1FrQm0wdkJoSjB0UDNJQjlVdkNoTS80MHBQaXNaTGV4Z2w3ZFEz?=
 =?utf-8?B?TGpzZURwZFVoQzY2eDVtVkRqeklsSXZ0Z0xOa29LUncxWmNOS2srK2R0ZXVx?=
 =?utf-8?B?NXorSDIycmlTanIwVEJGWlQwaitGWnI3cUd6V09XWmV0Ukp0bHhUNTQzazJN?=
 =?utf-8?B?ZzdXbmZJcG9oWGdSOHJIWFhzSjFqSkttbE9QOGZSSUJkQ0cvc2l1cmdiUVZk?=
 =?utf-8?B?OWgrRlViL2c5dmt3S2lGN2NpSERXYWpCamZNaFY1MzYyYlBJeHM4S3JqYkJR?=
 =?utf-8?B?UVlsYTgwblhmenlLbmswaXUvSGpNNE81N05YV28xY2I1dlFtQ3gxbEFWNENl?=
 =?utf-8?B?a0RHNUsyZDVvcHBxZXFUdHRJSW05MVQ4dGd3em1kd0tzekZPU3k1Y1RtSzJp?=
 =?utf-8?B?c1JKUUhqam5IZlc0UFBZSytjc1lGdjFZbWc2Z2xqWnlaRXR3aWtmUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Ab8/oYALa36oDLidUbc0keezrGkTH3BCWIDe2A8DsEZT2b1JdCdVS1OUCFv/exOUiv2cc4VTF1FmAAYB6sb57AUsi5sw5XdB7gmzCTiYxNI8/oRLhde/37bchHh+DgZi2DWSs0dgdhR6MaFzjHynq/rRyaDGpCM54VLILxA2qdlt/UyRKBKbofIISxntXP/+eQeNPVDDoCHL9nxA7fagUYUMVTZ/4IFGNEF2ZxOO/nmMdyDFxOQHDa3P5O6stW/8XO+tlIidAbUSSejyCb16/3X/T3knIWWyP46n7Jj3afuSyOSdOOfV7QFp3yhKNARGbQCZpN7WofbV3jMaREM8oA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5413.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89eb0435-6870-4707-7cf7-08df43b8de2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 08:08:59.0011 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +rPL2DP/JW09wjmMZH4/HYyaDnUNwh3XLREml1xMODYA5U0AX+dJMaqv8DGUDKyA8y8qrTCPSUgKSzBIrZ6C1KL4bDLkpHDfWvWLfhmRMs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB444632
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQm9yYWgsIENoYWl0YW55
YSBLdW1hciA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT4NCj4gU2VudDogV2VkbmVz
ZGF5LCBOb3ZlbWJlciAxMSwgMjAyNiA1OjE2IFBNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiBDYzogQm9yYWgsIENoYWl0YW55YSBLdW1hciA8Y2hhaXRhbnlhLmt1bWFy
LmJvcmFoQGludGVsLmNvbT47IEFuaXJiYW4sIFNrDQo+IDxzay5hbmlyYmFuQGludGVsLmNvbT47
IEdyemVsYWssIE1pY2hhbCA8bWljaGFsLmdyemVsYWtAaW50ZWwuY29tPjsgQiwNCj4gSmVldmFu
IDxqZWV2YW4uYkBpbnRlbC5jb20+OyBTaGFybWEsIFN3YXRpMiA8c3dhdGkyLnNoYXJtYUBpbnRl
bC5jb20+Ow0KPiBTYW1hbGEsIFByYW5heSA8cHJhbmF5LnNhbWFsYUBpbnRlbC5jb20+OyBCaGFk
YW5lLCBEbnlhbmVzaHdhcg0KPiA8ZG55YW5lc2h3YXIuYmhhZGFuZUBpbnRlbC5jb20+DQo+IFN1
YmplY3Q6IFtQQVRDSCBpLWctdCB2MyAzLzNdIHRlc3RzL2ludGVsL3hlX3N1cnZpdmFiaWxpdHk6
IFJlbG9hZCBhdWRpbyBkcml2ZXINCj4gb24gZXhpdA0KPiANCj4gQ29tbWl0IDExN2U5ZWNiZGQx
ZCAoInhlL2lndF9rbW9kX3VuYmluZDogcmVsZWFzZSBhdWRpbyBiZWZvcmUNCj4gdW5iaW5kaW5n
IHhlIikgbWFkZSBpZ3RfYXVkaW9fZHJpdmVyX3VubG9hZCgpIGJlIGNhbGxlZCBiZWZvcmUgdW5i
aW5kaW5nDQo+IHhlIHRvIGF2b2lkIHRoZSBhdWRpby1jb21wb25lbnQgYmluZCB3YXJuaW5ncy9l
cnJvcnMgdGhhdCBoYXBwZW4gaWYgeGUgaXMNCj4gdW5ib3VuZCB3aGlsZSBzbmRfaGRhX2ludGVs
IGlzIHN0aWxsIGF0dGFjaGVkLiBCb3RoIGNhbGwgc2l0ZXMgaW4gdGhpcyBmaWxlDQo+IHBhc3Nl
ZCBOVUxMIGZvciB0aGUgdW5sb2FkZWQgZHJpdmVyIG5hbWUsIHNvIGl0IHdhcyBuZXZlciB0cmFj
a2VkLCBhbmQNCj4gbm90aGluZyBldmVyIHJlbG9hZGVkIGl0IGFmdGVyd2FyZHMuDQo+IA0KPiBB
cyBhIHJlc3VsdCBzbmRfaGRhX2ludGVsL3NuZF9oZG1pX2xwZV9hdWRpbyBpcyBsZWZ0IHVubG9h
ZGVkIGZvciB0aGUgcmVzdA0KPiBvZiB0aGUgYm9vdCBldmVuIHdoZW4gZXZlcnkgc3VidGVzdCBw
YXNzZXMsIHNpbmNlIHhlIGFsd2F5cyBlbmRzIHVwDQo+IHJlYm91bmQgYnkgcmVzdG9yZSgpIGJ1
dCBhdWRpbyBuZXZlciBkb2VzLg0KPiANCj4gQ2FwdHVyZSB0aGUgdW5sb2FkZWQgZHJpdmVyIG5h
bWUgYW5kIHJlbG9hZCBpdCB3aGVyZXZlciB4ZSBnZXRzIGJvdW5kDQo+IGFnYWluIGluIHJlc3Rv
cmUoKS4NCj4gDQo+IHYyOg0KPiAtIEFkZCBGaXhlcyB0YWcgKFByYW5heSkNCj4gLSBVc2UgdGhl
IG5ldyBpZ3RfYXVkaW9fZHJpdmVyX2xvYWQoKSBoZWxwZXIgKERueWFuZXNod2FyKQ0KPiANCj4g
djM6DQo+IC0gRnJlZSBzbmRfZHJpdmVyIGV4cGxpY2l0bHkgYWZ0ZXIgaWd0X2F1ZGlvX2RyaXZl
cl9sb2FkKCksIHdoaWNoDQo+ICAgbm8gbG9uZ2VyIGZyZWVzIGl0IGl0c2VsZiAoRG55YW5lc2h3
YXIpDQo+IA0KPiBDYzogU2sgQW5pcmJhbiA8c2suYW5pcmJhbkBpbnRlbC5jb20+DQo+IENjOiBN
aWNoYcWCIEdyemVsYWsgPG1pY2hhbC5ncnplbGFrQGludGVsLmNvbT4NCj4gQ2M6IEplZXZhbiBC
IDxqZWV2YW4uYkBpbnRlbC5jb20+DQo+IENjOiBTd2F0aSBTaGFybWEgPHN3YXRpMi5zaGFybWFA
aW50ZWwuY29tPg0KPiBDYzogUHJhbmF5IFNhbWFsYSA8cHJhbmF5LnNhbWFsYUBpbnRlbC5jb20+
DQo+IENjOiBEbnlhbmVzaHdhciBCaGFkYW5lIDxkbnlhbmVzaHdhci5iaGFkYW5lQGludGVsLmNv
bT4NCj4gRml4ZXM6IDExN2U5ZWNiZGQxZCAoInhlL2lndF9rbW9kX3VuYmluZDogcmVsZWFzZSBh
dWRpbyBiZWZvcmUgdW5iaW5kaW5nDQo+IHhlIikNCj4gU2lnbmVkLW9mZi1ieTogQ2hhaXRhbnlh
IEt1bWFyIEJvcmFoIDxjaGFpdGFueWEua3VtYXIuYm9yYWhAaW50ZWwuY29tPg0KPiAtLS0NCg0K
TEdUTSwNClJldmlld2VkLWJ5OiBEbnlhbmVzaHdhciBCaGFkYW5lIDxkbnlhbmVzaHdhci5iaGFk
YW5lQGludGVsLmNvbT4NCg0KDQo+ICB0ZXN0cy9pbnRlbC94ZV9zdXJ2aXZhYmlsaXR5LmMgfCA5
ICsrKysrKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9zdXJ2aXZhYmlsaXR5LmMg
Yi90ZXN0cy9pbnRlbC94ZV9zdXJ2aXZhYmlsaXR5LmMgaW5kZXgNCj4gMDE1YjIyMDUxLi42ZDU0
MjNiZTcgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX3N1cnZpdmFiaWxpdHkuYw0KPiAr
KysgYi90ZXN0cy9pbnRlbC94ZV9zdXJ2aXZhYmlsaXR5LmMNCj4gQEAgLTM5LDYgKzM5LDcgQEAN
Cj4gICAqLw0KPiANCj4gIHN0YXRpYyBjaGFyIGJ1c19hZGRyW05BTUVfTUFYXTsNCj4gK3N0YXRp
YyBjaGFyICpzbmRfZHJpdmVyOw0KPiANCj4gIHN0YXRpYyBib29sIGNvbmZpZ2ZzX2dyb3VwX3By
ZWV4aXN0aW5nOw0KPiANCj4gQEAgLTE2MCw3ICsxNjEsNyBAQCBzdGF0aWMgdm9pZCByZXN0b3Jl
KGludCBzaWcpICB7DQo+ICAJaW50IGNvbmZpZ2ZzX2ZkOw0KPiANCj4gLQlpZ3RfYXVkaW9fZHJp
dmVyX3VubG9hZChOVUxMKTsNCj4gKwlpZ3RfYXVkaW9fZHJpdmVyX3VubG9hZCgmc25kX2RyaXZl
cik7DQo+ICAJaWd0X2ttb2RfdW5iaW5kKCJ4ZSIsIGJ1c19hZGRyKTsNCj4gDQo+ICAJY29uZmln
ZnNfZmQgPSBpZ3RfY29uZmlnZnNfb3BlbigieGUiKTsgQEAgLTE2OSwxMSArMTcwLDE1IEBADQo+
IHN0YXRpYyB2b2lkIHJlc3RvcmUoaW50IHNpZykNCj4gIAljbG9zZShjb25maWdmc19mZCk7DQo+
IA0KPiAgCWlndF9rbW9kX2JpbmQoInhlIiwgYnVzX2FkZHIpOw0KPiArDQo+ICsJaWd0X2F1ZGlv
X2RyaXZlcl9sb2FkKCZzbmRfZHJpdmVyKTsNCj4gKwlmcmVlKHNuZF9kcml2ZXIpOw0KPiArCXNu
ZF9kcml2ZXIgPSBOVUxMOw0KPiAgfQ0KPiANCj4gIHN0YXRpYyB2b2lkIHNldF9zdXJ2aXZhYmls
aXR5X21vZGUoaW50IGNvbmZpZ2ZzX2RldmljZV9mZCwgYm9vbCB2YWx1ZSkgIHsNCj4gLQlpZ3Rf
YXVkaW9fZHJpdmVyX3VubG9hZChOVUxMKTsNCj4gKwlpZ3RfYXVkaW9fZHJpdmVyX3VubG9hZCgm
c25kX2RyaXZlcik7DQo+ICAJaWd0X2ttb2RfdW5iaW5kKCJ4ZSIsIGJ1c19hZGRyKTsNCj4gIAlp
Z3Rfc3lzZnNfc2V0X2Jvb2xlYW4oY29uZmlnZnNfZGV2aWNlX2ZkLCAic3Vydml2YWJpbGl0eV9t
b2RlIiwNCj4gdmFsdWUpOw0KPiAgCWlndF9rbW9kX2JpbmQoInhlIiwgYnVzX2FkZHIpOw0KPiAt
LQ0KPiAyLjUwLjENCg0K
