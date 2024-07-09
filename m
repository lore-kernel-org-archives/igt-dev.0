Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F6FC3DA41
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 09:43:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F8C10E4DA;
	Tue,  9 Jul 2024 09:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WMss4k8h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E123710E4DE
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 09:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720518233; x=1752054233;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8Nfg+olT8ruc7g0C/dCAG28PKvZxkXgqudLCoDsIz54=;
 b=WMss4k8hnfyspeJKOqxDkpm3SZZM0Wn+UWMTnlioJavR3+/HDYcPMPyS
 WPVrrECYrPOTuPbwlcFFyJ8Wy4FtsqZOTh2QDqXD2stm/Qu3eH53dqIhX
 WcOZUkfHGw6UtxwV71TmCT7a1bPUU9xksOD98r3iPqO2RTrZI31t23Tjq
 ONFugtf/IntSoEbwJCadTVgs6KNiL/68O0Tj+3PHCK27nw0pjwtzGd0sh
 0CrnIBRwUcHsTYpUfDqGAEb3QhRBYkQuTfzW7fTkD1c61jR/tQ3sHVSTX
 tLggljbkX2cC9eWajyN1TICqMtDf9WXpnMXvjlW7GgsB8XEwe8fR367u5 w==;
X-CSE-ConnectionGUID: gTEx0gXfR1CTZWy8VxUksg==
X-CSE-MsgGUID: NKJY7eGFRFy/SyKr5qGUmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17897398"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="17897398"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 02:43:53 -0700
X-CSE-ConnectionGUID: nnT+M7ONRp6y8GUJ9rZKQA==
X-CSE-MsgGUID: oXP222eHRkSDzO9CDrEamg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="47772870"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 02:43:52 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 02:43:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 02:43:51 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 02:43:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsbZKesvCseoteRv3oemO2wG95QSffuwjOjif8sEoE5qGSsveOwmtunoNNvAl3CwcXysaY75GF7iP/cZ6uEiLwkaZmXt4TAB0C5Ql+T07+V+2T2aPx95F5Sn2ASx6WpP34YzEDELc/euv6fm3AgmkMJeFFBmY7RUEn005+r1u6w9voWgjVCmmt48TxITtFyg5umBZfGzAyHmbsjtnDQg3fIn7VpfyjdXhJmNCvKiUJHe4iUxys6ciuxAXEvxSE7bUiLqludMLkHi3/Q2HsVqJiD6MwfThZWWKKVXGuPqH5pMY9i4MaFeMrLMZ8+nDBp5qILbjnx7S8TbH5VPt3ekGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Nfg+olT8ruc7g0C/dCAG28PKvZxkXgqudLCoDsIz54=;
 b=lhp7usTaNmDPPV+H54o3QvyWNVi/4NRavS216rGDf7kQ5lGXJ1zqB5eHz7MMgkmibGMnDf1I07inihShFkc1QOvCKyczF52Wgx10Ej62bLpR/5NEjSFhFMcuEJ38zOP88GW+pU9sHEmdWLZ2oZEzb1w12BZcUBGjcTeXze0MfwrlcBub+q+qSfmk0PdzeJADB434GdvkeuqAWfoss97k53tSGZVrizO/wux1BCky3MuYBJJAxHeLiicZy1o/6TKKfhSN8bk2wwewWXoJs4bMwHbTQVhBD4evo5ulu9X34IkanjFnclT45NM7KFs/IUvOlK35wlG0hgspT6wwNEdamA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by MW5PR11MB5932.namprd11.prod.outlook.com (2603:10b6:303:1a2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Tue, 9 Jul
 2024 09:43:49 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea%5]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 09:43:49 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH i-g-t v2 2/3] tests/intel/xe_pm: Extend mocs-rpm test to
 support D3Cold
Thread-Topic: [PATCH i-g-t v2 2/3] tests/intel/xe_pm: Extend mocs-rpm test to
 support D3Cold
Thread-Index: AQHa0USVEp5+DA+5gk2QzRYMRpM46LHt5V+AgABBA3A=
Date: Tue, 9 Jul 2024 09:43:49 +0000
Message-ID: <MW3PR11MB4748FE96B02A8301F665A922AEDB2@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240708145607.272869-1-badal.nilawar@intel.com>
 <20240708145607.272869-3-badal.nilawar@intel.com>
 <2ced9f5f-9374-44eb-ab8e-2bfc32bd1430@intel.com>
