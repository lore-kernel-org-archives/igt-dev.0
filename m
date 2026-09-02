Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D94C624D6
	for <igt-dev@archiver.kernel.org>; Wed,  2 Sep 2026 13:46:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2DC10F1FE;
	Wed,  2 Sep 2026 13:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ecmldgBP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81AC10F202;
 Wed,  2 Sep 2026 13:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788356747; x=1819892747;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=DkgLI2jUp5zJukJeRGHvRnN4A9n66Zl9WVUZmeZZaHI=;
 b=ecmldgBPzMUBm6lhB0Y19VVOLsdA3yZqj/8lSi6Bg1yADHoP1YSiy34H
 DLQ2PuwLlhUjDRslvWU5B8hJsJmvHKmKF8cwiffXtpzRtgAaTov6ikKAY
 27aS/jNlq8+BChtkWWbr52WxCQImnADvN+k8wWg0gfkDHZrtJ00OHZrBl
 A/hrNxEHwTcU2NtXMYtpgpLRo5+Nm79tx/cJdNRwDTliRHdOwbaKBKnQ4
 iI8eumLH5FB2blZxr/eGVI7GTvaaCpwO2W8OIOvD7zTW8gSND7fKP5RWG
 g0fcFW1yYy8VdL/PRgMnmyvm+LYkab3fm5BHFcwbmikBT3Zbl4tEnSJkP Q==;
X-CSE-ConnectionGUID: 7oXPpHcYSkuBUj9TXeXtwQ==
X-CSE-MsgGUID: l6gemLmHQIexdg0307TvHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="89025211"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="89025211"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 06:45:46 -0700
X-CSE-ConnectionGUID: BBegoGgJTv22S0vCJyIbrg==
X-CSE-MsgGUID: jZdVVZlzR0OGtKy4nH1DmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="274688983"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 06:45:46 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 06:45:45 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 06:45:45 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.31) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 06:45:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=daU7WNOLs9gOLQ9OVvK5LEqzlMWOgKdBLnGgbOVvTBWD9nRx3Zem6AdjFipc94P8z0mWI2IxUgwWRL7G7NI41y5SH477TL0eD+SBPSejbsPjERNarVrqHnn9XkQYtq8MmaRkN29hv2LT5tcX+aj+fPBc1/w4EnKIYI0DAOHeBtjAOlPCzEDzOxQcdnpLsdxhSe1pGMoiEq/BVCMBh1mBPpue0cATVJj2NSStuXzx4vYaTtcnI0fWdHwznaFCPAly2TMvlYxgJQ9Ay7DjoaPpgym7SKlA1DPfxI+m3Xp9GGgtKpKmgToVpRqdIIByxRxG4+4RQXkozG+fpKD0Om+LTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkgLI2jUp5zJukJeRGHvRnN4A9n66Zl9WVUZmeZZaHI=;
 b=NZn6WHD74SbhguWQYIyzrcBar1WUlKealfFgx+3gPXL6/htBsfU6LcobezWT67UvHIoPPBJHBzX1RK5owK4VhG2MWVfJ8DT6hhTvusOdd1WhS4HWh/C9dB+EkcgGUAk578Dz4ntQy3oMz8XT/uK3/ChhNuST7VpuWFNXhBKJUQLqEbN9A50hkD+/o9WnJlNgHh91cChg3kkFBEigGo32DEgU1yBL9bXgliHmpYPh+Vg5XdMjbLE2dt56nYGLb1yLWb9shpTi82xU4s7m3ukpN6z1BjJrF++7FMJfq8vR4P0VWlh2VkMhZNYymJQe43miC+P0bHLrTR8g8kleu+FQ/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9037.namprd11.prod.outlook.com (2603:10b6:208:580::14)
 by SJ5PPFEF71E136E.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::85f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 13:45:39 +0000
