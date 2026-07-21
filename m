Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F04EC44532
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 15:29:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E88610EA87;
	Tue, 21 Jul 2026 15:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fV6anFQi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDB310EA8E
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 15:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784647710; x=1816183710;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m5tekjFJorYnJ0LOK+ONEIyKnNW/j3prXIOgcxRreGY=;
 b=fV6anFQiTvKTIue6w55Kre0Dh/2le5k3IreWb9WeI91NjcS2JDBH4byv
 AOik533HYdxacmHIN8qBs/9w7QvTnp7W2VIP+dk+hG08jSEBuVDL0ETzd
 /hmsePmM9K5TXDBhmtghFFsTMpMJH0E/NtV07UBcZ0CuZpl5puYaZ/aa9
 zo/4lCwZuM4klAZMxWam/AVQpZLpum/PMRboplcPjHr0NEvQQ3841i3E3
 skzyOiEFa7PXX3ysAZm2lvfreRBUdzaURpGsXT85bsS2/7NexC4yue3L2
 YEmPB45ttNTt+nIsSP/LuCMIsDUNv54knRzlUnFno2aaeB34pRY/WLErG Q==;
X-CSE-ConnectionGUID: j98DEAlgSlSkIDKtF4gJIw==
X-CSE-MsgGUID: 3PLxj8CTSUeHaSLrF8wgQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="89145968"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="89145968"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 08:28:30 -0700
X-CSE-ConnectionGUID: 6S+jCT6ASPuTEXSxqlDJOQ==
X-CSE-MsgGUID: VrZyx0fvTv+/SKTw2o70yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="257246460"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 08:28:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 08:28:29 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 08:28:29 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 08:28:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LyTgIbFn05bVOKDHFZrUDIfku++vuAlzZgMquvULFb2FoqsvLlgEg92ehp2DTmHriF6S05ho/nUl8iKpeA5ed1ocSOUQwO/lNgNxgy8Fuol0L6VVx3vvpaR+RQgD291J0BHkGLo72yMc31dLAWGDta7EmzSnKjm17/PKhejSq8Ab3CEGzJqEziRv/DAwW8OrjqCld2HmbjzTy2gktblLHcnl9FtIe1HfiO1hNeqlfkV6IHW4Xb+HOuOXXnszVzagoXGL9+HuSwaws0PbiNIePJMfjEHziUDKfjfyJIqTCqCyiTv7/dhg0o3ux8l3b/QSl7cg4FMoje3UVujbiLEsAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5tekjFJorYnJ0LOK+ONEIyKnNW/j3prXIOgcxRreGY=;
 b=NXWyulgyVYwXfRIXdlzq378weWtMKQOAfocI7NBRjbMK3MBpTXMKQx7OOUqelXvq/J4u6gO7mVJJKaP3FPE8n9widyArahu9h1LZSHNHnX4cXXksr5HyXN0Zv9xX6f45OKifvKZtX23sZAcbcx+XrtgpJUyfFbaZ+KOOzdeFbFd/3LXY7fCkeuwQV/kl7RgbEddjQg1Du0CYF3aJvUwdTn+CN9EaFjWMylbAD5IDt6bNKW65VJmdekO6+BAaxEl+EGJbZ0FHzWgGGcIBuP+tUjEDTYjgujF4lY+7KPMpLRzW+UKFGkUj6YPCQQ2hVJyGZ9Uh0P1FVe22FGf6mIh/tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5395.namprd11.prod.outlook.com (2603:10b6:610:ba::6)
 by DS3PR11MB9866.namprd11.prod.outlook.com (2603:10b6:8:366::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 15:28:27 +0000
Received: from CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490]) by CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 15:28:27 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Zuo, Alex" <alex.zuo@intel.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_pxp: Require output for display tests
Thread-Topic: [PATCH i-g-t] tests/intel/xe_pxp: Require output for display
 tests
Thread-Index: AQHdGJmlsIZFR22S60qmmXcy6x+m5rZ3BaiAgAENZvA=
Date: Tue, 21 Jul 2026 15:28:27 +0000
Message-ID: <CH0PR11MB539581562F0BC0A094DE3745E5C22@CH0PR11MB5395.namprd11.prod.outlook.com>
References: <20260720224635.1963815-1-jonathan.cavitt@intel.com>
 <f0fe86b1-b650-4db7-9df1-1b2513f53bf5@intel.com>
