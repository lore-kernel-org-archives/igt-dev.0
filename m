Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D9FEFCE20
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 17:36:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2DE10E125;
	Wed,  4 Mar 2026 17:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HXExnUPZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4FD10E125
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 17:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772645767; x=1804181767;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HavM8em0bQcflNOzNGUinE3npQPU+PeqGM37iPsUfss=;
 b=HXExnUPZjIytQQmsdAMgs5cFRfKQvQwr5RE0iqq0JtGyUl+1SrqYt+yM
 lUa8HR7JOIWRbg6Lfrwx3sRREIXv9EEXRb3Ealo3FJyCkruzGpiA0R2oi
 iW5NeVqlDebl1U/HiKDkKOfUmH7hvrtAXIHjG2w1/nkSxdRzZ6X0YQDBw
 abawh4HvMB44ZZxEsI4wPrEY4Zam7w9dnSok8cHo07Hf7kJcGtKXy0NGh
 2Uh89veVCUWv5t3aT8m4kXdbUGQUpDXf6lpVVzgbFK8LPfPky8Tp7wKj4
 RmpC7HTo4un54Pw40/TP/jEuSyzHambigVivlJSETfaQWYQBiPSku3ScW A==;
X-CSE-ConnectionGUID: 7+rZx3BcShqpTeI/Fgdsyg==
X-CSE-MsgGUID: iqwM0gQBRRa4+gZ4P4Z0SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="96330526"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="96330526"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 09:36:07 -0800
X-CSE-ConnectionGUID: LshOApU/QiKsLVIaV6LyGA==
X-CSE-MsgGUID: XmfccyQ2TQirBabogHZHlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="218385117"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 09:36:06 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 09:36:06 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 09:36:06 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 09:36:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UCrcJXUf7Gh1rAfhmvH3AQznavmGTwmra5hqCtfA4UOABV9+fiJfDTLhzTWtQFWXklcsceHuXjD6LDj9/QwL8Y7picgI+Kw/+tpoxphfS0vz+XkDsUZYtArwCLwArqInEO6aBsXm2xng7pGUHcd3HKZTvq0Ods/WhzWrnLuWvlzAQTiVdDDdEAbmO+pNx6w7TZmiLW5lQroZIwhsz6fKqiJXq9+1KCWm19RfTzTega25d9ok++0corRfMtVnUXYyEUYI038ykfj2F+xJ75e3Btmzgj1V2OK6b+esg9+Aj9spxITkn5Vw7di67/31LA+hD3NtZD6S1uZMrDMOQJbFhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HavM8em0bQcflNOzNGUinE3npQPU+PeqGM37iPsUfss=;
 b=rrs5n1G30/DbkqWZfJAopxQS0TjTX3/ptRDWezvmVzthSQoQ1lbTv9XmpU0cx8aam1SaRuhz88etUSBNtcsRx419hTIk+ylKmueojgkvhNWunDcHCnYhUsncU2vehb1YQG+p6bx9foBLfqqLW8kWUygOs0cYrbnvkjvmBFPVv4LKBh4X5kQZQt9plsz6+FxrPZY8p10m44HjDpsFcQ7ZLkCBE4GltSA/bM4WyShL9iAmhVWTlqAsGwO8XxOX4waLoljHIsEbRZjx4lZNEoVDOM8s29xM745SGli+ipJyEnARt/0y2FXOIJdSB8gzkI3mjgGDd20AAlRH6/Hmpy+icg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6034.namprd11.prod.outlook.com (2603:10b6:208:375::17)
 by IA1PR11MB6443.namprd11.prod.outlook.com (2603:10b6:208:3a8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 17:36:03 +0000
Received: from MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73]) by MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 17:36:03 +0000
From: "Bilal, Mohammed" <mohammed.bilal@intel.com>
To: "Brzezinka, Sebastian" <sebastian.brzezinka@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>, "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH v1 2/2] tests/chamelium/audio: Fix resource leaks on
 assertion failure
Thread-Topic: [PATCH v1 2/2] tests/chamelium/audio: Fix resource leaks on
 assertion failure
