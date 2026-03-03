Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEF9EC1430
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 13:11:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C3D010E7F5;
	Tue,  3 Mar 2026 13:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bWyxRKCu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A8610E7F5
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 13:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772543460; x=1804079460;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5qoNX5tQGhes583HYMoCxeEBy7tNrkxZg+B/etUE5Lg=;
 b=bWyxRKCueNG3f6CPfyNjGIC0L1TD8SRtlcEzIJklwc4T0Q9ILCv5Mmyw
 iiINoC4N9H6SEY1kBiFLjjZoi2jgLmdepSO4e1FpJPxP/Dx5d1pa6JPST
 cqZuIGvXlbHr+2IXLFaqhTkogKEwNzwC0yzC3Y02MPsi5YIGuFuzkpB8i
 T5v1A+RfLJiv5ifYOP3idPtQK1PDVg+0BO/aa8YnjN4bE56xDeSfDTwXJ
 /wY1UroVMg1cjPcuLtHyOVXNop8LpQBwjxgQZj4LfeZ5aQt43zE1dPN9w
 6EJpTfJsctpoAeua1efQ9SBWWZbwXTYGWqHcETXhDQWrVETHgAI5M3UI/ A==;
X-CSE-ConnectionGUID: qLCLp48ST8qx/bRPDa9BFw==
X-CSE-MsgGUID: vJp30a5tQeGz7GFsF/IAyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="91149928"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="91149928"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 05:11:00 -0800
X-CSE-ConnectionGUID: /2ElnxPuS1KMWEfjkc/jvg==
X-CSE-MsgGUID: Pbc+BwGiSCGr500+7D2m0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="217970698"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 05:11:00 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 05:10:59 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 05:10:59 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 05:10:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xQay5P62FqPHF9tl/wdCMTLddyp0pkdRj+/MvBPS2a4z3hIQ+sra7HUlDtO6/6W3S9lFypDAPUz0wsrZp9F3BJMJ8v444gkNUswMsmJj3atsl9wf6MaFIiOQYLtBiqi8oYYW5TYJ92A8qYs9Vlp2/x47J/EzgzVbtEgrYTni7BU/ser/H93QpvChIIEc3RMBBAaZxeVsH9DmWqZ+xrs4Cm7VckL5uDWP0M158UXWZ7VdlMmyOmE7jW4xSRkOhDMnYXptR1LjeLtqS49MjNu3Ey+B+F7VMtpfkbIrUd7BQ1FlzqwCE9Tp+ZCheDAqpnOkbukeY6WoITlr6PLPAgPczg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qoNX5tQGhes583HYMoCxeEBy7tNrkxZg+B/etUE5Lg=;
 b=IZ0Kjt0ILWqCsoV47gysGNeibYZhVKRUDO3fldhDyGtBh1qlJsjNHSdPI/c6/87rn6OrbH7jk3/o/v+JFmdf7F3capupkZhB2GfUVD4NdMJlyFPDz9yH04MJQn9J6GCAgfU0ti+RAcwSMVYV7jOafrWCXKNEvrpE5jik8RjAWZd07g1zF/Ah3lKqd6xuio5Wt2Vubd/CUG9fMhxH7JSjpNRScRYo1uLhOWyl7M0CkKpzKotXZ7JIEliIO2iAE3TlqNgAiNkN+g/WjuJWCyz4vwgzKf/yu8X9pGNK/f6Gy7IZMiv/8IXFTHlnRDpX20bGVMGB4F6kj+pzmcDni+mfug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by PH0PR11MB5805.namprd11.prod.outlook.com (2603:10b6:510:14a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Tue, 3 Mar
 2026 13:10:57 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 13:10:57 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 5/5] tests/intel/xe_pat: Validate XA App Transient
 feature
Thread-Topic: [PATCH i-g-t 5/5] tests/intel/xe_pat: Validate XA App Transient
 feature
Thread-Index: AQHcqsewqcmMXjJ0A0+yVgOVKCG+QrWcnfMAgAAqj2A=
Date: Tue, 3 Mar 2026 13:10:56 +0000
Message-ID: <CH3PR11MB8434278293C7FDC59897EF1C8D7FA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260303043853.1656156-1-priyanka.dandamudi@intel.com>
 <20260303043853.1656156-6-priyanka.dandamudi@intel.com>
 <4524e97d-4da5-4776-a877-493ca023c801@intel.com>