In-Reply-To: <f0fe86b1-b650-4db7-9df1-1b2513f53bf5@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5395:EE_|DS3PR11MB9866:EE_
x-ms-office365-filtering-correlation-id: 86a0851f-f2c6-498e-ae80-08dee73cb634
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|366016|23010399003|38070700021|22082099003|18002099003|10067099003|4143699003|11063799006|5023799004|56012099006|3023799007|6133799003;
x-microsoft-antispam-message-info: BLtuDkxzpVk6n5bML3f49poRB2OMTJpOxyqkaUs+znRTo9sfuBnW4Uaft5SY2m4KV/6obm/uO9fT0G+PX1MjrO0yoQ2XbKXEXkZpbZ1reC493OKWFXfMOnDqzoPWEXNJAWNjwySeDoDlLq7Dp+XOWdHmjjkeEnXQ+ve3oeCC7G4EvzrJ4rDqtm8IQpGqIT74rGToV1LkTg4vUSBJErNTbtA2ERc6evrGcIjsG6QYxj92geMgUChZDpLIyAa14dj20znsbhMX2yCBMPxbpCdHuY9ViYNqq1Ej75FeXmCiEueDyRO0bGYBuhn/1cLE5sDioL0lnrAHry8iLouZN9fnv3uMluZGx5twhaEXYfWmTZ218JZsrUN6uXC/DnoTyL6HRvJUcFi0zEfPnPjEDnYYPf7J7LfuELO77jcDHCCeqikARmBADjK79fLTWNGJrrvfIPWQ8wGv5/eecSVBsi+5RtEr5DBr5KB6gE2Le0umfEzztKHpxx/wV7ISws+qFme8TDzCL8r+qd/URHHXsqjrZLXAI73OUHTA/wv+ESZ9I7XBJBz7JlPy3crFiwdmjf8m7J7ShwqgHhR5YKqtQ+Ifx4L8stewkVYYg5Wk/qchI+UQFdWqnqE58hySVeJwho+P3NhhhtOSy+DEtysS5bFUUTBzlLzS99XoN0iV/aTmMVXUkwk+d9RAHifvTscdo4PTaPT1vqwfnZfA+JqpkTDx6CLrk/Bkn9g3ovLvUqaD2gw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5395.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(23010399003)(38070700021)(22082099003)(18002099003)(10067099003)(4143699003)(11063799006)(5023799004)(56012099006)(3023799007)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFVpUWRxejVDV1ZtUXpXNWI3cjBudjRRVkxUVUxUUzBKb2VrVXFqYzVVQ2ly?=
 =?utf-8?B?aTlSSU9ML21XcW1oZ3VNLzJKbU1MRERaYVhGNnZWcEl1bWZQbTBiMjlQbC90?=
 =?utf-8?B?Vi9LK3VGS2Y2N1RHYUJRVHVPYzl2M2N1SHlJSjRRL1VaWnh2TVEzTElVeElO?=
 =?utf-8?B?dWFZSmpqTmJ0S1FhRlJ3dnRMdUp0dzFVK1NqelU3U3lYNmpYRDM5MVY4YWI0?=
 =?utf-8?B?bGdMNE5FbytwS1FEclFsWmRqam94MEs0MlRIY256WTFrb3VNN1dMalpuYWo3?=
 =?utf-8?B?ZzA3QUNXYURLSWN6WGNJclk4Y2FrK0tGcWl3Qk1MMXFXQ01EcU5mQkt5bGdE?=
 =?utf-8?B?N0ErYnhhcEF5TUMxVXRTUStMT1QybktWVVhTWXJ3SExHOWhGY2k1VDBkTDNX?=
 =?utf-8?B?ZDRSQ3F1bVFtV0U0K25hTm1Ba3FCbitjSkhBbXAvWXRiN0E5TjhsTm1EZWhW?=
 =?utf-8?B?MUxpcTJjM3ZuajFvY0Jsb0dqa0ZUQUJFQWhjTkk1VVk5RngzVDRUeEVBenk5?=
 =?utf-8?B?ajdsdFFuZ1VJQmswSTV4K3RVVW1tUGdvb0kxU1pHN0xLWmtYWkxxL2ZHanFM?=
 =?utf-8?B?ZUlsNjJjOWpjN1RjclN6RkNVcFNmZSt4YndsTFlHeHIyQjl3SlFIQjMwWlZG?=
 =?utf-8?B?NzZOb29aSGdzUTZCUGVNZlNsc25QMFZjNEMvRmRVQ3k3RjVsRERpbWJvaHUr?=
 =?utf-8?B?Tzh0dnFIbWNFMnBoTmtMZXgvVUhWenFtRW1oRUxIRU1vTStleVFJRVpEUFha?=
 =?utf-8?B?U1FJU2tEelhyL21keDFzRDQyVjdGQzR3L2xqNVl2MGZ6MUFxYTdjMG5jWk1w?=
 =?utf-8?B?NUN5YmdqSGQxaVlmSVVVVVo2Rnpzbm5CbHZBeXdUSkhjYkp6dzZLOU5JYklk?=
 =?utf-8?B?MTBiY1JOUXl2NEo4MCtjNXhZZmRma3MxSkF2L0NTcXR3M3BLOWpQaW9tTDkz?=
 =?utf-8?B?S21UeVI3MURFdEJMd3ZxcmErQS9zUFM2OEp4U2pVT1Y5ZThZTHp3U1JBcDFs?=
 =?utf-8?B?RDNrUGE4VFgxZm5QQ0V0WHhYZSs2aXJHV05QMzdyOW9HODJ4YnVXaG1keC9Q?=
 =?utf-8?B?VEtVRXBNUi83dUJueUZjRUk1Qk9mcFVWWGNoY0hRQ2h6eE1lS3kzT29HaHow?=
 =?utf-8?B?MVJxV09UZHhhRy9WVUJ0eFhac2dtMlZIRUptVk5pZ3N5cTZKSGUwM2Z3YU1x?=
 =?utf-8?B?K242Ykd0UDBBZDVTZnZPSGlSY3JPbVhSTlhad0lndERBSDRkZmV2VDVlSHN3?=
 =?utf-8?B?WkdZVi9La2RxbkczYWlyL0hJa2JEcUh2Z21rOFVTMmZTbnNVTFZ2b3dhY3kx?=
 =?utf-8?B?cllvUFZ1dExMajhWaGtZY3hkWVdqSHNrRnNSajFFdko3SlgzdlkvY093aTVl?=
 =?utf-8?B?THE1WlprWVpFVkxtdUNzcXZCMlJrSkZRNmJtY1R0MlprSU8vNkFtL2Zjckd5?=
 =?utf-8?B?NE5EcExyTlV3akF5UlZrU0I3NC9hcW1qYXc3aUJoS1d6SGdGQVIxbmc2MTd2?=
 =?utf-8?B?cjZEMTlvSHBzUVFVYnFRSXk1cXJaL3RlRkwzUG5iVElRdHI2SnpvUWkyU3Vj?=
 =?utf-8?B?Z2hQbExNRUNpZGk4ZE5zQzNMUGZFbTZXaFMwMlhVMmtaNGFBaVNtNTRXb0ha?=
 =?utf-8?B?d28vWHR4Lysyd0poU1hoK3VtRzdST0QrVWZtMXRSV3FvbG9GQ0lIN1NENzJ4?=
 =?utf-8?B?aTFTSHl1ckJ3bjBDaGVWdGUxdDdCelBJdTdqazVKZW1CY2hya3MxNURjVGxM?=
 =?utf-8?B?Rk9ySnRQYTltWFRQUjdPV1czNkhubnhiclFpVmQ1RGxCU3RtM0ovVzA4T1ZM?=
 =?utf-8?B?YXp5ZElLL01wMDdhVTRsRngwRkEvQVdNRXBCdHlqbE1paTZaSllicGRKV2tr?=
 =?utf-8?B?cUovWXlETkZuOTN5RDRrZk0yaksrQTgyMGU0dnJUZTVxRkdDdGVKbjM1bkor?=
 =?utf-8?B?WXluNzNndG1TQzVneVA0aUI0MVFxcFQ1RHNaSi9kSEI3cnAvVTI2aTJTeFpH?=
 =?utf-8?B?TitpNDh1Z0dnNkNWYzgyRFZpZTM0RE8xVUZSVitSNE8vYWxYN3NZdy9mcUlW?=
 =?utf-8?B?YnBNRFhFMVNFSUdITjNCSTNtNWh6ZmlHZk9KTnBtQ3NKZ0pzZyt2YUJLNHky?=
 =?utf-8?B?bEpVRHFwTC9nbmlEL3VLdFpRSlN5WHdaYjk0Zm50RS8xbTducW1KaUtLUy96?=
 =?utf-8?B?TlJPVzIycmp5dXR5NGF2dk9IVjNHQ2xDaGRyMGJFazJYUGlGVlFVaVNNdXF5?=
 =?utf-8?B?ZytPQlFnNWM4ZkJheXpWU01PZkZ6K0h3QncyazduVy83ckNqYjF0b3pKWmUv?=
 =?utf-8?B?ZHc1RUthVDBPYmMrQlhVRmtnTkNOTWlsVE5GKzU2S3VtM2FzdEhJVkd6WG9N?=
 =?utf-8?Q?p0b8zXNUDBKyzzaICGy1jIN1dpQCDmZacm44Vj0X+rVeP?=