Thread-Index: AQHcq77oQ9wmfaJtPkGy/My5uo9e8bWeSn4AgABU/eA=
Date: Wed, 4 Mar 2026 17:36:03 +0000
Message-ID: <MN0PR11MB6034981ADB323C63FA05AE15817CA@MN0PR11MB6034.namprd11.prod.outlook.com>
References: <20260304100553.3075443-1-mohammed.bilal@intel.com>
 <20260304100553.3075443-3-mohammed.bilal@intel.com>
 <DGTZQ1600RUK.2AL8PWUD7IHL9@intel.com>
In-Reply-To: <DGTZQ1600RUK.2AL8PWUD7IHL9@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6034:EE_|IA1PR11MB6443:EE_
x-ms-office365-filtering-correlation-id: f19ba11f-c0b2-4151-1d08-08de7a1481fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|38070700021; 
x-microsoft-antispam-message-info: RxVHNHDUaCjNJmUiqnc3C4z4ve/tvf8Uk4KIGG50efIlZb2llKL9aRvm3K349h1jHZ+tGMfIcC8eE7Q3o0qQUHvpMm3mSlQSBZzdVfmFX1F0B/cmRTzAm8dPPRpwcs73NK4PVS97JgjKGene+u1ZyPP1LQ7kgBX6uGPIf1V43TIk3OIIvPnkeOvecjmgYnC6WUIKWiFPDtqpleie+wa2VWnxDVQ8mLJz080RafW26ZeeqSDDVhiVwRwDelgbGCXS7qc4F6LTvUgblJGiZKkHUBRNEisgnbLcMAvviX2SM3vjS7hvqlkfxC65wrJK1AHGxbtkVb90kBZEQnUyOkHiP4i2obWECjNsn/EpDrQiOXEtizbHoJ6TXALWDJBQUtcnp9bOfbQLKPPew+5CMwlV4+jDoYRnPkugTjBuspBYvHcWo0iX6a5m67/cFgVAj1xH1nff6jHfMldnv4jwPcVMUjKW5hekB50tkMFbK72gaiT0eP8LSfv7J67Rah6b8gp2XJCsmdsTjufHkpmoOsumpNnqLbi70hVKUG9phqO7Bii46t7cHIKnABYZGPQ5K2ye9V+mGVB6jpoX0fuCz58HTrTfNfv6JwC/vd8HJ17TWbCfc1N6KNeg+GRwKAQXezF+n/a/RrDj2izsi63US6lr+Et4InSla/ZWGh1q+686slINA71G5fKm5dN4OUSDIrcHaC0NhEonY4lcKSSrahi69S+KLhpFE2pT72HGFSCvr7okyr0fdVUvf9Iv1+H6/ZiApQFAbUFzJ9wDX/A1TSP8on2AbHou87/5c/FNjkAA7h8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6034.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWo0dTd0d0V3SVp5QWp5UTZ6dHZBazhSQ1gzUVlvano0Nk9sZ21qQkNVVVJJ?=
 =?utf-8?B?bTJBOFliNTY4T2NMdUpnQnNGN0NpQmVIL0FOalpEeUd5Vzc5V3o4bUVwdE0y?=
 =?utf-8?B?M2tPak51eFJraTg0MFJIWUhJS0NZQjdXaUtpL0VUa3pNazJqNGZFOGVCZG5O?=
 =?utf-8?B?ajlsbnRGSUcvTDJtTlFLVmRrWnh0ZjdjNFpPK0NxdlErcnVyWHNOaDdhQ1ZD?=
 =?utf-8?B?ODZaQnM4VllJMFpKNS9oNnhmZFlwWHc2blpVcUZEM1Nkc0dVYndRY0M4SmlC?=
 =?utf-8?B?aUp6RWVadmx3ams5QUhOSmYvZW5xMHM0Ky8vdmZPaGs0SDBLMnZ2MzZWa1gr?=
 =?utf-8?B?ejdwWjA2S2NJNTI0MVY5czdqTlUzZ0x3TTB1QU5RSjBRREVXanJjRUs0K2Z6?=
 =?utf-8?B?SFpjRTNDK3J1YXFYbnY2N2x2Ui9kM2tSWk42RmdDUkVLTFlnUTV6UUJMQjJi?=
 =?utf-8?B?cWEyOThtS2lwY3VFZFAzR3lVbXVzVGdkN28vQlBmNzRhdElFczcrRkFFdGpL?=
 =?utf-8?B?cUZUeVdRKzJ5bVh2dFhkMnBOS0FtUytON1RQeVRJdnF2NXdFNnF1WjN6SWx2?=
 =?utf-8?B?MXdtODlnak1LZWtXTEtmWlVCRGtjU2VZNjhzSEp3elRQSUMwSTdOV0tZaERN?=
 =?utf-8?B?MkJ5N3MwajI5d2pxVGdFT2RwRHBrZldXc2NjL0I4TG5tVGlLVGV0MVJqL1NH?=
 =?utf-8?B?STEyMmw0T1EyQ25XcWlLY29yS0tjaktsUmE2dUFSVXZiS1dRbmQ1aGhSWUhr?=
 =?utf-8?B?M3dndTRTM29id1dUZlBXYzVnVlZyY2hyMTNYNlp1aWk4OWtZQTQ5WWdwK0hk?=
 =?utf-8?B?Qm40MTc1SDVuMU83OGtRaU5pQ1ptMWQySXFYb2RMdnIwWXhJRjJjYWdDQit0?=
 =?utf-8?B?b2I5ZTNLY0pNdzVEejBNNkQ1aHlUUVRqaHhhMmg3d2RKV1ZYSUoxOWpLOStE?=
 =?utf-8?B?b3BrNkh3T2pZeCtyM0ZKVFE3L0pWKzZOMUNyK2IvaHJ5NlZyRnRzc2llcnlU?=
 =?utf-8?B?YnNRRUhwSnZaWDN3NTRvSTJyRXU3T0pxK3cvb1IrY0RXV2dEN3Nqb3Q0SEFU?=
 =?utf-8?B?UVRzRm42aExmOUtKb0xmaEc0cFQ2akNaN0xmTm41Y0R0d3BxNUJuclhCbWp6?=
 =?utf-8?B?U2JSQ0ZYT3F6YTl5aEVtM1ZUSXJsOUpDNFAvcVhvQmdDazlpQWM1NGNQVDVY?=
 =?utf-8?B?TG5yclpMY2s1WE9sU3FwaG41a2RrRHNPZHRxTVVwUFp2RTJXWWN6TEpwN2t2?=
 =?utf-8?B?WDRjM1VCc0Z3RnFYME8xRElrUGxMTkRQOU9RWTE3UXlQM3N6ZkkyQm01aExQ?=
 =?utf-8?B?NzZHZG5NVk90Z29JOHJ6WXQ5TnVoUndkTVN4U2p5OUMwR05CdVZoalp3ZUpH?=
 =?utf-8?B?RmhlbjJEbU5uK3N3M0dzbXJvUHdpTDI5RnBEK0xPQy9oVkdIci9tc21XT3Z5?=
 =?utf-8?B?UnBMemNUaUUrS084VUJrT2R6UGNKazg4TStySkpmSlRCV0Q0OTJZdHExMnFY?=
 =?utf-8?B?dmQxQWJqOGs2VmIzUnBMY2c4a0N3ZFNjV1JQSFV3VG90czJjY1YzT05SdDF2?=
 =?utf-8?B?Y1JYU0lNZ2Q3Z3IwQy8zUjBnbGZESlRCYVZjZVpqQmp4OHk5dDRQV2NSd0R0?=
 =?utf-8?B?emNOcmFHaHJzODh4SjRuZUJrUEphL0taOXVhNlhHZDZ6aXVsSWZzWHQ1M0ZD?=
 =?utf-8?B?U2VVcWFhajhHTGpBanNaOEZic1VJL3Z3ejRST3FHblRKQUtPVms1Yng3ZnIx?=
 =?utf-8?B?Ukp6aWJQNEIxQ21MdXVlRUVwUHFRMDNGaHVlZ01iWDJ1QytyZFREdUFWT3Zr?=
 =?utf-8?B?bVJzdkdjUzdGL1d3a2pxRHpNL0toK29FZjR1OWNkK2x2VVNyaENIYUplNHg1?=
 =?utf-8?B?bXVESFNkMEpsM1FGZnJadGs0cU5aclNvU3FKaWpyN21WeEZBcTg1MG5xRE9X?=
 =?utf-8?B?YXZ1Ykl4RTl3UUZrSnlPTU03S1YyR3Z1dkYzb2w5Rnd0Sm5wT0UremlMZDhI?=
 =?utf-8?B?TzUxK1BxZVdvRE1yNXE2UHJGdzM3K25EN0hZYUVESVpybEZxdGczT25HZnhk?=
 =?utf-8?B?a3RLSG5nQVVzcjZrQWJQUlNsR3oyRnpObmVqa09tajZWVzVWVW5xaC94R2Z4?=
 =?utf-8?B?VlcrME1tWTIwOGFYNHpUd0VKajVlUmdneWlvQ2RZUk9hejlST1o2SDJvS3pB?=
 =?utf-8?B?NitTa2ZrbzJqVTh6aCt6UjhxcURaMnFRRlYySEJKY0NEYVFrejFtYnpvWFJv?=
 =?utf-8?B?ZUpienVEQ3lPQnIxWEs5RlNrbDZ0SGlpU2QrQ3NGYlEyMnlBRFhxcWw4VTRH?=
 =?utf-8?B?RE9aZzUwcklWRmdCdjQvbzVjTnFSUks2UEU4bEZRVlA2Y0laSTB5UU1waE9l?=
 =?utf-8?Q?LDdj13nSx+0Da74SJcv8bdwHv6Y6OoIjYNz8az+7JSx7P?=
