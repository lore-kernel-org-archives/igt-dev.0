Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DEAFF885A
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 08:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDDA10E9CB;
	Tue,  5 May 2026 08:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LmQdnc3z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5919B10E9CB
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 08:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777969059; x=1809505059;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FV/Ou5MNE6Ke3dRioEvu/SfeYmpl5ElewRWKz/0UomA=;
 b=LmQdnc3zKAgVYWc4wpWX3GVR2x737zRqddfs1jr25vGrv23JeLJOpSGO
 l+7gFEqWqLHNi4VP3RY6wwTAVXiQGwTK8ZQgZIaghDbCIWcU1Dxjga+SC
 D1fKlcNdUcJyY8rGKvE44GEDpvMCNqnIc4SXCHhV8sfmPEkL3MJVqjAZv
 4zEU+YUDUAzRqVIjYhpybV10rP1hIihpTflZ5XoZr6MfopCSDAebxFfGz
 SBXIjVjlxRcZzDYxbCbvVPr3ZAEsDGpxipvkEVmNzMvh0g7y6h3kP4Eoh
 4Kg5028CjJ+2LlR7OokoVIKJ43rT/6nGyiRQ5v6aEaH4Ry9UvYov9J3Cy g==;
X-CSE-ConnectionGUID: qxsIHPAnT2Sk8roIVz/kVQ==
X-CSE-MsgGUID: CYlFBspDRq2ZAmJWIQJhTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78539847"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="78539847"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 01:17:36 -0700
X-CSE-ConnectionGUID: 6aAhwYWOQ365zRF+SYsxjw==
X-CSE-MsgGUID: 1LNCtggwT2yQc73Jq9Fvxw==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 01:17:36 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 01:17:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 01:17:35 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 01:17:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abjRxMXZkUYdvt8dqWMvsqvzgrzeHB5F9/EaXiln7oLOzk36Tfhg1f69WrWRgzINdTD20KCDGnuOwhNEJSoYA9qnrL1cT630eKzwQQQwafhezbOfbYIYOuPnVH4ne5fN9hML9Sk/MQ5QhMGSVhomUfOz3lw1+BWsoTjDk21odxWXM1aKntc2vV7+bEa2a9x7h+grN15ypFHC/S85WXgYKugni6qMMHM83Vke+yLP1C6IobyyGfuwjDO4PmrujI48Pu2BgeVGoWHsz9g01AD5HfFrfPI0/5ZUs8cFFl6sEkWnIM5kTOjtaEB+vb0WilIMFMPCRM1Qef4DiybNuznKZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FV/Ou5MNE6Ke3dRioEvu/SfeYmpl5ElewRWKz/0UomA=;
 b=jGVIHztR/fMFK4kzV60/kFPN79gVKfooP4aXsR5xQ9NA1ixCTpWU0dhZTf3W/ug1uuUoGMOtXp4SJGIw7Uoifc3l/NIFYtkHHAqwe+N9dO3GyxaIkJgd1TFveIt3CIe3r9s8VrDMBAJoQ3pkbXTtV/cgXlI3gj2lx4Q5S/Er1hdMpMazFCxib7onIvHeBcJgpSC4IJuoM4EmVVt641mQNWdJ1/mkDxsd5Jye1hpU9AKX0DKgVh92k46W4e1gPK/GVcI5+lA7Aagd3qd7G4vJ8zHL28KiSq1/4ceJpovnLPryh23WDvPO1ay6eSglU7POguMkOMKjhk2d4NRPLDy0RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5686.namprd11.prod.outlook.com (2603:10b6:8:21::11) by
 IA1PR11MB7197.namprd11.prod.outlook.com (2603:10b6:208:41a::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.25; Tue, 5 May 2026 08:17:27 +0000
Received: from DM8PR11MB5686.namprd11.prod.outlook.com
 ([fe80::fc6f:3131:dda1:fee5]) by DM8PR11MB5686.namprd11.prod.outlook.com
 ([fe80::fc6f:3131:dda1:fee5%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 08:17:26 +0000
From: "Tahvanainen, Jari" <jari.tahvanainen@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, "Jadav,
 Raag" <raag.jadav@intel.com>, "Anirban, Sk" <sk.anirban@intel.com>,
 "Konieczny, Kamil" <kamil.konieczny@intel.com>, "Piecielska, Katarzyna"
 <katarzyna.piecielska@intel.com>, "Girotra, Himanshu"
 <himanshu.girotra@intel.com>, "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_survivability: Update category and
 mega feature
Thread-Topic: [PATCH i-g-t] tests/intel/xe_survivability: Update category and
 mega feature
Thread-Index: AQHc0ksWIDSXoheCqUS6NbKpVwZma7X/KfPw
Date: Tue, 5 May 2026 08:17:26 +0000
Message-ID: <DM8PR11MB56867CC5FDE085636E92577B983E2@DM8PR11MB5686.namprd11.prod.outlook.com>
References: <20260422113403.843322-1-karthik.poosa@intel.com>
In-Reply-To: <20260422113403.843322-1-karthik.poosa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5686:EE_|IA1PR11MB7197:EE_
x-ms-office365-filtering-correlation-id: f78f07d6-cb3e-4616-6946-08deaa7ebe41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: a8Q5+W/fGslxkE7z+03QIbAh0XHtKEGmCLBZa2im3a452waXp7taXjWObb+inTmP38RZj6agwoa1WsBd0bjbhJqgjL5OxbQAcguhnaRt0Rw3iovYitao61EaI9UV9hHfP40GZ4yJp1MfEDLHxr/hMq13vfuzhW4LOJdPCz31HcF/3rx5/AmC67rddExPS2rPHE+Pm4JYYGOw6VPeRCM3IJvq/uMVApjUWEtyJQnz4tsblvtvG9i1C6s9uAq67APkv4TsS3uqo0/05IlFK8co1qh8eThO0FwANzSR4HZ7+O8SceabzdUx8MtFir37XvjlpyyrpBm+Cua6kmwiMYTQ25K5IUz3kOuLUzGTSIg0eWPd1nnaOx/YQcBq3JFK7IT8XRwQ9voTlSez3i/qEATvJGZHCgEl0QiZULy9yBc4rC2J1SoliTXf7alDqIddND2HGY77HNmeNDs4VsWdYa9s0Og3lGNh1tMo8t/99g/rwPhWXIx+yDqNkhpStuGHuT/DMkGoOX+3UKlAiuEbQsHuMDW9WI1ATeMNur8FNQMHMJ3/GRZALFojrhKjWcNuVsDdx8iiGUprFtrPMAd31F7zleZwynxtHFHYCGD6TPEDArdQ5dJNqEynRns6cmnbreTBWARzxGl1KdjXWtYz40MneUNLGLsZ2ULaJGtlFhnSyDDFnvUjGZwQH3G+IwbvEgZrNKhcu12dDPkZHQHps3J6yYJuCMo6ARKirswC8PfYZ67FN4htMroKAhloHuAw5idi
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5686.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3VUb1BWVER5Vzdxbzl5dnI3dW5sQVFEdW5jQ01sQnRnTFNtNGEvdHFtbFNU?=
 =?utf-8?B?SDV6WVYxRkNnNU5iRk40MzFRdUVqeTJpU2JjbXBudDZ2SnNxbXEwQmtxNGN2?=
 =?utf-8?B?N0RncHhuS1A2Q1hyTGJXRmNLaWVpdjJkVTVWZ01BdTNjQnBzUitKekV0aFZz?=
 =?utf-8?B?Z3IwRndZQlNJd1RLVE1Nc0ZKUWwvRUwzNEMwQjArY04yZmpyZ3phRE1NWW1S?=
 =?utf-8?B?SE1XcmhwcEMrbFU5MC9CbFR3Vk9aSkpUMmNqbFNNaHhwRktkdVVZSk1kR2Yy?=
 =?utf-8?B?MjQ5cjUrVTVVem1CdDdiOFdxWlY0MkFzNEhSK0tPUGZhdVNtVkVXS0h4UzE0?=
 =?utf-8?B?VFcyczZReHlrU2pMbDVYNDVhZ0dteE5XM3RGdmNGUjZhZWRJN0ZPZFloZG9j?=
 =?utf-8?B?Q0NyaDNqRDNFRTFiNEp2SmUzay9kWUxRRGdQZlBnNEdCcWxySkRQdFhST3lk?=
 =?utf-8?B?aDNra3VuZ0RCbmJwLzhvdE9RYUovNTBJb3ovQkhKTWhzQWJ2RTVuM09aVFd6?=
 =?utf-8?B?UmpaTS9SaEZ6Smdod0JDS05Yc2FsSmN4bkhMb3BEd282L3pCNEo3R3JyQ0dR?=
 =?utf-8?B?alB4NlF2S1ltOUkwWHZNUkRlK3JGTDNtejQzbHFoRXRkdWQyeFlnRFJtSW9N?=
 =?utf-8?B?cHBCVXFOcDdodDJUVmZkTEFoYkNzOVFVSVY2K3hSa3BNYTBJQ0pQNGp6ZnB4?=
 =?utf-8?B?eHV4bW01Y0grZFdBa0QwU1BWNWJzWWxBZDNtVmZxWFBaM2dZRUg5bC81blh6?=
 =?utf-8?B?NHozYWpZb3psTTEwaVJoZzh0NmtuQVZETFBDTXdGQ2hQS0JRWFJCYlh2c3J6?=
 =?utf-8?B?dTNKL2N4TnZoYXZLcDFUL0dCdVZSRXh2S2UyYXUxVGFuMXRtZ0ZIN2ZFS0tF?=
 =?utf-8?B?c1Q0cU1VSU9xVnpGZGhMQU9jM0NremVTTFkxQWJWTE16b2VJdmpoVDludjNY?=
 =?utf-8?B?Z080ZWh6SXIzM3Jjd244V1FkeS9veE9hdnJ4dDV4Q28rMTNValAwRURuNVRk?=
 =?utf-8?B?NWF0TFJqVlV3OUM5aisrWnpqZFgyYjViRzdZUnVrVWxzQ256MWhRTk5ZRHJq?=
 =?utf-8?B?NUN3S3RjQlBWVjQyallyR3dnbklEWEU0d0YzUVBWeUI5aFJZZkxnTFlhRzR5?=
 =?utf-8?B?N01RdnBxdVE0b2Q3cjd0ak1taFJWeFZBdktsMjdON2J0ekUrTGVTMW0zcmhL?=
 =?utf-8?B?a3Rkakg0ei9LejFUWHo0N2JxQ3F5NjlYYzhzTFRRY0ZPdXhPWFN3REhQaE9P?=
 =?utf-8?B?ZWxuTGFmTmQ1Zm5jZ3FMakRIbENaSjBPUk05Y3JLeFRNUDRIWmhLRmZwV2VV?=
 =?utf-8?B?UnNTUEExUHZlaFgyVXRoVk5yOVhQSXlMVU85L2RUWTJOaEFVczdPZElEOHNP?=
 =?utf-8?B?WFNkd1JkcForQVZ6YjhXaTlRUnNSSzdFcU5GaGRqaVNVcUlaOU4ybnU4K3pp?=
 =?utf-8?B?aXIyRnhzR0M0WnBpSU1YcGdpbEZOUjRVQ3BITnJEMTY1a2V6SjJMSWRIK3B5?=
 =?utf-8?B?WU5ad0MvZ3h4ZjM2Z212Sytjd2hsUm9RZlJWdFQ2Y1kxUkt3c2hRQ2hzZThv?=
 =?utf-8?B?MjNRTHNaN1JkYXZRQ21uOEVXbURzbitURkxtUTNTRmdNTFdSNFhXMHRCL29Q?=
 =?utf-8?B?ZWFhbm1xZlRiOVJoRG5ub242Z3pLYUNjeDFpODR4VFNSb1B0OUo1VlBhK2RF?=
 =?utf-8?B?L3htU2pLYjduTFlCSTh3elRvK3hOQnY3WG5OdEMxZGpra3RlK1U2d1d0Mkt6?=
 =?utf-8?B?OW9YMEVlVnQrZ3pHRWNLdzhQRkkvdTZVZWdxcWJ1MWJhMmVTMElITk1yTytv?=
 =?utf-8?B?YlFsdXJ1VnJkL3NyK0NMNmN3NXRKL0thTXNRakk0bGFwL3VMZjYwZEZaU0lB?=
 =?utf-8?B?THYrSi9iNGx5N0dOWkwzWVhNTWdLNFZGVEJWVHIvUmsvYWdxbHlNOUF2Nkcz?=
 =?utf-8?B?bUIwSEVCZDZDS2cxR3JiSHRIbDBGajF4ZjIwT3pZZjdaa29zZkh1dTF3TFUv?=
 =?utf-8?B?d1B6a3drQnEvVWxPUE03SjNGOENkc0lWcEVRdnIzdkY1SEtmMlRpY0dZOVNU?=
 =?utf-8?B?K2Q4Yk9pTTZoNjhCekNWanVTVXF0SDl4TnZ2Njg5NUNaek5JdU9acDFPbmh1?=
 =?utf-8?B?bmpFRS9NMVdlUWZiRC9LeUM1OWFQZXg3MTR6bWovRjNjMitseXlMck9LbE1J?=
 =?utf-8?B?T25aVThUdGJ6RVc4NVgxY293b0RsemtKQVFWZnhablg2akRxb1RVTkhFVkZl?=
 =?utf-8?B?b1kxSFFmV3pSTWFQcFBsQkc1NXJHWHJ6RzlEVitBWGJZRXp3VTh4YzEwL3BW?=
 =?utf-8?B?UVdyYVhSc09mZDd6WStncENiZmZxdzMzN01sNC9rQWpjZDZpNEphZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: VhJoDt+POcugKVdEvkFATyEXSgtPXo+33zj3s80HWtjwJLkfDPCrwvDpnBZpEJSgesg5pB8SRvYOqBQZr+sBR+QUJHAEsv6WmxETMK8aJtHxCAryA+YFHf3m+rITath3lCcip+f58s+yYPyuCI1tCAZfGGD3J01JM9ouW2220ReM2IsFoGlQ1nRVaJjLFq5NEGZti0Gvsj1El0/YGkRnJTYX55gyupyZ/EwnqTGLq10BQA2XzxwtLdkRrtP2UnlQDehXvPPJifq5jISFuf0IrBD/UmxO9a6U87tCoCBQo/Ee6SFxdOeABOesNUv81WfYR+/XecxZl4OdZwSeIbgT2A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5686.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f78f07d6-cb3e-4616-6946-08deaa7ebe41
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2026 08:17:26.6673 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MdWlCN2zndqMi/zdRvG9R1jKw0eU6OXf4AEIWzDba594GSI2aXnz2WLE0TuAyRLNd03vEGKLmP7qYH6YoQdz3Mzg4uKUuUZf3rFlcLJTdOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7197
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQb29zYSwgS2FydGhpayA8a2Fy
dGhpay5wb29zYUBpbnRlbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgQXByaWwgMjIsIDIwMjYg
MjozNCBQTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEd1cHRh
LCBBbnNodW1hbiA8YW5zaHVtYW4uZ3VwdGFAaW50ZWwuY29tPjsgTmlsYXdhciwgQmFkYWwNCj4g
PGJhZGFsLm5pbGF3YXJAaW50ZWwuY29tPjsgVGF1cm8sIFJpYW5hIDxyaWFuYS50YXVyb0BpbnRl
bC5jb20+OyBKYWRhdiwNCj4gUmFhZyA8cmFhZy5qYWRhdkBpbnRlbC5jb20+OyBUYWh2YW5haW5l
biwgSmFyaQ0KPiA8amFyaS50YWh2YW5haW5lbkBpbnRlbC5jb20+OyBBbmlyYmFuLCBTayA8c2su
YW5pcmJhbkBpbnRlbC5jb20+Ow0KPiBLb25pZWN6bnksIEthbWlsIDxrYW1pbC5rb25pZWN6bnlA
aW50ZWwuY29tPjsgUGllY2llbHNrYSwgS2F0YXJ6eW5hDQo+IDxrYXRhcnp5bmEucGllY2llbHNr
YUBpbnRlbC5jb20+OyBHaXJvdHJhLCBIaW1hbnNodQ0KPiA8aGltYW5zaHUuZ2lyb3RyYUBpbnRl
bC5jb20+OyBHYW5kaSwgUmFtYWRldmkNCj4gPHJhbWFkZXZpLmdhbmRpQGludGVsLmNvbT47IFBv
b3NhLCBLYXJ0aGlrIDxrYXJ0aGlrLnBvb3NhQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENI
IGktZy10XSB0ZXN0cy9pbnRlbC94ZV9zdXJ2aXZhYmlsaXR5OiBVcGRhdGUgY2F0ZWdvcnkgYW5k
IG1lZ2ENCj4gZmVhdHVyZQ0KPiANCj4gVXBkYXRlIGNhdGVnb3J5IGFuZCBtZWdhIGZlYXR1cmUg
b2YgeGVfc3Vydml2YWJpbGl0eSBzYW1lIGFzIHhlX3BtdSBmb3INCj4gcHJvcGVyIHRyYWNraW5n
IGluIGludGVybmFsIHZpc3VhbGl6YXRpb24gdG9vbHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBL
YXJ0aGlrIFBvb3NhIDxrYXJ0aGlrLnBvb3NhQGludGVsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9p
bnRlbC94ZV9zdXJ2aXZhYmlsaXR5LmMgfCA0ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50
ZWwveGVfc3Vydml2YWJpbGl0eS5jIGIvdGVzdHMvaW50ZWwveGVfc3Vydml2YWJpbGl0eS5jIGlu
ZGV4DQo+IGU4NDJhNzZlYy4uZDVkN2UwNDhjIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC94
ZV9zdXJ2aXZhYmlsaXR5LmMNCj4gKysrIGIvdGVzdHMvaW50ZWwveGVfc3Vydml2YWJpbGl0eS5j
DQo+IEBAIC0yMyw4ICsyMyw4IEBADQo+IA0KPiAgLyoqDQo+ICAgKiBURVNUOiBDb21wcmVoZW5z
aXZlIHN1cnZpdmFiaWxpdHkgbW9kZSB0ZXN0aW5nDQo+IC0gKiBDYXRlZ29yeTogQ29yZQ0KPiAt
ICogTWVnYSBmZWF0dXJlOiBHZW5lcmFsIENvcmUgZmVhdHVyZXMNCj4gKyAqIENhdGVnb3J5OiBN
ZXRyaWNzDQo+ICsgKiBNZWdhIGZlYXR1cmU6IFBlcmZvcm1hbmNlIE1vbml0b3JpbmcgVW5pdA0K
DQpMb29rcyBnb29kLg0KDQpSZXZpZXdlZC1ieTogSmFyaSBUYWh2YW5haW5lbiA8amFyaS50YWh2
YW5haW5lbkBpbnRlbC5jb20+DQoNCkJyLA0KSmFyaQ0KDQo+ICAgKiBTdWItY2F0ZWdvcnk6IFRl
bGVtZXRyeQ0KPiAgICogRnVuY3Rpb25hbGl0eTogc3Vydml2YWJpbGl0eSBtb2RlDQo+ICAgKiBE
ZXNjcmlwdGlvbjogVmFsaWRhdGUgc3Vydml2YWJpbGl0eSBtb2RlIGZ1bmN0aW9uYWxpdHkNCj4g
LS0NCj4gMi4yNS4xDQoNCg==