Received: from IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c]) by IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c%6]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 13:45:39 +0000
From: "Sharma, Nishit" <nishit.sharma@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "mailto:I915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>
Subject: =?utf-8?B?UmVjYWxsOiDinJcgaTkxNS5DSS5GdWxsOiBmYWlsdXJlIGZvciB0ZXN0cy9p?=
 =?utf-8?B?bnRlbC94ZV9zeXNmc19zY2hlZHVsZXI6IGZpeCBzYXZlL3Jlc3RvcmUgYXJy?=
 =?utf-8?Q?ay_indexing?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgdGVzdHMvaW50ZWwveGVf?=
 =?utf-8?B?c3lzZnNfc2NoZWR1bGVyOiBmaXggc2F2ZS9yZXN0b3JlIGFycmF5IGluZGV4?=
 =?utf-8?Q?ing?=
Thread-Index: AQHdOuFXOfAVDaZRBkuNVVmsAYH9Ew==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Wed, 2 Sep 2026 13:45:39 +0000
Message-ID: <IA3PR11MB9037563CC78BD218B6949079E4B72@IA3PR11MB9037.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-traffictypediagnostic: IA3PR11MB9037:EE_|SJ5PPFEF71E136E:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0172282b-edb8-4fc1-8cd8-08df08f879b0
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|18002099003|38070700021|11063799006|56012099006|10067099003;
x-microsoft-antispam-message-info: XBQJ78nFj5Ml9NT9aQ0F9Ik2PRkOh3bqt0pRkIFnEsVjQhGWIcnXFG9U6y7FZZDK64g/51yjeSgBXPhQZsrw4hwsPUxlPuFFEECTkMW/PsgaY9Ot5ylomZa+Bdmhpu6Ax3GEC8RFrPx1MzKXOLv/gPPDbNVvIQsAK58QjlkajTdeAyAyVN4U/ooL78GjbWpTR376HimJs4T5RnQXCz2x5j0QbiIHCIiIeymiSCKRbJmcrJ9XNKPJEwDHFZK8XAyU9oBmHiW5Uk2ppg/NZ6C4xqCU6p+3hAZldjh+aTB1NNtGl127hzj+cpO/ytYYevOn2s3FN82e/tZAUXZ18+T7JBxPHGQp298g5qwWSuH+sdFHaFiBgXp7yz0yIfCPsM0XW3KKRIcpqZHwEN/C4DSM0SMofHqi8Eo77K+4/LCv/zEEdUhDP3Dfwyy9rfABXP5uZxgHsQaZr28gJRfNGD+lU1lRhjktkQBIzW3jtLZoaK9Rxb8jykrgJwhbiFKHJt2vJa4MH8z7y79kdMvxmsGzn1Hr/5r7vV1RDfPzsdowspjz+JQYoBDn1XvTEvCk0n0xNZ404A14PfJe5wmgSW35nN6wvd4udOHEtfJTTMD1F2fUgzqflpswDWQQZtfNYttiJEXspgL3+m3RFFW8ARNgw7lDbN+zwA63Z376Xf6Up127l8ahCWyw7krfQXuedyOM4fyHEdnwsz/NfozBd/PmHVLivnNQTYvpT8W/hunFEG4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9037.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(38070700021)(11063799006)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZkkzWEhqTDVvNURaUVl3QmVqOVZkd0k0OUpmZENTS2VOSE1CcngxU3lQMW9x?=
 =?utf-8?B?VHE3V3NBcnJYNHZzNWlQMWZ6MG1mRW5JNERZQW52czBoK2J0SW5SZE5WRjlR?=
 =?utf-8?B?Y3UrdHMvaUpVZi9qZ2V6YkhxV0N4N1owVlZLZTlGam45T0piQmc3OStTUGxq?=
 =?utf-8?B?R0FDS0U5OHZvUFpMcCtCR1BseGdLTUdMaDBSSTRUNzJub0ZOUFBTa0UzRUpB?=
 =?utf-8?B?WVoxVHcyUWNBTzh6eGpmVDBONkFNdU91RDAzM1FlMkx2RWw4U0oybFV6d2Vu?=
 =?utf-8?B?MWoyRm53YWc2TGpvcWxrZ04relhFSUIrUmVzQytBcDNVQmxYVEdhbGxtaXpz?=
 =?utf-8?B?ZzRJMDg0Zkc5TzBRVzdJeVZZZTh6RFBvOEVKTWRYcXFHTzBpV3JYTlMwUkNB?=
 =?utf-8?B?d3ZXV2JjVENEM0pWUzYzcnlwTCtxRGgzeEU5Q2NmNzNQcCtqQnFqMG9Ib254?=
 =?utf-8?B?L0ZzaHBWbGxmNmt6dlZXN1d4UjVraS8rN1IyMUljc3JMOW8rMExwYVZWMjBP?=
 =?utf-8?B?cEVONkRLbC9DNnhTR0EvT0FCZHQ2QTZNc3Ixb2VpTDFjNk9jK1FLMXJsYktl?=
 =?utf-8?B?RFVWUFpMSDVDZldFVW1zZ2dHc1JraTVTSHFzeHNLdzNQa0U2Vm1Za1U1Tith?=
 =?utf-8?B?UDVIR2lBakovUHEwV0k3SHR5S0hxWjZ3S1JqMDZ2ZTdiSjNjWGh2Y3lUWlJP?=
 =?utf-8?B?cWxVTkFodDltRTRkd3lmVjQzNGVEOUhJUVIzQUEvZVFFK2c2Q3hFWURkNDdr?=
 =?utf-8?B?WmRkSGh2TWQrSnNabkhXbUNsdDR0U21FV3luVVQ3SFloSFdCYjBEaUd5RVJ6?=
 =?utf-8?B?MkdJQlV2aUdqM3ZPV0lJZXpSWjNkeW84dFZiVk5JRHE3bGNaTTAzVFlGS2RO?=
 =?utf-8?B?RGZmZzBiSGpNdUxUTE53SHpCS0R2NUx4bytVYklLU05qTHJZS0prOHFHTTVy?=
 =?utf-8?B?OTRHR0tjS1pOanl5d29aUStUemkzWFpuTCtMYXlqOE1heXJ2cTB6MXVMeU16?=
 =?utf-8?B?cTdmVjBxejRINjN5UWJJNGtYNExWaFh6bjBwR1JiU1p6eWJRaXpWcVM1TXlC?=
 =?utf-8?B?TjVPRHJRQWcwVExNQVNBM0RaOVp2bGoxcXRZSk9zeEd1c3ZZRnRDci84MG1n?=
 =?utf-8?B?d1NYcWIrQTVmY1Z3UlBiTHFIS1dKdXU1MFIrbThmbllnaXlZTlZIV1ZkdC9G?=
 =?utf-8?B?Y1VYRFdvNE5tMU55L3NEbWEvM05xQ3l1UGpOK1ZyTk1YblNzWXoxeVZVWWQv?=
 =?utf-8?B?aFJlZVBlMlJBdDl6ekRuS081RDlGOFBmd1VjWHdDTUIybUF4NTJFcTRKcjJv?=
 =?utf-8?B?KzFsSG1lUkRoekRkeGg2YVBjMitWbi9Ka0V1cmdQRWFDSVdxZ3p2b2lHUzl4?=
 =?utf-8?B?VjhOVUhXb3MwQW5XSDdJbWEvSmg3bURPbitJczhjREN1eU1oRVRMZndSeUNW?=
 =?utf-8?B?dTZKMlVkUzVnRjQ1c0k2M2gzZEVDVlQzVGIyalFVY2YzL1djUUI2Q3VCblBE?=
 =?utf-8?B?NnZRcU9MRzRMa29XTjVnV3B1ZVptSElkT2NMb1lZU1VNZXRyT2x0Y0sxUjdW?=
 =?utf-8?B?MHdYUk9yU2lJdUFNWk5CZURlbDJuZXFKS3g2OWRlQ2F2VHhwTW1LRmk3dXdO?=
 =?utf-8?B?VDFQNzdYaVZvMFJNeVNEYWdyc3c4VXlQaGRvOHB2MVMxOGZVZ3E3NktSN3di?=
 =?utf-8?B?clVWTytEV0o2Yk5oUjBnK2FEbXVaRXFxUHdkTzNzbis3SjV0RWVWVm02T1dk?=
 =?utf-8?B?NHlSWU9IM2ZIQTE0QUViMjZ5QzhrN04zOUkyWVNGektRZWNMM3NkRTlPWEIy?=
 =?utf-8?B?eERwSTRwa216SU9FYTBGS0djT1EwNzFINXFkbUJmaFhIV1psN0liQS9sd3VX?=
 =?utf-8?B?K0VjU1B0YWxpRlI1cjBnbWgyakFCRHpCSmZnQmJnaUw1Z0MzUFNhcEtMVEdV?=
 =?utf-8?B?L1BrZWZBSWNuUk5WL2tiQmJEZkNSMlI1M2NncTg3a3pMZ1daL2RZeG5YcnBM?=
 =?utf-8?B?ZmVtZkIya3lPRG9tQ00wbHpZSUdRWmN1KzVHRWRSeDlYTkxOaXJwUzB0UEIz?=
 =?utf-8?B?VW1SUVZIWHh1MGZVQlJGbEw2MjhtSllrd1liVWZHQ3VQMThNTExiM0VUYlIv?=
 =?utf-8?B?WlRNVUpqOU5sc0V0dkNQWTJxMFptVnRVZDhwc0dyTVFZNHNoRHlHUUdzc0Jw?=
 =?utf-8?B?T2kvYzd5b3poNjBmZkd3S0dFTHhHU1RnRHJPZGxJR3JxQmEvU3YyTVgxRGh2?=
 =?utf-8?B?U3E2Sy95VVRaRXNwVEVZQlFLK3ZlN0x2RXpHSUh4MFZHcHJlcCtTTFIySXEw?=
 =?utf-8?B?aVlQVXQydGt4aXhyWUlBVmVoTGJlOTN6Y2tCWE5CeHRRRmVqUWJVUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Tcp1sKYQiPLlgygDjEq9utY+4Nmv0y9H1an6atqroNdtEnN7wGikb8KzU42hKU/gdNBDl0zDLeRYyAdSEY46MajtSpcD/1l2IjB6Yuy0pp9bx8Qdvm75dh5DObq/8Phja2kSGkcEL5Lsns0jJLTF0WP3JSzvRgPGmIXnP7V/xottDoIwqG26XlRUgz7x0nTfxtqHXYvtMdNCERl+49oJuUmL4gNKiUWsE0lGz3NTfXBBx6M+XJQJxpkJKfGnDFAxtfydijolyDJd+ifX5F1av32A9KXrkGtkzUp+w2rKcETYUGmg/pt7uN8/Zko0OutoZo4at1VtaKqzxXddVmX3qA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9037.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0172282b-edb8-4fc1-8cd8-08df08f879b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 13:45:39.5964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-transportrecall-originalinternetmessageid: <IA3PR11MB90373ED4CEC6E4B5582D50B8E4B72@IA3PR11MB9037.namprd11.prod.outlook.com>
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: euvssFOu8WRx4G3yztvXVoTLdyEo7EhxFqHBYX4nZtv8Vt9q0O5vcRKqmdjYPt/6OjVx3fZbgVZuHRMZL3u/uA==
X-MS-Exchange-CrossTenant-messagerecallsenderobjectid: f68ff83f-c6fe-4815-ac4a-e14d74793213
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFEF71E136E
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

U2hhcm1hLCBOaXNoaXQgd291bGQgbGlrZSB0byByZWNhbGwgdGhlIG1lc3NhZ2UsICLinJcgaTkx
NS5DSS5GdWxsOiBmYWlsdXJlIGZvciB0ZXN0cy9pbnRlbC94ZV9zeXNmc19zY2hlZHVsZXI6IGZp
eCBzYXZlL3Jlc3RvcmUgYXJyYXkgaW5kZXhpbmciLg==