x-ms-exchange-antispam-messagedata-1: YahN+hqsdgaPWg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6034.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f19ba11f-c0b2-4151-1d08-08de7a1481fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 17:36:03.1026 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2ODbznqxTLls6jMxEOVzzBPMM5UOwpGreQQiwG+5gwo+VQQ/UXrMw0VkHSxHseyJe2H2O0PfdCfbnmRHoyvZDjmwZyfGJmxclGJrBRfWot4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6443
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

SGkgU2ViYXN0aWVuICwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBC
cnplemlua2EsIFNlYmFzdGlhbiA8c2ViYXN0aWFuLmJyemV6aW5rYUBpbnRlbC5jb20+DQo+IFNl
bnQ6IDA0IE1hcmNoIDIwMjYgMTc6NDgNCj4gVG86IEJpbGFsLCBNb2hhbW1lZCA8bW9oYW1tZWQu
YmlsYWxAaW50ZWwuY29tPjsgaWd0LQ0KPiBkZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENj
OiBCLCBKZWV2YW4gPGplZXZhbi5iQGludGVsLmNvbT47IEpvc2hpLCBLdW5hbDEgPGt1bmFsMS5q
b3NoaUBpbnRlbC5jb20+Ow0KPiBCcnplemlua2EsIFNlYmFzdGlhbiA8c2ViYXN0aWFuLmJyemV6
aW5rYUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEgMi8yXSB0ZXN0cy9jaGFt
ZWxpdW0vYXVkaW86IEZpeCByZXNvdXJjZSBsZWFrcyBvbg0KPiBhc3NlcnRpb24gZmFpbHVyZQ0K
PiANCj4gT24gV2VkIE1hciA0LCAyMDI2IGF0IDExOjA1IEFNIENFVCwgTW9oYW1tZWQgQmlsYWwg
d3JvdGU6DQo+ID4gRmF0YWwgYXNzZXJ0aW9ucyBjYW4gYnlwYXNzIGNsZWFudXAgcGF0aHMsIGNh
dXNpbmcgcmVzb3VyY2VzIHRvIHJlbWFpbg0KPiA+IHVucmVsZWFzZWQgd2hlbiBmYWlsdXJlcyBv
Y2N1ciBkdXJpbmcgYXVkaW8gdGVzdHMuDQo+ID4NCj4gPiBSZXBsYWNlIGZhdGFsIGFzc2VydGlv
bnMgd2l0aCBub24tZmF0YWwgY2hlY2tzIGFuZCByb3V0ZSBmYWlsdXJlcw0KPiA+IHRocm91Z2gg
YSBjb21tb24gY2xlYW51cCBwYXRoIHRvIGVuc3VyZSBwcm9wZXIgY2xlYW51cC4NCj4gPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IE1vaGFtbWVkIEJpbGFsIDxtb2hhbW1lZC5iaWxhbEBpbnRlbC5jb20+
DQo+ID4gLS0tDQo+ID4gIHRlc3RzL2NoYW1lbGl1bS9rbXNfY2hhbWVsaXVtX2F1ZGlvLmMgfCA0
Mw0KPiA+ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MzMgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
dGVzdHMvY2hhbWVsaXVtL2ttc19jaGFtZWxpdW1fYXVkaW8uYw0KPiA+IGIvdGVzdHMvY2hhbWVs
aXVtL2ttc19jaGFtZWxpdW1fYXVkaW8uYw0KPiA+IGluZGV4IDI5NjdlM2M1MC4uNDFjYmU5MmQ5
IDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2NoYW1lbGl1bS9rbXNfY2hhbWVsaXVtX2F1ZGlvLmMN
Cj4gPiArKysgYi90ZXN0cy9jaGFtZWxpdW0va21zX2NoYW1lbGl1bV9hdWRpby5jDQo+ID4gQEAg
LTQyNiw5ICs0MjYsMjEgQEAgc3RhdGljIGJvb2wgdGVzdF9hdWRpb19mcmVxdWVuY2llcyhzdHJ1
Y3QNCj4gPiBhdWRpb19zdGF0ZSAqc3RhdGUpDQo+ID4NCj4gPiAgCWF1ZGlvX3N0YXRlX3N0YXJ0
KHN0YXRlLCAiZnJlcXVlbmNpZXMiKTsNCj4gPg0KPiA+IC0JaWd0X2Fzc2VydF9mKHN0YXRlLT5j
YXB0dXJlLnJhdGUgPT0gc3RhdGUtPnBsYXliYWNrLnJhdGUsDQo+ID4gLQkJICAgICAiQ2FwdHVy
ZSByYXRlICglZEh6KSBkb2Vzbid0IG1hdGNoIHBsYXliYWNrIHJhdGUgKCVkSHopXG4iLA0KPiA+
IC0JCSAgICAgc3RhdGUtPmNhcHR1cmUucmF0ZSwgc3RhdGUtPnBsYXliYWNrLnJhdGUpOw0KPiA+
ICsJLyogSW5pdGlhbGl6ZSBoZWFwIHBvaW50ZXJzIHRvIE5VTEwgc28gdGhlIGNsZWFudXAgcGF0
aCBjYW4gc2FmZWx5DQo+ID4gKwkgKiBmcmVlIHRoZW0gcmVnYXJkbGVzcyBvZiB3aGVyZSBhbiBl
cnJvciBvY2N1cnMuDQo+ID4gKwkgKi8NCj4gPiArCWNoYW5uZWwgPSBOVUxMOw0KPiA+ICsJYnVm
ID0gTlVMTDsNCj4gPiArCXJlY3YgPSBOVUxMOw0KPiA+ICsJcmVjdl9sZW4gPSAwOw0KPiA+ICsJ
c3VjY2VzcyA9IGZhbHNlOw0KPiBJdCBmZWVscyBhIGJpdCBtZXNzeSB0byBhc3NpZ24gTlVMTCBo
ZXJlLCBpdCdzIGNsZWFuZXIgYXQgZGVjbGFyYXRpb24uIFBsdXMsIHdlIGRvbid0DQo+IHJlYWxs
eSBuZWVkIHRoZSBnb3RvIGxvZ2ljIGZvciBhbiBpbnB1dCBjaGVjaywgdGhlIG9yaWdpbmFsIGFz
c2VydCB3YXMgZW5vdWdoIHNpbmNlDQo+IGl0J3MganVzdCB2ZXJpZnlpbmcgdGhlIGZ1bmN0aW9u
J3MgcGFyYW1ldGVycy4gSWRlYWxseSwgdGhpcyB3aG9sZSBibG9jayBzaG91bGQgYmUNCj4gbW92
ZWQgdG8gdGhlIGJlZ2lubmluZyBvZiB0aGUgZnVuY3Rpb24sIGJlZm9yZSBhbnkgaW5pdC4NCj4g
DQoNClRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24gb24gbW92aW5nIE5VTEwgaW5pdHMgdG8gZGVj
bGFyYXRpb25zIC4gSSB3aWxsIGFkZHJlc3MgdGhhdCBpbiB2Mi4NCg0KUmVnYXJkaW5nIHRoZSBj
YXB0dXJlIHJhdGUgY2hlY2sgd2UgY2FuJ3QgbW92ZSBpdCBiZWZvcmUgYXVkaW9fc3RhdGVfc3Rh
cnQoKSBiZWNhdXNlIHRoZSBjYXB0dXJlIHJhdGUgaXMgb25seSBhdmFpbGFibGUgYWZ0ZXIgYXVk
aW8gcGxheWJhY2sgYmVnaW5zLiBUaGVyZSdzIGV2ZW4gYSBjb21tZW50IGluIGF1ZGlvX3N0YXRl
X3N0YXJ0KCkgIHJlZ2FyZGluZyB0aGlzIC4NCg0KQnkgdGhlIHRpbWUgd2UgY2FuIGNoZWNrIHRo
ZSByYXRlLCBhdWRpb19zdGF0ZV9zdGFydCgpIGhhcyBhbHJlYWR5IGxhdW5jaGVkIGEgcHRocmVh
ZCBhbmQgc3RhcnRlZCB0aGUgY2hhbWVsaXVtIHN0cmVhbS9jYXB0dXJlLiBJZiB3ZSB1c2UgaWd0
X2Fzc2VydF9mIGhlcmUgYW5kIGl0IGZhaWxzLCBzaWdsb25nam1wIHdpbGwgc2tpcCBhdWRpb19z
dGF0ZV9zdG9wKCkgIGxlYXZpbmcgdGhlIHB0aHJlYWQgcnVubmluZyBhbmQgdGhlIHN0cmVhbS9j
YXB0dXJlIGFjdGl2ZS4gVGhhdCdzIHRoZSBleGFjdCByZXNvdXJjZSBsZWFrIHRoaXMgcGF0Y2gg
aXMgZml4aW5nLg0KDQo+ID4gKw0KPiA+ICsJaWYgKHN0YXRlLT5jYXB0dXJlLnJhdGUgIT0gc3Rh
dGUtPnBsYXliYWNrLnJhdGUpIHsNCj4gPiArCQlpZ3RfY3JpdGljYWwoIkNhcHR1cmUgcmF0ZSAo
JWRIeikgZG9lc24ndCBtYXRjaCBwbGF5YmFjayAiDQo+ID4gKwkJCSAgICAgInJhdGUgKCVkSHop
XG4iLA0KPiA+ICsJCQkgICAgIHN0YXRlLT5jYXB0dXJlLnJhdGUsIHN0YXRlLT5wbGF5YmFjay5y
YXRlKTsNCj4gPiArCQlnb3RvIG91dDsNCj4gPiArCX0NCj4gPg0KPiA+ICAJLyogTmVlZHMgdG8g
YmUgYSBtdWx0aXBsZSBvZiAxMjgsIGJlY2F1c2UgdGhhdCdzIHRoZSBudW1iZXIgb2Ygc2FtcGxl
cw0KPiA+ICAJICogd2UgZ2V0IHBlciBjaGFubmVsIGVhY2ggdGltZSB3ZSByZWNlaXZlIGFuIGF1
ZGlvIHBhZ2UgZnJvbSB0aGUgQEANCj4gPiAtNDQ3LDEwICs0NTksNiBAQCBzdGF0aWMgYm9vbCB0
ZXN0X2F1ZGlvX2ZyZXF1ZW5jaWVzKHN0cnVjdCBhdWRpb19zdGF0ZQ0KPiAqc3RhdGUpDQo+ID4g
IAlidWYgPSBtYWxsb2Moc2l6ZW9mKGludDMyX3QpICogYnVmX2NhcCk7DQo+ID4gIAlidWZfbGVu
ID0gMDsNCj4gPg0KPiA+IC0JcmVjdiA9IE5VTEw7DQo+ID4gLQlyZWN2X2xlbiA9IDA7DQo+ID4g
LQ0KPiA+IC0Jc3VjY2VzcyA9IGZhbHNlOw0KPiA+ICAJc3RyZWFrID0gMDsNCj4gPiAgCXdoaWxl
ICghc3VjY2VzcyAmJiBzdGF0ZS0+bXNlYyA8IEFVRElPX1RJTUVPVVQpIHsNCj4gPiAgCQlhdWRp
b19zdGF0ZV9yZWNlaXZlKHN0YXRlLCAmcmVjdiwgJnJlY3ZfbGVuKTsgQEAgLTQ2MCwxMw0KPiAr
NDY4LDIxIEBADQo+ID4gc3RhdGljIGJvb2wgdGVzdF9hdWRpb19mcmVxdWVuY2llcyhzdHJ1Y3Qg
YXVkaW9fc3RhdGUgKnN0YXRlKQ0KPiA+DQo+ID4gIAkJaWYgKGJ1Zl9sZW4gPCBidWZfY2FwKQ0K
PiA+ICAJCQljb250aW51ZTsNCj4gPiAtCQlpZ3RfYXNzZXJ0KGJ1Zl9sZW4gPT0gYnVmX2NhcCk7
DQo+ID4gKwkJaWYgKGJ1Zl9sZW4gIT0gYnVmX2NhcCkgew0KPiBJIHNlZSB3aHkgeW91J3JlIHVz
aW5nIGdvdG8gZm9yIHRoZSBjbGVhbnVwIHBhdGgsIGJ1dCBsZXQncyB0d2VhayB0aGUgY29uZGl0
aW9uIHNvDQo+IGl04oCZcyBlYXNpZXIgdG8gcmVhZCBhdCBhIGdsYW5jZSBiYXNpY2FsbHksIGZh
aWxpbmcgaWYgYnVmX2xlbiBleGNlZWRzIGJ1Zl9jYXAuIFdlDQo+IGNvdWxkIGFsc28gaGFuZGxl
IHRoaXMgYnkgY2hlY2tpbmcgdGhlIGRpdmlzaWJpbGl0eSBvZiByZWN2X2xlbiBhbmQgYnVmX2Nh
cCBpbnN0ZWFkLg0KPiANCg0KR29vZCBwb2ludCAuIEknbGwgY2hhbmdlIHRoaXMgdG8gYnVmX2xl
biA+IGJ1Zl9jYXAgaW4gdjIgdG8gbWFrZSB0aGUgb3ZlcmZsb3cgaW50ZW50IGV4cGxpY2l0LiBU
aGUgYnVmX2xlbiA8IGJ1Zl9jYXAgY2FzZSBpcyBhbHJlYWR5IGhhbmRsZWQgYnkgdGhlIGNvbnRp
bnVlIGFib3ZlLCBzbyBieSB0aGUgdGltZSB3ZSByZWFjaCB0aGlzIGNoZWNrIG9ubHkgb3ZlcmZs
b3cgaXMgcG9zc2libGUuDQoNCj4gLS0NCj4gQmVzdCByZWdhcmRzLA0KPiBTZWJhc3RpYW4NCg0K
VGhhbmtzICwNCk1vaGFtbWVkIEJpbGFsDQoNCg==
