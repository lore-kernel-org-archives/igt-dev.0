Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28F9FC981D
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 09:01:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E83210E582;
	Mon, 30 Mar 2026 09:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B0Rr9mZz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 254F410E582
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 09:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774861306; x=1806397306;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Qd1mqE3kLvvnCvwcwvF9S4dGmus7VpOJnSj7EBmkhXM=;
 b=B0Rr9mZze5bWJhQcKZFbWtn0giw5a18h649MQJqx12hAt9uxUzRoEdcG
 X/C7GOA5ECvxEn9MtupkqKPVJ5DIDN0nx+Y2SXvBdh9KugYIlQr2OjZKF
 L+A0XkBKrMgX6IKqKMgxLyyT+IAmg43BHmxsQoCwr1dKfghkzOk+9WC3B
 lX46NPrurgx542gJBtlULRzvyWpfAo1gZkzz0jk8ASTjvm391DrmxlcvR
 j4BOyj7vzbelkZDRGiKBAN3V8tzQI07UbcNJ3cZih5vyxIy00GmloIg7m
 Wlbqv5yBbu7WjCtbq2hRL3NkTR6HcRRAHLFLqwaqglz7mnHZJfyQuOysK A==;
X-CSE-ConnectionGUID: ewNOTEC7SG+mAim2md6cYA==
X-CSE-MsgGUID: KGv6LAXYShWqArg/c9bBXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75559286"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="75559286"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 02:01:46 -0700
X-CSE-ConnectionGUID: QUnPJ0+tReGQG73NN5IQvQ==
X-CSE-MsgGUID: ta/jT9UBRYCvuxaRlK9iWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="222686855"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 02:01:45 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 02:01:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 02:01:44 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.53) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 02:01:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RbadUKtl3YyCKjiOOVGVvdS0eIw3SuqNKuLBxQ5T306yYD5enHgV67GgVFE0wyZbu4YB+j9bf491iHX/egL7azC5zWFNADBNZP1GlRf6q97SwSnwgfbLBps/hJYxPo6yoVIITkRgMKz0rjkodvKEkDxW/1chqT+/LSJ8hs06p4vfl8kt5koLgTPC7P7v9HBS8ev+8IFMr1MvIbl5wgPC3mXmxk0lH41Xq+DO9xVaUWImz+RnRn2ol2G8tpZ1n5LAcioZjJxcCptLbZQXVJQqpiPBdiNgHkjDXSX5EsrFPlOmGINEROoYU3z6bRDM7ead+h3BDJXaF3qVaHxhlR1uew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qd1mqE3kLvvnCvwcwvF9S4dGmus7VpOJnSj7EBmkhXM=;
 b=Nkm/bLl3bAPpsK0wQ2EpTHrerLutbnajMRpvELgI9UMi0u3Kf3HfGXFodzmeL8bNnIkb7Vvb7UzbxUaqN2So+XZ5K5ydFKR4SWBDftOG68a8UZGSPEZacH5IapFjnnIAIHYW8dBeDPMTkwdJk5baaPr5ZXdfHCeEjHPE/OVardaYDk4U3YJUzcLlw9cXQG16oygdhHHPpllPA3jqsIovbHePBytKS1sQf+hBV0LfxYVmG25U9p3gwST9I98UhrWKMUwEUFClQJmB89rDOucbzH1ilWdeM8prk2+RQRh7GYNZu/dNFev7Wswn4M0yrD7eKZ/rQXZKy/VGBAJB7bgMBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 (2603:10b6:518:1::d33) by SN7PR11MB7140.namprd11.prod.outlook.com
 (2603:10b6:806:2a3::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 09:01:39 +0000
Received: from PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 ([fe80::316a:2fe8:c3d3:eb91]) by PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 ([fe80::316a:2fe8:c3d3:eb91%8]) with mapi id 15.20.9745.019; Mon, 30 Mar 2026
 09:01:39 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Karas, Krzysztof" <krzysztof.karas@intel.com>, "Heikkila, Juha-pekka"
 <juha-pekka.heikkila@intel.com>, "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 0/6] RFC: Add attachments support
Thread-Topic: [PATCH i-g-t v2 0/6] RFC: Add attachments support
Thread-Index: AQHcu4/swbr9uXeM6E6fK3t4KZ6raLXG0IIA
Date: Mon, 30 Mar 2026 09:01:39 +0000
Message-ID: <d259eb2e14d5c60f4e4da139616dbb5b87ac0254.camel@intel.com>
References: <20260324131235.712916-8-zbigniew.kempczynski@intel.com>
In-Reply-To: <20260324131235.712916-8-zbigniew.kempczynski@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPF7DB70F9CE:EE_|SN7PR11MB7140:EE_
x-ms-office365-filtering-correlation-id: dfe85575-3a9d-4080-530a-08de8e3af49b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: m5makB/JpFR67LgQA/pBIzFq32FaB3Xhq0Tr2pcSBcLRk+5h3c6C9MPEvTR6BzpKzCNuQcbHB1U0ff/f+IHOF2GnrNegb3TlZeX0VCoDjHkIs6PEaTsI93PiyV4joS3PsmhnWAfUTEryvGM7V4Dt2/x016NYw5YJdFppBV9iL3Nw0TosFYKazi8dYJ/tG+UFU3UeDBEyQdc18pK326LLuoNqEQke8LNWFfhv0mR35lu7DIvKwAASal+noA0UFKLAWaw1fsyGb4Ks/r/WTjnniSr3COTL7ZW5pHKYpYsEMuXjeWMuz6paV3z0Oc/1wjojhQBFQq0qCyqaRLGOCYF/LvtfOAJYRgmpp/xrN5EYPpbjXop3bRN0AzRpZLKOIoufAXaUTXWbsHJGC5N/l4mimhFoctOKibXeSFqEwhd+yzpLiPT3iorEWDlibcqgm55ze7clW7oSTQIzm6GYpK+yK2KEPmhemP3b/NO7W18esxXwcGDev3O/SfVEiGFMWEWTtssDW5WL6EMsSFr2NoIE1xnl+LjfUxUto3270wYDMHHdu+Ceo8MjFsTf3mskjclv7kk/rg3vQg1yeSf4mVCsHAFHMCKC/HU3CRlJSXnaVJRgbKwxJ+UuRrYVnYtSeGyv7SRKSJwZfynB1eJaUmBy9oo/Vo3EHLOuDDB0AD+Hy6woRO75qFQELWw3V2WQ0gnqtBMvLqLg+FdZdl3i83aysn66+3XiAhJjUFajrToFDoXGKxAvnE7xX5mGgLe1Z+3vdPMVSmrooPBaExGwDfH42WiVCmQPvSnk6LklT/akhmI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPF7DB70F9CE.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eERaWmVBSkRqTlRMN0M1Z1hjMzFtNXIvMHVOSDUzQUErK0lPa1p0WVpBRWN3?=
 =?utf-8?B?QS9qQkZ4bmxTVzJJUmo1Zis2eFVNdER6WEdwdnFtYmxKZWhIWThPUXBJMDFT?=
 =?utf-8?B?dytFdXROaHFWWFd3NXl6ckFaNG1ZRGhZTVhpWG9JYmFTV1ZNbHFhQ0lQUVU2?=
 =?utf-8?B?UU5QZ2plSXB3ODR2YkJtazhEdFdRbWZJaDhYdTNDc09hTW1aQU11dkFGYk1p?=
 =?utf-8?B?eFNPaVo4cldZQ0o3MjFaYUxvbUpZenh6K3lhSnZsdTA5ZXh0NzVPdVJ3Z2lk?=
 =?utf-8?B?UG84eXBKZmZHN1lkV1RQM0xteWFjWjRvTVJqT2xmcDUrNk83SDNsNk93c1Fi?=
 =?utf-8?B?UmlUOG5GTXN2NXBscUt1QldZMEtaSUs5VE9LWVdHQmloTXVhMC9maXdFd0FI?=
 =?utf-8?B?TklkUENrMmpOU1dBNlRDWE9GWnByK29tOEcvMnZDMld3eGhhMm1ma25RcHRK?=
 =?utf-8?B?ODRDeE1iV05ucmc3OGlhY3grVTJ5cXRydmEvS3B4SEsrWndzVTlUWmpiSDMx?=
 =?utf-8?B?SElYYTZCRUxrM3pxZnRuMG9UeFhKUzc2aVdJZWlaMUFRV1YyR2FvcUluNjJu?=
 =?utf-8?B?d29WMFJ1Q08rYVB0N1o1QzdoVWRtRFg1UFNkbE9vc3AwYnhDSmJnc2tzUU9V?=
 =?utf-8?B?dUhwT2tiM2VlVXB1WTFVR3JaSEg0K3dqS3dkeDExdU9TVjkzSC9KTjIxN0Er?=
 =?utf-8?B?WVNsallOVEVuaHZNZW5Leko2MTJOUmwxWHZxZkpzTXhobjhsZ28vT1F6bSsr?=
 =?utf-8?B?Z2o2dFhMV3NpSGhhNHRRZWRCY0hqMkFxUmhYbXEwQzdLVEM0a2lxeGtOVVdG?=
 =?utf-8?B?L3V4allxQU5vMkdYTy9FZ1creXAzWitISmhFTzcxalBqL1ZQaWdMOEJkbUVp?=
 =?utf-8?B?SlJ2Qyt1ZkkxbjVqNFVOY2VuNHJvNzh6cGR5c2phOThOc1QzVGwxdTgrQnYr?=
 =?utf-8?B?TEZjcXlwRVJGS1p5Sk1sYm1EeE1XTWMwbVQ0V0w4ek5NNVk4ZkRTQkRDZXlY?=
 =?utf-8?B?bHNFR1ZybjVWK2w2WUZneTUxZkNBUnVsVXVDa2hsMUtsaWNucEdkZVdNMWtL?=
 =?utf-8?B?ZXgwNUdsdGFqSHhTZ0xlTUhrR1ZhSVh1WWl4NXh5dXpIczFMeEVFUlZYTVN1?=
 =?utf-8?B?SnNMVUpNZUxxZ0R6ZFE0MlNIQmF0cW1sVjB3eXNCeUZwRnBlalVCYXBGUVRL?=
 =?utf-8?B?c2JySDhiZklkVmtreHlpbzRSbUdMVUZhNzRZeHUzRXdINUN2MTY0V2d0Rndz?=
 =?utf-8?B?bDFoZjN4UnBtYUVlS0x0WVRpeThvOHJieXpXNUlWZ3lxM2tMRGlGV1cxb3N2?=
 =?utf-8?B?S1Z4dFJvbGowdW5HL20zNlVsS0RuZTNQa0QyK25URG9QVWVIdHMvTk1WdG94?=
 =?utf-8?B?UzZKaFBiTVhqSW1qZUM0bklYNHQyWFVBL2tZVmtra1AwZldYTUd0aEZNbkRJ?=
 =?utf-8?B?Q0Mybk9Pb2VNdmhDb2JtUXMrQWErbUVCMjRaZzYwVjJFQmJodDBRYlg0YTAr?=
 =?utf-8?B?MlAwb2hreGdWUENxTktXV0JXU3RRZFhxcjd4Mlh6VkpybXJBL3drUUptY3BX?=
 =?utf-8?B?akE3eHdIRyttWEhrNE1xSloyNmRQNEdGRGlxOHRNZkFHOEZGNnFUSkZnczdR?=
 =?utf-8?B?MCtsOFJBRnBKeWRvTkw1UzQxUytqS3JaaWc0bXZpOFNidWFzb0xQd0YyZUV2?=
 =?utf-8?B?cFJZcDV1UENhVFU1aFpiQUlsMEhKcE4vd3hleVFoWnhQL0IyZ1NYOUlrcHE5?=
 =?utf-8?B?VE1sS01IRU9JMmlURnlnSkJ4a3FvZUNGSzhLN2ZreDdBajNaLzRGdkovZGx5?=
 =?utf-8?B?RDcrM3oxdGlPRXVpc01tcTJMaWx2cXVvYTcwc2laOFdsdDQ3WmQrS2NJYWhB?=
 =?utf-8?B?d2tsbHkvM1RYVlZrdkZmSWZKYzBMd1U1Vm1FR1o1V1d4QkJRUWF2SUxWMFFm?=
 =?utf-8?B?QUkzTERQUUdZcTBvR2t2WHJHTkxXeE02V0RYY3JlTkxhZThlZ1BGTmFxSm9F?=
 =?utf-8?B?bDdPU0xBK2k4RE84MlpyaTg3YTBmbzFKb3ErSzZPcmtmb1JGRzhWZ295Z05k?=
 =?utf-8?B?T2k5UXJhd081UGNCaUlsSkRyVXlybDZzR3FNZllTVkFOUktidVZWNUwwak5j?=
 =?utf-8?B?cU9ISDFIeHNFQ1llaVJiRDlUdUhQOUpmT3E5NS9ZVTl5ZzhocXJwOWdwb2Y5?=
 =?utf-8?B?ZTFSdWY3TCtwSDdEdkZUWEJRQVlDUXRXU29JcWNPOGpnMVVTNDNhSnh4TjU2?=
 =?utf-8?B?c0IxSlNrczlCZVlndlVkYkxuYTkrSE8rbjE3a2s2K1Y1YzhNUmF5L1BOTm82?=
 =?utf-8?B?NlZRcEQvUENyQjZWV0J6YW5GUGNhMXY1ZjVOUExNWUl3cmhkT2dQRTliVDAz?=
 =?utf-8?Q?d7hRwJcBGBktdyXo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <241C51BB975E1B42893DBF59B55CD977@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YMNct3j+M3vFxD9Ev2rrGqRsNiL8p2yAyLS67KZ2c1u5fmcf7+o/KETn0RXUfPtC0wPVBJwFjsKFbSCAsKryqGlkFBAjx9e5SuV8q2oXZ+Ub4xmV4Y5Y/gdDLkj6I/o0FmEFprm4iWpXyP8BT1F6T/2uj3M3ZEHKuM1F+pdkrZVJ/xCXYfY5L+7vJwMUXYv5d7zWGSFuVDjPhB/EVT9EwVXqKFkhRBqtegDgMASoWmNXO7NZ7GmSYqer/DmtB56W1t/nsJb+i5NDs01mOnBwcd7B3pa5jPorum6mejmbTPNRKW2Z6EEd3zvrOX9/kydjcWvziCOYETBpSrtEInp9jA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF7DB70F9CE.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfe85575-3a9d-4080-530a-08de8e3af49b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 09:01:39.6109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z9homxdhnOeaogeliMOWmBXZIp5FNk0YhTlLmh+0shf/Ky1oIQNUxPehF6FulM9PKMjne5YImRHCQn+G3SSLzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7140
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

SGV5IFpiaWduaWV3LA0KDQpJbiBnZW5lcmFsLCBJJ20gbm90IGNvbnZpbmNlZCBwdXR0aW5nIGFs
bCBhdHRhY2htZW50cyBpbnRvIHRoZQ0KcmVzdWx0cy5qc29uIGZpbGUgaXMgYSBnb29kIGlkZWEu
IFRoaXMgaW50cm9kdWNlcyBhIHNpZ25pZmljYW50IGFtb3VudA0Kb2Ygb3ZlcmhlYWQgZm9yIENJ
IHJlcG9ydGluZyBwcm9jZXNzZXMgdGhhdCBkb24ndCBjYXJlIGFib3V0IHRob3NlDQphdHRhY2ht
ZW50cyAodmlzLCBDQkwsIEpQIEhlaWtraWxhJ3MgU0lTTyksIG1ha2VzIHRob3NlIGZpbGVzIGV4
dHJlbWVseQ0KbGFyZ2UgYW5kIGRpZmZpY3VsdCBmb3IgbWFudWFsIGluc3BlY3Rpb24uDQoNCkNh
biB5b3UgY29uc2lkZXIgc3BlY2lmeWluZyBhdHRhY2htZW50cyBhcyBmaWxlbmFtZXMgdGhhdCBz
aG91bGQgYmUNCnByZXNlbnQgaW4gYSBkaXJlY3RvcnkgcmVsYXRpdmUgdG8gdGhlIHJlc3VsdHMu
anNvbiBpbnN0ZWFkPw0KDQpUaGFua3MsIFJ5c3phcmQNCg0KT24gVHVlLCAyMDI2LTAzLTI0IGF0
IDE0OjEyICswMTAwLCBaYmlnbmlldyBLZW1wY3p5xYRza2kgd3JvdGU6DQo+IFRoaXMgc2VyaWVz
IGludHJvZHVjZXMgc3VwcG9ydCBmb3IgaG9vay90ZXN0IHdyaXR0ZW4gYXR0YWNobWVudHMuDQo+
IEl0IGlzIHNvbWVob3cgbGltaXRlZCBhbmQgc3RpZmYgYnV0IGFsbG93cyB0byB3cml0ZSBhbnl0
aGluZyB0ZXN0L2hvb2sNCj4gd2FudHMgdG8gYXR0YWNobWVudHMgZGlyZWN0b3J5IGFuZCBpZiBu
YW1pbmcgY29udHJhY3Qgd2lsbCBiZSBmdWxmaWxlZA0KPiBjb250ZW50IGluIGJhc2U2NCBmb3Jt
IHdpbGwgYmUgaW5jbHVkZWQgaW4gYXBwcm9wcmlhdGUgc3VidGVzdC9keW5zdWJ0ZXN0DQo+IHJl
c3VsdHMuanNvbiBwYXJ0Lg0KPiANCj4gU2VyaWVzIHRhcmdldHMgb3VyIG5lZWQgdG8gaW5jbHVk
ZSBndWMgbG9ncyBmb3IgZmFpbGVkIHRlc3RzIGVzcGVjaWFsbHkNCj4gaW4gdGhlIHBvaW50IG9m
IHRpbWUgd2hlbiBpdCBvY2N1cnMuDQo+IA0KPiB2MjogLSBhZGRlZCBjbGVhcmluZyBvZiBhdHRh
Y2htZW50cyBkaXIgaW4gb3ZlcndyaXRlIG1vZGUNCj4gICAgIC0gZ3VjLWxvZyBob29rIHNjcmlw
dCBpcyBub3cgaW5zdGFsbGVkIHRvIGlndCBkYXRhZGlyL2hvb2tzIGRpcg0KPiAgICAgLSBhZGRl
ZCBob29rLWV4ZWMtYWxsb3dsaXN0IHRvIHNlbGVjdGl2ZWx5IGV4ZWN1dGUgaG9vayBzY3JpcHRz
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3Lmtl
bXBjenluc2tpQGludGVsLmNvbT4NCj4gQ2M6IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVj
em55QGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IFJ5c3phcmQgS25vcCA8cnlzemFyZC5rbm9wQGlu
dGVsLmNvbT4NCj4gQ2M6IEd1c3Rhdm8gU291c2EgPGd1c3Rhdm8uc291c2FAaW50ZWwuY29tPg0K
PiBDYzogS3J6eXN6dG9mIEthcmFzIDxrcnp5c3p0b2Yua2FyYXNAaW50ZWwuY29tPg0KPiANCj4g
WmJpZ25pZXcgS2VtcGN6ecWEc2tpICg2KToNCj4gICBydW5uZXI6IFJlbmFtZSBkaXJmZCB0byBh
dm9pZCBjbGFzaCB3aXRoIGRpcmZkKCkNCj4gICBydW5uZXI6IENyZWF0ZSBhdHRhY2htZW50cyBk
aXJlY3RvcnkgdG8gdXNlIGJ5IGhvb2tzDQo+ICAgcnVubmVyOiBBZGQgYXR0YWNobWVudHMgZGly
ZWN0b3J5IGNvbnRlbnQgaW4gc3VidGVzdHMgcmVzdWx0cw0KPiAgIHNjcmlwdHMvaG9va3M6IEV4
YW1wbGUgZ3VjIGxvZyBjb3B5IHNjcmlwdCB0byBhdHRhY2htZW50cyBkaXINCj4gICBydW5uZXI6
IFJlbmFtZSBwYXJzaW5nIGZ1bmN0aW9uDQo+ICAgcnVubmVyOiBBZGQgaG9vay1leGVjLWFsbG93
bGlzdCB0byBleGVjdXRlIGhvb2tzIHNlbGVjdGl2ZWx5DQo+IA0KPiAgbGliL2lndF9ob29rLmMg
ICAgICAgICAgICAgICAgICAgIHwgIDQgKysNCj4gIHJ1bm5lci9leGVjdXRvci5jICAgICAgICAg
ICAgICAgICB8IDg4ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0NCj4gIHJ1bm5lci9leGVj
dXRvci5oICAgICAgICAgICAgICAgICB8ICAyICsNCj4gIHJ1bm5lci9yZXN1bHRnZW4uYyAgICAg
ICAgICAgICAgICB8IDk3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIHJ1bm5l
ci9zZXR0aW5ncy5jICAgICAgICAgICAgICAgICB8IDMxICsrKysrKystLS0NCj4gIHJ1bm5lci9z
ZXR0aW5ncy5oICAgICAgICAgICAgICAgICB8ICAyICsNCj4gIHNjcmlwdHMvaG9va3MvZ3VjX2Nv
cHlfb25fZmFpbC5zaCB8IDI0ICsrKysrKysrDQo+ICBzY3JpcHRzL21lc29uLmJ1aWxkICAgICAg
ICAgICAgICAgfCAgMiArDQo+ICA4IGZpbGVzIGNoYW5nZWQsIDIzMCBpbnNlcnRpb25zKCspLCAy
MCBkZWxldGlvbnMoLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDc1NSBzY3JpcHRzL2hvb2tzL2d1Y19j
b3B5X29uX2ZhaWwuc2gNCg==