In-Reply-To: <4524e97d-4da5-4776-a877-493ca023c801@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|PH0PR11MB5805:EE_
x-ms-office365-filtering-correlation-id: 23abfe8c-9c4c-4a32-1ac8-08de79264eb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: dNGQU43zcLsBoPcZc8QJulKAtDiy3+UCwHg8HWLt/sDoKuTqEpCHh89JoOvMDeG7X2LR0ufOSfXOadyOasv/btvMxNYI+ANe/thF156yFir1EG/QN2ykeCGqT8ifwyyEWUbniMb1jtLC0aVkWJoaU8X+aJy6w7eA5i0F9iGIB50+azk/DGWFLpEFdd5lBtqjixZcTgZEw0MD+0FxpnNlMx3j1vexbicrzIpDMl+LG0Xun2mPj5RuAunbQgBKEh4gOv5gHHrRJVvL9B1rquQ8ZF139dI2poblyXncS+FQpUcRErA1QdMiefKaKycFrcghvKL3UiD4ro2Xkw1CYFvVb0gl5x7vWyOzgb7Gm3YM0cBlF8ji1/UWbRWWuPw7NYu5Xy6ymocSwgHUf559R7wj4uh3MFn8f2wimOyeb+J1/4p59zHjZN1ZpSyQ+8fv7CHvHRV7uLp2R0q1iTFFyc25sRUW8WRZa8ptm90iz6tkJMsD/FqB16nK5hVmCPyA4Lvru5bwiiWJvRCPLWYMfuKspaFITRO7wCeClf8KSzVPcHuQwyLPa7mLbmNFd60uDZl1G491+RwgwvIQeqPfAzJC5Ig8hupl7BOkaNKfMrciwF6ISRfvDhp1qZc1gOqdAlzbGrTAE9aUmHL4GwnpETnGgtt/rJdKOi6XcVUv05UmTKitidhwLq6HU5nMGlpCuH0YYZUylUJD3xLS9t7pIGL+B4/kMvpTw5vG0UgwQXUszdtHRbbWsTUQiNS1CaE/GxRP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUJTcnhNcWo2b2lnL284bDlCUWsyNDZKNksvcHMvRmdGUmdubW45bVo2QWFl?=
 =?utf-8?B?LzEzNTMzc1VEdWNON1Y2OWx3c3dycnh6YkRSNjJYVDN3SjFhOGpTQnhXZ29m?=
 =?utf-8?B?cGRZZWVWYkJsTzJNZDRNUFhoWEsxTjBNL0ZNYUgyY1UzTE9uMGFkSkhTWXdH?=
 =?utf-8?B?YWxRWm9wNmFsczVzb3QrcEVDREcyQS9OUWh2MTAvTmFvb09JL2tNVnBjNUtm?=
 =?utf-8?B?a2djeUw1OEFNWmNhUmd2SVZGb0t6UVJIM3Fra21yNEhMQjZGSlo4L0U1NXph?=
 =?utf-8?B?STJYZ1UxNjNmV2w1S1NZb1hoUlJFR284K0ljT0gycjRJWkJ0dnQ3V0dJNVVU?=
 =?utf-8?B?d0d2ZmI0WW04NFl6M0doRWdWL1NQejZLcnV4MDM0OXhaQ2hiMHJ3NGpXTDZr?=
 =?utf-8?B?d1R3UHZ1QkhLTzhyNE40T3lmYWpuQktvRzdQdkt4b1hIbStqM1kxdEU0YTRu?=
 =?utf-8?B?MkhEZW9FMmtVOUNYNEhaQnAwb29IQWtRaTUyOGM2V2FWQmJuVjhSNkRiL2RU?=
 =?utf-8?B?R0hSTzZZN3c0L2hzREtlSUtuU2h5V3UvN2oxZml3K1pHK2hkczF6WFl1U25J?=
 =?utf-8?B?N1QvS0gvdmhZMTc4WisyMlJHSC9nTkkzWHBGTVNuSEQyTFB4ckkyTFd6YlJp?=
 =?utf-8?B?ZkZ1Rmt2RzRobWVjQm1acWdiWnBjRm9SdVAzV1hJNkl3MjcrY2duRnNEZ0Qv?=
 =?utf-8?B?UG1hUXVtZ1ZLdy8raWpOZ3NnRm9pVUt0ZTJYY3pyU3VLVHhjeUR4cFdqRVJ6?=
 =?utf-8?B?Ujd2M3A0UzYvaWZUS2djQmNQSi8rMExZOWJkYUQ3RFRweWFwWnkwRzBhMnk2?=
 =?utf-8?B?aEhlSHJGVmlLZVVwR3h0T2RVSWdjQzdZa1M2R1R6aGhRdVhIKytrV3FnWXJk?=
 =?utf-8?B?b1dKdS9uQ2Y4RUdUQTZPZ011dHlKOElBcHpuOGFLM0dodDV4b3l2aHhSemVj?=
 =?utf-8?B?czdpSjE0c0dLU29MZWVuaVZaNHhGU1FaVnRzelZheW56WnBpeE8vTWVaTGtn?=
 =?utf-8?B?cGZnSXl2cVNlV2huQituZ2ZER1ZOK2VJVmhPNzFFelE0Uk4vMFA3OTVhcHlK?=
 =?utf-8?B?dWdFWFlXdTBINjh3aTRvR01mU1VoZ1kvUWJEMDZzVnJtdmd4bU9pcktaRWwy?=
 =?utf-8?B?V3BaREZxV2x4alZlQVhLdFlNczRRd0Y4ZmNaTHI3bFR0MHNaNG0wVWtRei80?=
 =?utf-8?B?Rlc0YVRQVXRsYWI5cG40VUo1QVBka045cFlIa1lJL1NpYW02bVZSUFlhdmRa?=
 =?utf-8?B?OExxYXFBM0drZFZoUklYS1pDZVBLNXdrWlE0T3R6QlByaEhVYlFxQmhmM0dZ?=
 =?utf-8?B?c3c2VGl2bW1VelViTnlHNlpEeHVrMHZKcDdJR1lUMGx5aTlEc2lhQnJXcW9m?=
 =?utf-8?B?UGF3WFFIZDVzNFBZRGdvRGVqRmVYTnd0b04zbm82UnpLMURRemRSZ1RPbEZm?=
 =?utf-8?B?V0xSb0dDcVMyQjlwbXVPK21yM0U0WEJEZTE5VmN3RVBqaGRWcW9vNFZLUk9K?=
 =?utf-8?B?ZHk1RjQvY3N6Z3ZhMzE5dnUzc00rWnBrcGoxZDBNVUh0MmpsZi8wdDhUd3VH?=
 =?utf-8?B?VnExVzBiOXIyT3ZQS0ZqSnhtaEV2SlU0NHNMSC9lS256LzR4emJLZ1QwZ1l1?=
 =?utf-8?B?MVMwUkNxVjdrZ0JmNEkyU3JKSnpjbzdkQmZEb2tTVHc5eERWSWgxZi9UbzRN?=
 =?utf-8?B?OWtRNEtYU2ZrMkNESHMweUJyMkhISlliOFZNKzVTNUEyNExWYzViSjUyNXN4?=
 =?utf-8?B?Y1BkV0xNR0h1YldldDU5eXlIZFlNeFJTYTg1YzF3SEU1eTVpeW85Yno1ajAz?=
 =?utf-8?B?bHNaRUJwTVJIcFNOalMwRUdDcWhTRHN5dkIzMW94V3dYRVd6ZTd6czN5Q0VS?=
 =?utf-8?B?a21rN0xHckVVdGxHenQ5MFAzNW9KcFdLR0ZuWkRaVmM2c3R4TFRPejA4K0NT?=
 =?utf-8?B?VWFaRlhFdTlTMFlaUm5kWXFFSTkzQkdBRzZkNWpNY25XckxOcmZvRjMzbHl1?=
 =?utf-8?B?b2poclAyWUlxRytmbkN4TjVCaGQxMFphWlVoS0VwODhtanJvNkJXTGNJOHk2?=
 =?utf-8?B?TTl1cmJWWVNveWl3MHVRWlVLRG5rdlZSZ1NoOWdSTmxOSkFLVHpKYXZPOCt6?=
 =?utf-8?B?c21OczlVcUxRYmd5bURXV2YvNlVadVNHTVZjYjZBbSt2RWdlZVYya0VPaUlt?=
 =?utf-8?B?RTJlT1ZVOHlJeVBRVUdkZHo5RVJwVSs1MGQ2Ui8rSmMwWXd4MzRPMVBHSTFK?=
 =?utf-8?B?QXFpNU9EVHo4eEUwb1F2Z25SRHhtNWc1cEt1b2FTYVpXQnhXeEp4Z1ErWGlv?=
 =?utf-8?B?ekZlVFhNZG5IdnZGZjgzZDQ0dTFLZk9HMDhONUMwckNNRjZCK2h1QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23abfe8c-9c4c-4a32-1ac8-08de79264eb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 13:10:56.9071 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OPpHva6Ac6QzE3lCX2ejOrOEUlIos4BuybrV/hkzaJWIitul+0WWxQPKL8GnuW11nztyQn17gHGfJslNf9RmCJeUzDgt8AdOdMFIIfxH8wA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5805
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhldyA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogMDMgTWFyY2ggMjAyNiAwNDowOCBQTQ0K
PiBUbzogRGFuZGFtdWRpLCBQcml5YW5rYSA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbT47
IEtlbXBjenluc2tpLA0KPiBaYmlnbmlldyA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29t
PjsgaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCBp
LWctdCA1LzVdIHRlc3RzL2ludGVsL3hlX3BhdDogVmFsaWRhdGUgWEEgQXBwIFRyYW5zaWVudA0K
PiBmZWF0dXJlDQo+IA0KPiBPbiAwMy8wMy8yMDI2IDA0OjM4LCBwcml5YW5rYS5kYW5kYW11ZGlA
aW50ZWwuY29tIHdyb3RlOg0KPiA+IEZyb206IFByaXlhbmthIERhbmRhbXVkaSA8cHJpeWFua2Eu
ZGFuZGFtdWRpQGludGVsLmNvbT4NCj4gPg0KPiA+IFRlc3QgdGhlIHNjZW5hcmlvcyB3aGVuIG1l
ZGlhIGlzIG9uL29mZi4NCj4gPiBXaGVuIG1lZGlhIGlzIG9mZi9vbiwgZm9yIHhhIGFwcCB0cmFu
c2llbnQgYnVmZmVyLCBkYXRhIHNob3VsZCBiZQ0KPiA+IGNvaGVyZW50IGJldHdlZW4gY3B1IGFu
ZCBncHUuIENvaGVyZW5jeSBzaG91bGQgYmUgbWFpbnRhaW5lZCBmcm9tDQo+IEtNRA0KPiA+IHNp
ZGUgaXJyZXNwZWN0aXZlIG9mIG1lZGlhIGVuZ2luZSBvbi9vZmYuDQo+ID4NCj4gPiB2MjogQWRk
ZWQgY29tbWVudCB0byBleHBsYWluIHRoZSByZWFzb24gb2YgZm9yY2V3YWtpbmcuDQo+ID4gQWRk
ZWQgMndheSBhbHNvIGluIHRoZSBpbmRleCBhbG9uZyB3aXRoIFhBLihNYXR0KSBSZW9yZGVyZWQN
Cj4gPiBoZWFkZXJzLihLYW1pbCkNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFByaXlhbmthIERh
bmRhbXVkaSA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgIHRl
c3RzL2ludGVsL3hlX3BhdC5jIHwgMTAzDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMDMgaW5zZXJ0aW9ucygrKQ0K
PiA+DQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX3BhdC5jIGIvdGVzdHMvaW50ZWwv
eGVfcGF0LmMgaW5kZXgNCj4gPiBhZWI4NGRiYjcuLmRiZWI3YzdkOSAxMDA2NDQNCj4gPiAtLS0g
YS90ZXN0cy9pbnRlbC94ZV9wYXQuYw0KPiA+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX3BhdC5jDQo+
ID4gQEAgLTE2LDExICsxNiwxNyBAQA0KPiA+ICAgI2luY2x1ZGUgImlndC5oIg0KPiA+ICAgI2lu
Y2x1ZGUgImlndF9zeW5jb2JqLmgiDQo+ID4gICAjaW5jbHVkZSAiaWd0X3ZnZW0uaCINCj4gPiAr
I2luY2x1ZGUgImlndF9jb25maWdmcy5oIg0KPiA+ICsjaW5jbHVkZSAiaWd0X2RldmljZS5oIg0K
PiA+ICsjaW5jbHVkZSAiaWd0X2ZzLmgiDQo+ID4gKyNpbmNsdWRlICJpZ3Rfa21vZC5oIg0KPiA+
ICsjaW5jbHVkZSAiaWd0X3N5c2ZzLmgiDQo+ID4gICAjaW5jbHVkZSAiaW50ZWxfYmx0LmgiDQo+
ID4gICAjaW5jbHVkZSAiaW50ZWxfbW9jcy5oIg0KPiA+ICAgI2luY2x1ZGUgImludGVsX3BhdC5o
Ig0KPiA+ICAgI2luY2x1ZGUgImxpbnV4X3NjYWZmb2xkLmgiDQo+ID4NCj4gPiArI2luY2x1ZGUg
InhlL3hlX2d0LmgiDQo+ID4gICAjaW5jbHVkZSAieGUveGVfaW9jdGwuaCINCj4gPiAgICNpbmNs
dWRlICJ4ZS94ZV9xdWVyeS5oIg0KPiA+ICAgI2luY2x1ZGUgInhlL3hlX3V0aWwuaCINCj4gPiBA
QCAtMjksNiArMzUsOCBAQA0KPiA+ICAgI2RlZmluZSBYRV9DT0hfQVRfTEVBU1RfMVdBWSAyDQo+
ID4NCj4gPiAgIHN0YXRpYyBib29sIGRvX3Nsb3dfY2hlY2s7DQo+ID4gK3N0YXRpYyBjaGFyIGJ1
c19hZGRyW05BTUVfTUFYXTsNCj4gPiArc3RhdGljIHN0cnVjdCBwY2lfZGV2aWNlICpwY2lfZGV2
Ow0KPiA+DQo+ID4gICBzdGF0aWMgdWludDMyX3QgY3JlYXRlX29iamVjdChpbnQgZmQsIGludCBy
LCBpbnQgc2l6ZSwgdWludDE2X3QgY29oX21vZGUsDQo+ID4gICAJCQkgICAgICBib29sIGZvcmNl
X2NwdV93Yyk7DQo+ID4gQEAgLTExODQsNiArMTE5MiwxMiBAQCBjb25zdCBzdHJ1Y3QgcGF0X2lu
ZGV4X2VudHJ5DQo+IGJtZ19nMjFfcGF0X2luZGV4X21vZGVzW10gPSB7DQo+ID4gICAJeyBOVUxM
LCAyNywgZmFsc2UsICJjMi0yd2F5IiwgICAgIFhFX0NPSF9BVF9MRUFTVF8xV0FZICAgICAgIH0s
DQo+ID4gICB9Ow0KPiA+DQo+ID4gK2NvbnN0IHN0cnVjdCBwYXRfaW5kZXhfZW50cnkgeGUzcF9s
cGdfY29oZXJlbmN5X3BhdF9pbmRleF9tb2Rlc1tdID0gew0KPiA+ICsJeyBOVUxMLCAxOCwgZmFs
c2UsICJ4YS1sMy11YyIsCSBYRV9DT0hfTk9ORSAgICAgICAgICB9LA0KPiA+ICsJeyBOVUxMLCAx
OSwgZmFsc2UsICJ4YS1sMy0yd2F5IiwgWEVfQ09IX0FUX0xFQVNUXzFXQVkgfSwNCj4gDQo+IE5p
dDogdGhlcmUgaXMgbm8gMndheSt4YSwgc28gdGhlIHN0cmluZyBoZXJlIGlzIG5vdCByZWFsbHkg
YWNjdXJhdGUuDQpHb3QgaXQsIHN0cmluZyBuYW1lIHdpbGwgdXBkYXRlIHRvICJ4YS1sMy0xd2F5
Ig0KPiANCj4gPiArCXsgTlVMTCwgMiwgIGZhbHNlLCAiMndheSIsICAgICAgIFhFX0NPSF9BVF9M
RUFTVF8xV0FZIH0sDQo+ID4gK307DQo+ID4gKw0KPiA+ICAgLyoNCj4gPiAgICAqIERlcGVuZGlu
ZyBvbiAyTS8xRyBHVFQgcGFnZXMgd2UgbWlnaHQgdHJpZ2dlciBkaWZmZXJlbnQgUFRFIGxheW91
dHMNCj4gZm9yIHRoZQ0KPiA+ICAgICogUEFUIGJpdHMsIHNvIG1ha2Ugc3VyZSB3ZSB0ZXN0IHdp
dGggYW5kIHdpdGhvdXQgaHVnZS1wYWdlcy4gQWxzbw0KPiA+IGVuc3VyZSB3ZSBAQCAtMTI0OCw2
ICsxMjYyLDE4IEBAIHN0YXRpYyB1aW50MzJfdCBjcmVhdGVfb2JqZWN0KGludCBmZCwNCj4gaW50
IHIsIGludCBzaXplLCB1aW50MTZfdCBjb2hfbW9kZSwNCj4gPiAgICAqIERlc2NyaXB0aW9uOiBD
aGVjayBzb21lIG9mIHRoZSB4ZTIgcGF0X2luZGV4IG1vZGVzLg0KPiA+ICAgICovDQo+ID4NCj4g
PiArLyoqDQo+ID4gKyAqIFNVQlRFU1Q6IHhhLWFwcC10cmFuc2llbnQtbWVkaWEtb2ZmDQo+ID4g
KyAqIFRlc3QgY2F0ZWdvcnk6IGZ1bmN0aW9uYWxpdHkgdGVzdA0KPiA+ICsgKiBEZXNjcmlwdGlv
bjogQ2hlY2sgc29tZSBvZiB0aGUgeGU0LWxwZyBwYXRfaW5kZXggbW9kZXMgd2l0aCBtZWRpYQ0K
PiBvZmYuDQo+ID4gKyAqLw0KPiA+ICsNCj4gPiArLyoqDQo+ID4gKyAqIFNVQlRFU1Q6ICB4YS1h
cHAtdHJhbnNpZW50LW1lZGlhLW9uDQo+ID4gKyAqIFRlc3QgY2F0ZWdvcnk6IGZ1bmN0aW9uYWxp
dHkgdGVzdA0KPiA+ICsgKiBEZXNjcmlwdGlvbjogQ2hlY2sgc29tZSBvZiB0aGUgeGUzcC1scGcg
cGF0X2luZGV4IG1vZGVzIHdpdGggbWVkaWENCj4gb24uDQo+ID4gKyAqLw0KPiA+ICsNCj4gPiAg
IHN0YXRpYyB2b2lkIHN1YnRlc3RfcGF0X2luZGV4X21vZGVzX3dpdGhfcmVnaW9ucyhpbnQgZmQs
DQo+ID4gICAJCQkJCQkgY29uc3Qgc3RydWN0IHBhdF9pbmRleF9lbnRyeQ0KPiAqbW9kZXNfYXJy
LA0KPiA+ICAgCQkJCQkJIGludCBuX21vZGVzKQ0KPiA+IEBAIC0xNTYxLDYgKzE1ODcsNTMgQEAg
c3RhdGljIHZvaWQgZmFsc2Vfc2hhcmluZyhpbnQgZmQpDQo+ID4gICAJfQ0KPiA+ICAgfQ0KPiA+
DQo+ID4gK3N0YXRpYyB2b2lkIHJlc2V0KGludCBzaWcpDQo+ID4gK3sNCj4gPiArCWludCBjb25m
aWdmc19mZDsNCj4gPiArDQo+ID4gKwlpZ3Rfa21vZF91bmJpbmQoInhlIiwgYnVzX2FkZHIpOw0K
PiA+ICsNCj4gPiArCS8qIERyb3AgYWxsIGN1c3RvbSBjb25maWdmcyBzZXR0aW5ncyBmcm9tIHN1
YnRlc3RzICovDQo+ID4gKwljb25maWdmc19mZCA9IGlndF9jb25maWdmc19vcGVuKCJ4ZSIpOw0K
PiA+ICsJaWYgKGNvbmZpZ2ZzX2ZkID49IDApDQo+ID4gKwkJaWd0X2ZzX3JlbW92ZV9kaXIoY29u
ZmlnZnNfZmQsIGJ1c19hZGRyKTsNCj4gPiArCWNsb3NlKGNvbmZpZ2ZzX2ZkKTsNCj4gPiArDQo+
ID4gKwkvKiBCaW5kIGFnYWluIGEgY2xlYW4gZHJpdmVyIHdpdGggbm8gY3VzdG9tIHNldHRpbmdz
ICovDQo+ID4gKwlpZ3Rfa21vZF9iaW5kKCJ4ZSIsIGJ1c19hZGRyKTsNCj4gPiArfQ0KPiA+ICsN
Cj4gPiArc3RhdGljIHZvaWQgeGFfYXBwX3RyYW5zaWVudF90ZXN0KGludCBjb25maWdmc19kZXZp
Y2VfZmQsIGJvb2wNCj4gPiArbWVkaWFfb24pIHsNCj4gPiArCWludCBmZCwgZndfaGFuZGxlLCBn
dDsNCj4gPiArDQo+ID4gKwlpZ3Rfa21vZF91bmJpbmQoInhlIiwgYnVzX2FkZHIpOw0KPiA+ICsN
Cj4gPiArCWlmIChtZWRpYV9vbikNCj4gPiArCQlpZ3RfYXNzZXJ0KGlndF9zeXNmc19zZXQoY29u
ZmlnZnNfZGV2aWNlX2ZkLA0KPiA+ICsJCQkJCSAiZ3RfdHlwZXNfYWxsb3dlZCIsDQo+ICJwcmlt
YXJ5LG1lZGlhIikpOw0KPiA+ICsJZWxzZQ0KPiA+ICsJCWlndF9hc3NlcnQoaWd0X3N5c2ZzX3Nl
dChjb25maWdmc19kZXZpY2VfZmQsDQo+ID4gKwkJCQkJICJndF90eXBlc19hbGxvd2VkIiwgInBy
aW1hcnkiKSk7DQo+ID4gKw0KPiA+ICsJaWd0X2ttb2RfYmluZCgieGUiLCBidXNfYWRkcik7DQo+
ID4gKw0KPiA+ICsJZmQgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX1hFKTsNCj4gPiArDQo+ID4g
KwkvKiBUbyBwcmV2ZW50IGVudGVyaW5nIGludG8gcmM2IGZvciB0aGUgZHVyYXRpb24gb2YgdGVz
dC4gKi8NCj4gDQo+ICJQcmV2ZW50IGVudGVyaW5nIEM2IGZvciB0aGUgZHVyYXRpb24gb2YgdGhl
IHRlc3QsIHNpbmNlIHRoaXMgY2FuIHJlc3VsdCBpbg0KPiByYW5kb21seSBmbHVzaGluZyB0aGUg
ZW50aXJlIGRldmljZSBzaWRlIGNhY2hlcywgaW52YWxpZGF0aW5nIG91ciBYQSB0ZXN0aW5nLiIN
Cj4gDQpXaWxsIHVwZGF0ZSB0aGUgY29tbWVudCBsaWtlIGFib3ZlLg0KPiBSZXZpZXdlZC1ieTog
TWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KPiANCj4gQnV0IHBsZWFzZSBk
byBrZWVwIGFuIGV5ZSBvbjoNCj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Bh
dGNoLzcwODI3Mi8/c2VyaWVzPTE1ODAxNyZyZXY9Ng0KPiANCj4gQW55dGhpbmcgd2hpY2ggY2xh
aW1zIHRvIGJlIHJlamVjdGVkIGJ5IHVBUEkgd2Ugd2lsbCB3YW50IGEgbmVnYXRpdmUgdGVzdC4N
Cj4gDQo+IA0KPiA+ICsJZndfaGFuZGxlID0gaWd0X2RlYnVnZnNfb3BlbihmZCwgImZvcmNld2Fr
ZV9hbGwiLCBPX1JET05MWSk7DQo+ID4gKwlpZ3RfcmVxdWlyZShmd19oYW5kbGUgPj0gMCk7DQo+
ID4gKw0KPiA+ICsJc3VidGVzdF9wYXRfaW5kZXhfbW9kZXNfd2l0aF9yZWdpb25zKGZkLA0KPiB4
ZTNwX2xwZ19jb2hlcmVuY3lfcGF0X2luZGV4X21vZGVzLA0KPiA+ICsNCj4gQVJSQVlfU0laRSh4
ZTNwX2xwZ19jb2hlcmVuY3lfcGF0X2luZGV4X21vZGVzKSk7DQo+ID4gKw0KPiA+ICsJLyogY2hl
Y2sgc3RhdHVzIG9mIGMgc3RhdGUsIGl0IHNob3VsZCBub3QgYmUgaW4gYzYgZHVlIHRvIGZvcmNl
d2FrZS4gKi8NCj4gPiArCXhlX2Zvcl9lYWNoX2d0KGZkLCBndCkNCj4gPiArCQlpZ3RfYXNzZXJ0
KCF4ZV9ndF9pc19pbl9jNihmZCwgZ3QpKTsNCj4gPiArDQo+ID4gKwljbG9zZShmd19oYW5kbGUp
Ow0KPiA+ICt9DQo+ID4gKw0KPiA+ICAgc3RhdGljIGludCBvcHRfaGFuZGxlcihpbnQgb3B0LCBp
bnQgb3B0X2luZGV4LCB2b2lkICpkYXRhKQ0KPiA+ICAgew0KPiA+ICAgCXN3aXRjaCAob3B0KSB7
DQo+ID4gQEAgLTE2NTIsNiArMTcyNSwzNiBAQCBpbnQgaWd0X21haW5fYXJncygiViIsIE5VTEws
IGhlbHBfc3RyLA0KPiBvcHRfaGFuZGxlciwgTlVMTCkNCj4gPiAgIAkJZmFsc2Vfc2hhcmluZyhm
ZCk7DQo+ID4gICAJfQ0KPiA+DQo+ID4gKwlpZ3Rfc3VidGVzdF9ncm91cCgpIHsNCj4gPiArCQlp
bnQgY29uZmlnZnNfZmQsIGNvbmZpZ2ZzX2RldmljZV9mZDsNCj4gPiArDQo+ID4gKwkJaWd0X2Zp
eHR1cmUoKSB7DQo+ID4gKwkJCWlndF9yZXF1aXJlKGludGVsX2dyYXBoaWNzX3ZlcihkZXZfaWQp
ID09IElQX1ZFUigzNSwNCj4gMTApKTsNCj4gPiArDQo+ID4gKwkJCXBjaV9kZXYgPSBpZ3RfZGV2
aWNlX2dldF9wY2lfZGV2aWNlKGZkKTsNCj4gPiArCQkJc25wcmludGYoYnVzX2FkZHIsIHNpemVv
ZihidXNfYWRkciksDQo+ICIlMDR4OiUwMng6JTAyeC4lMDF4IiwNCj4gPiArCQkJCSBwY2lfZGV2
LT5kb21haW4sIHBjaV9kZXYtPmJ1cywgcGNpX2Rldi0NCj4gPmRldiwgcGNpX2Rldi0+ZnVuYyk7
DQo+ID4gKw0KPiA+ICsJCQljb25maWdmc19mZCA9IGlndF9jb25maWdmc19vcGVuKCJ4ZSIpOw0K
PiA+ICsJCQlpZ3RfcmVxdWlyZShjb25maWdmc19mZCAhPSAtMSk7DQo+ID4gKwkJCWNvbmZpZ2Zz
X2RldmljZV9mZCA9IGlndF9mc19jcmVhdGVfZGlyKGNvbmZpZ2ZzX2ZkLA0KPiBidXNfYWRkciwN
Cj4gPiArCQkJCQkJCSAgICAgICBTX0lSV1hVIHwNCj4gU19JUkdSUCB8IFNfSVhHUlAgfA0KPiA+
ICsJCQkJCQkJICAgICAgIFNfSVJPVEggfA0KPiBTX0lYT1RIKTsNCj4gPiArCQkJaWd0X2luc3Rh
bGxfZXhpdF9oYW5kbGVyKHJlc2V0KTsNCj4gPiArCQl9DQo+ID4gKw0KPiA+ICsJCWlndF9zdWJ0
ZXN0X3dpdGhfZHluYW1pYygieGEtYXBwLXRyYW5zaWVudC1tZWRpYS1vZmYiKQ0KPiA+ICsJCQl4
YV9hcHBfdHJhbnNpZW50X3Rlc3QoY29uZmlnZnNfZGV2aWNlX2ZkLCBmYWxzZSk7DQo+ID4gKw0K
PiA+ICsJCWlndF9zdWJ0ZXN0X3dpdGhfZHluYW1pYygieGEtYXBwLXRyYW5zaWVudC1tZWRpYS1v
biIpDQo+ID4gKwkJCXhhX2FwcF90cmFuc2llbnRfdGVzdChjb25maWdmc19kZXZpY2VfZmQsIHRy
dWUpOw0KPiA+ICsNCj4gPiArCQlpZ3RfZml4dHVyZSgpIHsNCj4gPiArCQkJY2xvc2UoY29uZmln
ZnNfZGV2aWNlX2ZkKTsNCj4gPiArCQkJY2xvc2UoY29uZmlnZnNfZmQpOw0KPiA+ICsJCX0NCj4g
PiArCX0NCj4gPiArDQo+ID4gICAJaWd0X2ZpeHR1cmUoKQ0KPiA+ICAgCQlkcm1fY2xvc2VfZHJp
dmVyKGZkKTsNCj4gPiAgIH0NCg0K