x-ms-exchange-antispam-messagedata-1: /AVdeyIEopfSOg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: cWLAabG3YLQjpRHVGTkapTh8Ngp4c6amXF7WR+M9rlGxM+qLbOyDUB5G4b5Zbn2q+VPsVShx2LXs8EoSZ33qog2wqxwF5W+9azm+gY8SPbUu8tUVNWFd/juWg2wQtEhrLg7yiPjYXE4p6tuGqWdemBbB14FEoyuBmY49hhSOu1+2fzUfxg0+PBzxuSEuzLRChiQotnVT681+jQrHjl57plHxlECRHFqO4SWtxrzOJAT9Uyj54tmcF7T0FZt7IqNfCGNo2/dznmPcbtYpHdSq/OGJQOHWwyKkjQInmYK4qkYiaZL5xf+8u0mtGbjQDwq5gp88wDMpCNWWOlPItilZ1Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5395.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a0851f-f2c6-498e-ae80-08dee73cb634
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2026 15:28:27.3808 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e8WbkeEjzAa9DCX0zLWh+8GDJav5nfFUz4nB0SQrofyaCOxaIK2BxQ7TLv2AxYaJNxocvbCqkBp7YZNwKcsx5mNjwWfY3k0Y1ZutEduFA2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9866
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IENlcmFvbG8gU3B1cmlvLCBEYW5pZWxl
IDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPiANClNlbnQ6IE1vbmRheSwgSnVseSAy
MCwgMjAyNiA0OjAwIFBNDQpUbzogQ2F2aXR0LCBKb25hdGhhbiA8am9uYXRoYW4uY2F2aXR0QGlu
dGVsLmNvbT47IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogWnVvLCBBbGV4IDxh
bGV4Lnp1b0BpbnRlbC5jb20+OyB2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbQ0KU3ViamVj
dDogUmU6IFtQQVRDSCBpLWctdF0gdGVzdHMvaW50ZWwveGVfcHhwOiBSZXF1aXJlIG91dHB1dCBm
b3IgZGlzcGxheSB0ZXN0cw0KPiANCj4gT24gNy8yMC8yMDI2IDM6NDYgUE0sIEpvbmF0aGFuIENh
dml0dCB3cm90ZToNCj4gPiBUaGUgc3VidGVzdHMgZGlzcGxheS1weHAtZmIgYW5kIGRpc3BsYXkt
YmxhY2stcHhwLWZiIGJvdGggY2FsbCB0aGUNCj4gPiBmdW5jdGlvbiBpZ3RfY3JlYXRlX2NvbG9y
X2ZiIHdpdGggYSB3aWR0aCBhbmQgaGVpZ2h0IHZhbHVlIGdlbmVyYXRlZCBieQ0KPiA+IGdldHRp
bmcgb3V0cHV0cyBmcm9tIGZvcl9lYWNoX2Nvbm5lY3RlZF9vdXRwdXQgYW5kIHNlbGVjdGluZyB0
aGUgbWF4aW11bQ0KPiA+IHdpZHRoIGFuZCBoZWlnaHQgYW1vbmcgYWxsIGF2YWlsYWJsZSBjb25u
ZWN0ZWQgb3V0cHV0cy4gIElmIHRoZXJlIGFyZSBubw0KPiA+IHN1Y2ggb3V0cHV0cywgdGhlbiB0
aGUgcmVzdWx0aW5nIHZhbHVlcyB3aWxsIGJlIHplcm8sIHdoaWNoIGlzIGFuIGludmFsaWQNCj4g
PiBpbnB1dCBmb3IgdGhlIERSTV9YRV9DUkVBVEVfRFVNQiBpb2N0bC4NCj4gPg0KPiA+IFNraXAg
dGhlc2UgdGVzdHMgaWYgdGhlcmUgYXJlIG5vIGNvbm5lY3RlZCBvdXRwdXRzLg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29t
Pg0KPiA+IENjOiBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9A
aW50ZWwuY29tPg0KPiA+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXgu
aW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICAgdGVzdHMvaW50ZWwveGVfcHhwLmMgfCAxNCArKysr
KysrKysrKysrKw0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykNCj4gPg0K
PiA+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9weHAuYyBiL3Rlc3RzL2ludGVsL3hlX3B4
cC5jDQo+ID4gaW5kZXggOTMyMDA3ODczMy4uMDgwZGM5NTE5ZSAxMDA2NDQNCj4gPiAtLS0gYS90
ZXN0cy9pbnRlbC94ZV9weHAuYw0KPiA+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX3B4cC5jDQo+ID4g
QEAgLTg2OCw2ICs4NjgsMTggQEAgc3RhdGljIHZvaWQgY29tcGFyZV9jcmNzKGludCBmZCwgaWd0
X2Rpc3BsYXlfdCAqZGlzcGxheSwgaWd0X2ZiX3QgKnJlZl9mYiwgaWd0X2YNCj4gPiAgIAl9DQo+
ID4gICB9DQo+ID4gICANCj4gPiArc3RhdGljIHZvaWQgcmVxdWlyZV9jb25uZWN0ZWRfb3V0cHV0
KGlndF9kaXNwbGF5X3QgKmRpc3BsYXkpDQo+ID4gK3sNCj4gPiArCWlndF9vdXRwdXRfdCAqb3V0
cHV0Ow0KPiA+ICsJYm9vbCBjb25uZWN0ZWRfb3V0cHV0ID0gZmFsc2U7DQo+ID4gKw0KPiA+ICsJ
Zm9yX2VhY2hfY29ubmVjdGVkX291dHB1dChkaXNwbGF5LCBvdXRwdXQpIHsNCj4gPiArCQljb25u
ZWN0ZWRfb3V0cHV0ID0gdHJ1ZTsNCj4gPiArCQlicmVhazsNCj4gPiArCX0NCj4gPiArCWlndF9y
ZXF1aXJlX2YoY29ubmVjdGVkX291dHB1dCwgIkRpc3BsYXkgaGFzIG5vIGNvbm5lY3RlZCBvdXRw
dXRzXG4iKTsNCj4gPiArfQ0KPiANCj4gV2UgYWxyZWFkeSBoYXZlIGlndF9kaXNwbGF5X3JlcXVp
cmVfb3V0cHV0LCBhbnkgcmVhc29uIG5vdCB0byB1c2UgdGhhdD8NCg0KSSBkaWRuJ3Qga25vdyB0
aGF0IGZ1bmN0aW9uIGV4aXN0ZWQgYXQgdGhlIHRpbWUsIHRob3VnaCBJJ20gbG9va2luZyBub3cg
YW5kIGl0IHNlZW1zIGxpa2UNCnRoZSB0d28gZnVuY3Rpb25zIGRpZmZlciBzbGlnaHRseSwgcmVz
dWx0aW5nIGluIGlndF9kaXNwbGF5X3JlcXVpcmVfb3V0cHV0IGJlaW5nIHN0cmljdGVyDQp0aGFu
IHJlcXVpcmVzX2Nvbm5lY3RlZF9vdXRwdXQuICBTcGVjaWZpY2FsbHksIGl0IGFwcGVhcnMgdGhh
dCBpZ3RfZGlzcGxheV9yZXF1aXJlX291dHB1dA0KYWxzbyBtYW5kYXRlcyB0aGF0IGVhY2ggY29u
bmVjdG9yIGhhcyBhIHZhbGlkIGNydGMgY29ubmVjdGlvbiwgd2hlcmVhcyB0aGUgY3VycmVudA0K
cmVxdWlyZXNfY29ubmVjdGVkX291dHB1dCBpbXBsZW1lbnRhdGlvbiBkb2VzIG5vdC4NCg0KSW4g
cHJhY3RpY2UsIGl0J3MgbGlrZWx5IHRoYXQgdGhlIGRpc3RpbmN0aW9uIHRoZXJlIHdvbid0IG1h
dHRlciB0b28gbXVjaCwgc28gSSdsbCBzd2l0Y2ggb3Zlcg0KdG8gdXNpbmcgdGhlIGZvcm1lciBh
cyBzdWdnZXN0ZWQuDQotSm9uYXRoYW4gQ2F2aXR0DQoNCj4gDQo+ID4gKw0KPiA+ICAgLyoqDQo+
ID4gICAgKiBTVUJURVNUOiBkaXNwbGF5LXB4cC1mYg0KPiA+ICAgICogRGVzY3JpcHRpb246IFRl
c3QgdGhhdCBhbiBlbmNyeXB0ZWQgZmIgaXMgZGlzcGxheWVkIGNvcnJlY3RseSBieSBjb21wYXJp
bmcNCj4gPiBAQCAtMTE2NSwxMiArMTE3NywxNCBAQCBpbnQgaWd0X21haW4oKQ0KPiA+ICAgCQlp
Z3Rfc3VidGVzdCgiZGlzcGxheS1weHAtZmIiKSB7DQo+ID4gICAJCQlyZXF1aXJlX2Rpc3BsYXko
eGVfZmQsICZkaXNwbGF5KTsNCj4gPiAgIAkJCXJlcXVpcmVfcHhwX3JlbmRlcih4ZV9mZCwgcHhw
X3N1cHBvcnRlZCk7DQo+ID4gKwkJCXJlcXVpcmVfY29ubmVjdGVkX291dHB1dCgmZGlzcGxheSk7
DQo+IA0KPiBUaGlzIHNob3VsZCBiZSBjYWxsZWQgZnJvbSBpbnNpZGUgcmVxdWlyZV9kaXNwbGF5
KCkNCj4gDQo+IERhbmllbGUNCj4gDQo+ID4gICAJCQl0ZXN0X2Rpc3BsYXlfcHhwX2ZiKHhlX2Zk
LCAmZGlzcGxheSk7DQo+ID4gICAJCX0NCj4gPiAgIA0KPiA+ICAgCQlpZ3Rfc3VidGVzdCgiZGlz
cGxheS1ibGFjay1weHAtZmIiKSB7DQo+ID4gICAJCQlyZXF1aXJlX2Rpc3BsYXkoeGVfZmQsICZk
aXNwbGF5KTsNCj4gPiAgIAkJCXJlcXVpcmVfcHhwX3JlbmRlcih4ZV9mZCwgcHhwX3N1cHBvcnRl
ZCk7DQo+ID4gKwkJCXJlcXVpcmVfY29ubmVjdGVkX291dHB1dCgmZGlzcGxheSk7DQo+ID4gICAJ
CQl0ZXN0X2Rpc3BsYXlfYmxhY2tfcHhwX2ZiKHhlX2ZkLCAmZGlzcGxheSk7DQo+ID4gICAJCX0N
Cj4gPiAgIAl9DQo+IA0KPiANCg==