In-Reply-To: <2ced9f5f-9374-44eb-ab8e-2bfc32bd1430@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|MW5PR11MB5932:EE_
x-ms-office365-filtering-correlation-id: 7935dc35-bc9e-4e6a-1378-08dc9ffba27f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Rm1wR3dVRVJqdXBJYjlZQkhhRnhKbGdEb1JDWDlrcThHUTkxZ3p1dGRnTmtK?=
 =?utf-8?B?cExLR21rMkJlbkhyc0owaGpVRDdTMkVOUDJjRy9HR2Ird0Z1SGVZNGxSVDdk?=
 =?utf-8?B?TnplUFB3U09DT0JhMVlQS3RrWTZxS3h4SnJOQTZCM0hCL3NCY1JhQThRY2FV?=
 =?utf-8?B?ZW1BcUxrbENMQjE0Ry8yTVBSMC9yR1REWVoza09vdTNhTWZhUUh0akpFYnVI?=
 =?utf-8?B?YjBydnYvNVFQMUtqKzFwVXArb0M1UWQrS0Fwc1QrUzF5RGlIWWdmTyt5VjdJ?=
 =?utf-8?B?K3VtTkJFdnlpeHk0eW11QXp2ME1SczZSYWtsY3NpTlg3MWVJNmpxR3ozUVJI?=
 =?utf-8?B?UXgzZXR5SEhPREtHQkZ3bjFzTCtzeXZLUldWOXFsb21sTEFwcWh0Y2pORzFz?=
 =?utf-8?B?NWdSMkFkMmM5SjZtV1c5UFFpTGg3MXpoczh1ZkE0ZXMyeXpINmZNRjQ4U0ts?=
 =?utf-8?B?SndiV1o5UGM2aGJFU05kc2I3TVloRUhZd3FMS3hPRTVTVXRmV1FtOGc2Mlho?=
 =?utf-8?B?UTR0TzBzaGp1VGNuYStvZ1AyRllwOHVEN1g4c3hwT3hFK09KYVl2alVlcy90?=
 =?utf-8?B?blNzNGlicUlUOUh3THVmY2diQk5HS2FOdThqdExTUVNvZFFNUGt4RS9JM0ZC?=
 =?utf-8?B?aVhPdHU2cnRmMXF3bWFlOHEveGwrb3ZSY0ZIbWJoYWFnKzdkZTdxdXlxeEE0?=
 =?utf-8?B?QlF2WDJObnAzUlpvSDQzMEo5WW1Ock54Ymcrd241TDBPdzNNZDN6QW1EbGFZ?=
 =?utf-8?B?QmJyWURrK0pjMEdFTXVjdEJvSU5oSjkrNVZzSUs1ZU00SzU3KzFkMlFzTCty?=
 =?utf-8?B?M2pjZlA2M29jZ0tGb3I4akxodWU2c095UnVvYnlwNGpNUy94bGM2MGVrQmk2?=
 =?utf-8?B?SDNZa3FJMEpSVFFTa1R2blhydEp4RDFkbGVHQmFyMEtjRWExM2VlVFFwcDFi?=
 =?utf-8?B?cnVNTUV1LzJFM1JqTmhmdFRFT01QY2wzRjVCc1BDalJsRUFBKzcyb2hMOWdy?=
 =?utf-8?B?RG1hZGU3dWp6bi9WTHg2bHFIMVI1UVorS24rZkxQTkY0RTd6T1BCdWJQUExl?=
 =?utf-8?B?NWJKeDZVWkVkNUVTTExrb1RHakcrQXBsTkZ0eXFyS1YwMzRXcWZ3enp5M1lh?=
 =?utf-8?B?Qk1UM2F1a2dhTXhRbmtNUVh0cmlQb1NIdk1VZ3VDaXkzVFZJTjNSRHpyN1pm?=
 =?utf-8?B?Q0JyY3JuSVpMN3RmZi9oNWtrd3lveVJDMWMyc3pubHdWM1N3Q0c2N2JzcXBa?=
 =?utf-8?B?SUJLOEVKdFJvczA1WU5abURvVG9GdFZSVlFsbzFMWVJEbXh5Yk9tckIrSFdL?=
 =?utf-8?B?alhzaEd0SW84dmFQWUdLcytqRUVJUlZFcW1lYUx3WTdKL0VCR3FSZkxLV1RT?=
 =?utf-8?B?TzRwWHRhUDVNdEVleFJSZGlHWG14VWhvZ0dSdDRjaGZjeWZEcHBKRDN0SnMr?=
 =?utf-8?B?UEpTdlpsNWtaRUFsSFRWQ3Q1czNVTUZGS0lybGhFRzBSbTdJV3lxMWJ0Y2sx?=
 =?utf-8?B?bmh0NzlQaHlPS1ZNaG54aDIzRXRwMlZWYUFOMHlxSDdCN1I3TU8yNWVCVW1E?=
 =?utf-8?B?Q09COEw4Wk5nS2p3WEkwRnJzbmcyU0xXdUZwMmdNRXpkTWp2R1NtMmx4ODZU?=
 =?utf-8?B?MnZUTFdsbm1HcDZmRGE2c2dGT0k1RHNjc3J0UHJnMGtKd0JiQjZENlN4bGk4?=
 =?utf-8?B?ZW9oMXhIRmduZkU3aHlkNHlaampHc0ZINjlkQ29oZW1US3BJazgwTUwwUFM5?=
 =?utf-8?B?ekh5d3J2L0w4bklPbk05U2dVbUpmQVpQZ2szU1kxeExrRk1FQ09IWGlYY0Qx?=
 =?utf-8?B?Rm8wcm1nNW1JWVFYRmt4Yjc5bDZOSHVlZEtvTXNKK29IRktLdWxwcSs3bkVG?=
 =?utf-8?B?OE9XaVFpS0V3RER0cFV3WFJHNE1kQXRxZ2ZOb3ZMV3Fra3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tys1YVVpdmVxaVBIYmFqNEpXOVBhNjVvOVVYblB5Wkd6VW56NnhMVlNmR1E5?=
 =?utf-8?B?bTRYWGlHcTZtOGs2K2FkRzc1bFdWNlcvNEYwZEVtVVRlcEtQZ2lFaXd5U0ZV?=
 =?utf-8?B?VmNXdDd1cVN1NkI1d0FLc3V0d2YxVktLOXpGK3liOVdiUWhpU1I3WWZsRkti?=
 =?utf-8?B?RU9SeGJFYUZqLzJOdkV1QzlIRnAzVEJWWm1SSHRCblMrL3dMQ0JhOWxXY2FW?=
 =?utf-8?B?Q242c3hkQWRQcDVWQ21XY2I1L20yQ2IyemduU3p1a2IvTC9qSVRwend5UnlI?=
 =?utf-8?B?VjZZaFpPc2Q4Qk9GY096YXNqaVZ4RWs5WlZzRU9ubExaU08zMFJhQ0lCUUgv?=
 =?utf-8?B?RUR0dmV3RXJadktUeUQxMU1lUXlhVnFJRWJnOXFoY2JlNHNMWktyMGlnaklT?=
 =?utf-8?B?SUhLOUt1cnN4TFkwRXNnVG5aQkdNZDFoMDUwQzRGQWNXeVdROXIxUkJFWWJl?=
 =?utf-8?B?Q0o2Ri9OWmVBM3Z6RXltenBDRGpiZWJxaXhOYUx1VjAvRk9NUFhtNGE0SGlR?=
 =?utf-8?B?eWJHWFJkQVQwRWtic3dBRFZBRVF2VTZJSXN2bFhHZU9aZ2I4cjBYT1VCdDFS?=
 =?utf-8?B?SHE4S1RPOSsrMFNXR0FOWmpzY0tsT0NXU2k4TUdSUHl1STlNWURCa2VUVE5L?=
 =?utf-8?B?TGZCVXhUV25hTXZrQ0ljZXBaUlo4L2RSeGxwaEg0WnYraFROODhmb09hUk9W?=
 =?utf-8?B?ZFFYcGU3ZnJ1V1Y1MnFrOW43K1YrRkwrZHFza1VldjE1bkE3U2UzK2FYTXRD?=
 =?utf-8?B?YlQvTEE1ckREaTFiZ2s4d2JkM2xubmwzcUl2UFArRHhCUWhzVlg5YXc1cnEw?=
 =?utf-8?B?ZitzODhzQ2lNOU9hU0FzYlA1aWg0SmJQNmUxYng0Mk9GanJFVVNNREkzc0hZ?=
 =?utf-8?B?SlgrOHB4M0J1aXhhRUVPbW5rUnA2djBGWTNnamJXWVptVGFIS1BkL1BrRkRZ?=
 =?utf-8?B?SmxMaDVSZzhjOVFveGxiTm5ZbHpDM21uK2owSEFKTGdhdGd5S0tYc2MyMjNn?=
 =?utf-8?B?dGlNWkl6MUROMHkxSEEwQ1ArOVBFS0pxd1ZWKzdJV0tUZTNtekJuT3U0V1lM?=
 =?utf-8?B?ckdqT05CUnNBNmNpdjJTdFl1b2JaNGxyaVlSbk5IWmMzYU5JblRmREhtU1hI?=
 =?utf-8?B?OEcySG5ydytjWlZLSFRxdDZVWW1ndXp2RzRkM2N3dk9mYkN2OU5QS0dULzd3?=
 =?utf-8?B?WlJQL0dmREkrZ3FqUnZhcE9pYm4wbzlFOUxNWFdXL0RNT3A2U3plUEhOenoy?=
 =?utf-8?B?VlBsNDU0ZnIyVnh0M2gxd01VVlR4Q2lCc2FadWNoUCtXeHM1WE9wc0ZsNDRj?=
 =?utf-8?B?L083dzdndFhJeWhMcWw4cEpQdS9hclFOWGFLQTV4a3cvbHV0K1FLWm5jZmZV?=
 =?utf-8?B?VklCN200aGg5NitTb0JLMU1zckRrWEVGRUxBR1luQ3oyM0NCV2JkVFVPWHBU?=
 =?utf-8?B?OWVaemlteUJBODJHZzZySHI4WGhPbXZRN29CMEFRS3FGcWJNRTdrM2pEVVh0?=
 =?utf-8?B?N3FhWjVMRmcrRS9WWkZ1V2o3WXZNSDkvM0wzdk9VMFFHNFRNZTdreXRwM3R1?=
 =?utf-8?B?TWw2MHFGeENxVllSbDJZZ1FhMmRQL05nbVlDRFpWUHMvVHlGdE9ZZWJFUThl?=
 =?utf-8?B?SU55SGJ4SnBqUDd2REl6V08yOUtYa216ZlAyMkFOaU9FTW1jNU8vUmVqNytz?=
 =?utf-8?B?WGZyMXJTcnoxTE10TDQraDhVL0krMmNKVy9QYndNVXkrK1ZTaDdFY3ZFVUhY?=
 =?utf-8?B?elJzZEIrY2JiVXVzTGtBdkc1a2hMcUE5YlZYN3JXcS9nMUIwSXJhMjlFYTdj?=
 =?utf-8?B?aHhmR0J6a0FBUEVPY3hFL2hXSllCMGYxaXBLRkFrZVdVRTJZZmxjRU05YmEr?=
 =?utf-8?B?K2YwR002Q1VLZ3BDaHdIR1FmbGdjTXNQeTNYNWo2dFE4eFlqazRCanRFOXlj?=
 =?utf-8?B?WHhETGY1OHI0NGxJYUI4UU1ROUxFUmJmNk1mN0swdS9ZcUFKMzA5TVc4ajh0?=
 =?utf-8?B?aktwSHNFbGREanduNFRKM3dNOUFwUlZBUUE3dGRmWTBJZWIyVldScVNvbVNa?=
 =?utf-8?B?NlYwOVVQbHp1ZDZldFVsS3YwMEtuSnF5Q1RjSkZVNkVydG9sUVZYRDdVdi80?=
 =?utf-8?B?TXZSbmJjMkdvV0tZMDZEQndNN1k3YVlEaTQvMUh5Z3ZhMmV0SmNVL0lJbHcr?=
 =?utf-8?B?TGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7935dc35-bc9e-4e6a-1378-08dc9ffba27f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2024 09:43:49.1342 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2TWArub0o6NerBVLQdcht0T8+A44BE0Mwhy5MliGs20VIxQOFVNPi84DE4hLK759oztwTltrstAamdSJMwwqJdzCwsW+kJOWbqCCQnrSbuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5932
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGF1cm8sIFJpYW5hIDxy
aWFuYS50YXVyb0BpbnRlbC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bHkgOSwgMjAyNCAxMToy
MSBBTQ0KPiBUbzogTmlsYXdhciwgQmFkYWwgPGJhZGFsLm5pbGF3YXJAaW50ZWwuY29tPjsgaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFZpdmksIFJvZHJpZ28gPHJvZHJpZ28u
dml2aUBpbnRlbC5jb20+OyBLdW1hciwgSmFuZ2EgUmFodWwNCj4gPGphbmdhLnJhaHVsLmt1bWFy
QGludGVsLmNvbT47IGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCBpLWctdCB2MiAyLzNdIHRlc3RzL2ludGVsL3hlX3BtOiBFeHRlbmQgbW9jcy1y
cG0gdGVzdCB0bw0KPiBzdXBwb3J0IEQzQ29sZA0KPiANCj4gDQo+IA0KPiBPbiA3LzgvMjAyNCA4
OjI2IFBNLCBCYWRhbCBOaWxhd2FyIHdyb3RlOg0KPiA+IEV4dGVuZCBtb2NzIHJwbSB0ZXN0IHRv
IHN1cHBvcnQgRDNDb2xkIHVzaW5nIGV4aXN0aW5nIGQzIGhlbHBlcnMuDQo+IHN1cHBvcnQgRDMg
c3RhdGVzDQo+ID4NCj4gPiB2MjogVXBkYXRlIGRvY3VtZW50YXRpb24vZGVzY3JpcHRpb24gKFJp
YW5hKQ0KPiA+DQo+ID4gQ2M6IGphbmdhLnJhaHVsLmt1bWFyQGludGVsLmNvbQ0KPiBDYyBmb3Jt
YXQgaXMgbm90IGNvcnJlY3QNCj4gDQo+IFdpdGggdGhlIGFib3ZlIGNvbW1lbnRzIGZpeGVkDQo+
IFJldmlld2VkLWJ5OiBSaWFuYSBUYXVybyA8cmlhbmEudGF1cm9AaW50ZWwuY29tPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IEJhZGFsIE5pbGF3YXIgPGJhZGFsLm5pbGF3YXJAaW50ZWwuY29tPg0KPiA+
IC0tLQ0KPiA+ICAgdGVzdHMvaW50ZWwveGVfcG0uYyB8IDYwICsrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDM2IGluc2Vy
dGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2lu
dGVsL3hlX3BtLmMgYi90ZXN0cy9pbnRlbC94ZV9wbS5jIGluZGV4DQo+ID4gYjMwZTk0YTJhLi44
YjExNWUyZjYgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMvaW50ZWwveGVfcG0uYw0KPiA+ICsrKyBi
L3Rlc3RzL2ludGVsL3hlX3BtLmMNCj4gPiBAQCAtNjEwLDI4ICs2MTAsMjggQEAgc3RhdGljIHZv
aWQgdGVzdF9tbWFwKGRldmljZV90IGRldmljZSwgdWludDMyX3QNCj4gcGxhY2VtZW50LCB1aW50
MzJfdCBmbGFncywNCj4gPiAgIAljbG9zZShmd19oYW5kbGUpOw0KPiA+ICAgfQ0KPiA+DQo+ID4g
LS8qKg0KPiA+IC0gKiBTVUJURVNUOiBtb2NzLXJwbQ0KPiA+IC0gKiBEZXNjcmlwdGlvbjoNCj4g
PiAtICogICAgIFZhbGlkYXRlIG1vY3MgcmVnaXN0ZXIgY29udGVudHMgb3ZlciBzdXNwZW5kIHJl
c3VtZQ0KPiA+IC0gKg0KPiA+IC0gKiBGdW5jdGlvbmFsaXR5OiBtb2NzIHJlZ2lzdGVycw0KPiA+
IC0gKiBSdW4gdHlwZTogRlVMTA0KPiA+IC0gKi8NCj4gPiAgIC8qKg0KPiA+ICAgICogU1VCVEVT
VDogJXMtbW9jcw0KPiA+IC0gKiBEZXNjcmlwdGlvbjogdGVzdCBjaGVja3MgZm9yIG1vY3Mgc3Rh
dGUgYmVmb3JlIGFuZCBhZnRlciAlYXJnWzFdDQo+ID4gc3RhdGUNCj4gPiAtICogRnVuY3Rpb25h
bGl0eTogcG0gLSAlYXJnWzFdDQo+ID4gKyAqIERlc2NyaXB0aW9uOiBWYWxpZGF0ZSBjb250ZW50
cyBvZiBtb2NzIHJlZ2lzdGVycyBvdmVyIHN1c3BlbmQNCj4gPiArIHJlc3VtZQ0KPiA+ICsgKiBG
dW5jdGlvbmFsaXR5OiBwbV9zdXNwZW5kDQo+ID4gICAgKg0KPiA+ICAgICogYXJnWzFdOg0KPiA+
ICAgICoNCj4gPiAgICAqIEBzMmlkbGU6CXMyaWRsZQ0KPiA+ICAgICogQHMzOgkJczMNCj4gPiAg
ICAqIEBzNDoJCXM0DQo+ID4gKyAqDQo+ID4gKyAqIEBkM2hvdDoJZDNob3QNCj4gPiArICogQGQz
Y29sZDoJZDNjb2xkDQo+ID4gICAgKi8NCj4gPiAtc3RhdGljIHZvaWQgdGVzdF9tb2NzX3N1c3Bl
bmRfcmVzdW1lKGRldmljZV90IGRldmljZSwgaW50IHNfc3RhdGUpDQo+ID4gK3N0YXRpYyB2b2lk
IHRlc3RfbW9jc19zdXNwZW5kX3Jlc3VtZShkZXZpY2VfdCBkZXZpY2UsIGVudW0NCj4gaWd0X3N1
c3BlbmRfc3RhdGUgc19zdGF0ZSwNCj4gPiArCQkJCSAgICAgZW51bSBpZ3RfYWNwaV9kX3N0YXRl
IGRfc3RhdGUpDQo+ID4gICB7DQo+ID4gICAJaW50IGd0Ow0KPiA+ICsJdWludDY0X3QgYWN0aXZl
X3RpbWU7DQo+ID4gKwlib29sIGNoZWNrX3JwbSA9IChkX3N0YXRlID09IElHVF9BQ1BJX0QzSG90
IHx8DQo+ID4gKwkJCSAgZF9zdGF0ZSA9PSBJR1RfQUNQSV9EM0NvbGQpOw0KPiA+ICsNCj4gPg0K
PiA+ICAgCXhlX2Zvcl9lYWNoX2d0KGRldmljZS5mZF94ZSwgZ3QpIHsNCj4gPiAgIAkJY2hhciBw
YXRoWzI1Nl07DQo+ID4gQEAgLTYzOSwyNCArNjM5LDM0IEBAIHN0YXRpYyB2b2lkIHRlc3RfbW9j
c19zdXNwZW5kX3Jlc3VtZShkZXZpY2VfdA0KPiBkZXZpY2UsIGludCBzX3N0YXRlKQ0KPiA+ICAg
CQkvLyBNb2NzIGRlYnVnZnMgY29udGVudHMgYmVmb3JlIGFuZCBhZnRlciBzdXNwZW5kLXJlc3Vt
ZQ0KPiA+ICAgCQljaGFyIG1vY3NfY29udGVudF9wcmVbNDA5Nl0sIG1vY3NfY29udGVudHNfcG9z
dFs0MDk2XTsNCj4gPg0KPiA+ICsJCWlndF9kZWJ1ZygiUnVubmluZyBvbiBHVCVkXG4iLCBndCk7
DQo+ID4gKw0KPiA+ICAgCQlzcHJpbnRmKHBhdGgsICJndCVkL21vY3MiLCBndCk7DQo+ID4gICAJ
CWlndF9hc3NlcnQoaWd0X2RlYnVnZnNfZXhpc3RzKGRldmljZS5mZF94ZSwgcGF0aCwgT19SRE9O
TFkpKTsNCj4gPiAgIAkJaWd0X2RlYnVnZnNfZHVtcChkZXZpY2UuZmRfeGUsIHBhdGgpOw0KPiA+
ICAgCQlpZ3RfZGVidWdmc19yZWFkKGRldmljZS5mZF94ZSwgcGF0aCwgbW9jc19jb250ZW50X3By
ZSk7DQo+ID4NCj4gPiAtCQlpZiAoc19zdGF0ZSA9PSBOT19TVVNQRU5EKSB7DQo+ID4gKwkJaWYg
KGNoZWNrX3JwbSkgew0KPiA+ICsJCQlpZ3RfYXNzZXJ0KGluX2QzKGRldmljZSwgZF9zdGF0ZSkp
Ow0KPiA+ICsJCQlhY3RpdmVfdGltZSA9DQo+IGlndF9wbV9nZXRfcnVudGltZV9hY3RpdmVfdGlt
ZShkZXZpY2UucGNpX3hlKTsNCj4gPiArDQo+ID4gICAJCQlmd19oYW5kbGUgPSBpZ3RfZGVidWdm
c19vcGVuKGRldmljZS5mZF94ZSwNCj4gImZvcmNld2FrZV9hbGwiLCBPX1JET05MWSk7DQo+ID4g
ICAJCQlpZ3RfYXNzZXJ0KGZ3X2hhbmRsZSA+PSAwKTsNCj4gPiAtCQkJaWd0X2Fzc2VydChpZ3Rf
Z2V0X3J1bnRpbWVfcG1fc3RhdHVzKCkgPT0NCj4gSUdUX1JVTlRJTUVfUE1fU1RBVFVTX0FDVElW
RSk7DQo+ID4gKw0KPiAJaWd0X2Fzc2VydChpZ3RfcG1fZ2V0X3J1bnRpbWVfYWN0aXZlX3RpbWUo
ZGV2aWNlLnBjaV94ZSkgPg0KPiA+ICsJCQkJICAgYWN0aXZlX3RpbWUpOw0KPiA+DQo+ID4gICAJ
CQkvKiBNYWtlIHN1cmUgcnVudGltZSBwbSBnb2VzIGJhY2sgdG8gc3VzcGVuZGVkDQo+IHN0YXR1
cyBhZnRlciBjbG9zaW5nIGZvcmNld2FrZV9hbGwgKi8NCj4gPiAgIAkJCWNsb3NlKGZ3X2hhbmRs
ZSk7DQo+ID4gLQ0KPiAJaWd0X2Fzc2VydChpZ3Rfd2FpdF9mb3JfcG1fc3RhdHVzKElHVF9SVU5U
SU1FX1BNX1NUQVRVU19TVVNQRQ0KPiBOREVEKSk7DQo+ID4gKwkJCXNsZWVwKDEpOw0KPiA+ICsN
Cj4gPiArCQkJaWd0X2Fzc2VydChpbl9kMyhkZXZpY2UsIGRfc3RhdGUpKTsNCj4gPiAgIAkJfSBl
bHNlIHsNCj4gPiAtCQkJZW51bSBpZ3Rfc3VzcGVuZF90ZXN0IHRlc3QgPSBzX3N0YXRlID09DQo+
IFNVU1BFTkRfU1RBVEVfRElTSyA/DQo+ID4gLQkJCQlTVVNQRU5EX1RFU1RfREVWSUNFUyA6DQo+
IFNVU1BFTkRfVEVTVF9OT05FOw0KPiA+ICsJCQlpZiAoc19zdGF0ZSAhPSBOT19TVVNQRU5EKSB7
DQo+ID4gKwkJCQllbnVtIGlndF9zdXNwZW5kX3Rlc3QgdGVzdCA9IHNfc3RhdGUgPT0NCj4gU1VT
UEVORF9TVEFURV9ESVNLID8NCj4gPiArCQkJCQlTVVNQRU5EX1RFU1RfREVWSUNFUyA6DQo+IFNV
U1BFTkRfVEVTVF9OT05FOw0KPiA+DQo+ID4gLQkJCWlndF9zeXN0ZW1fc3VzcGVuZF9hdXRvcmVz
dW1lKHNfc3RhdGUsIHRlc3QpOw0KPiA+ICsJCQkJaWd0X3N5c3RlbV9zdXNwZW5kX2F1dG9yZXN1
bWUoc19zdGF0ZSwNCj4gdGVzdCk7DQo+ID4gKwkJCX0NCj4gPiAgIAkJfQ0KPiA+ICAgCQlpZ3Rf
YXNzZXJ0KGlndF9kZWJ1Z2ZzX2V4aXN0cyhkZXZpY2UuZmRfeGUsIHBhdGgsIE9fUkRPTkxZKSk7
DQo+ID4gICAJCWlndF9kZWJ1Z2ZzX2R1bXAoZGV2aWNlLmZkX3hlLCBwYXRoKTsgQEAgLTc2Niw3
ICs3NzYsNyBAQA0KPiBpZ3RfbWFpbg0KPiA+ICAgCQl9DQo+ID4NCj4gPiAgIAkJaWd0X3N1YnRl
c3RfZigiJXMtbW9jcyIsIHMtPm5hbWUpDQo+ID4gLQkJCXRlc3RfbW9jc19zdXNwZW5kX3Jlc3Vt
ZShkZXZpY2UsIHMtPnN0YXRlKTsNCj4gPiArCQkJdGVzdF9tb2NzX3N1c3BlbmRfcmVzdW1lKGRl
dmljZSwgcy0+c3RhdGUsDQo+IE5PX1JQTSk7DQo+ID4gICAJfQ0KPiA+DQo+ID4gICAJaWd0X2Zp
eHR1cmUgew0KPiA+IEBAIC04MjUsNiArODM1LDE0IEBAIGlndF9tYWluDQo+ID4NCj4gPiAgIAkJ
CWlndF9wbV9zZXRfYXV0b3N1c3BlbmRfZGVsYXkoZGV2aWNlLnBjaV94ZSwNCj4gZGVsYXlfbXMp
Ow0KPiA+ICAgCQl9DQo+ID4gKw0KPiA+ICsJCWlndF9kZXNjcmliZV9mKCJWYWxpZGF0ZSB0aGUg
Y29udGVudHMgb2YgbW9jcyByZWdpc3RlcnMgb3ZlciAlcw0KPiBzdGF0ZSIsIGQtPm5hbWUpOw0K
PiA+ICsJCWlndF9zdWJ0ZXN0X2YoIiVzLW1vY3MiLCBkLT5uYW1lKSB7DQo+ID4gKwkJCWlndF9h
c3NlcnQoc2V0dXBfZDMoZGV2aWNlLCBkLT5zdGF0ZSkpOw0KPiA+ICsJCQl0ZXN0X21vY3Nfc3Vz
cGVuZF9yZXN1bWUoZGV2aWNlLCBOT19TVVNQRU5ELCBkLQ0KPiA+c3RhdGUpOw0KPiA+ICsJCQlj
bGVhbnVwX2QzKGRldmljZSk7DQo+ID4gKwkJfQ0KPiA+ICsNCj4gPiAgIAl9DQo+ID4NCj4gPiAg
IAlpZ3RfZGVzY3JpYmUoIlZhbGlkYXRlIHdoZXRoZXIgY2FyZCBpcyBsaW1pdGVkIHRvIGQzaG90
LCINCj4gPiBAQCAtODM1LDEyICs4NTMsNiBAQCBpZ3RfbWFpbg0KPiA+ICAgCQl0ZXN0X3ZyYW1f
ZDNjb2xkX3RocmVzaG9sZChkZXZpY2UsIHN5c2ZzX2ZkKTsNCj4gPiAgIAl9DQo+ID4NCj4gPiAt
CWlndF9zdWJ0ZXN0KCJtb2NzLXJwbSIpIHsNCj4gPiAtCQlkcG1zX29uX29mZihkZXZpY2UsIERS
TV9NT0RFX0RQTVNfT0ZGKTsNCj4gPiAtCQl0ZXN0X21vY3Nfc3VzcGVuZF9yZXN1bWUoZGV2aWNl
LCBOT19TVVNQRU5EKTsNCj4gPiAtCQlkcG1zX29uX29mZihkZXZpY2UsIERSTV9NT0RFX0RQTVNf
T04pOw0KPiA+IC0JfQ0KPiA+IC0NCj4gPiAgIAlpZ3RfZml4dHVyZSB7DQo+ID4gICAJCWNsb3Nl
KHN5c2ZzX2ZkKTsNCj4gPiAgIAkJaWd0X3BtX3NldF9kM2NvbGRfYWxsb3dlZChkZXZpY2UucGNp
X3Nsb3RfbmFtZSwNCj4gZDNjb2xkX2FsbG93ZWQpO1tKYW5nYSBSYWh1bCBLdW1hcg==
