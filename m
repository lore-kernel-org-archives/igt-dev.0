Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE442D2A537
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 20:53:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C53A10E089;
	Thu,  4 Dec 2025 20:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G6rg1jWp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8236410E089
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 20:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764881634; x=1796417634;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=iSa3DulPoPoAkzD2PGexCrvqR6U9Nw9rkItLlJZzeCU=;
 b=G6rg1jWp/fnhWnvxJ0WmX81mBB24ri6wV7wbnV2cfJyhKN/UpSX256Mv
 Hv55noU/+ZKleRXspMKQMXf3L+Kf6E/oD6EnOjVKBqY1jL/7EHviecdfJ
 lWAjOzhWmLw2hxRISaGRyxN3z+DXGn+U7ciFJVfg/XqZ9C5pfbilM0JuD
 RPIxetIFKjqmCstfmssBS3g3htIjCf0nlG2fyepX8CB8hB/J0NoLyFxEa
 Oa+0ZRM+2AyFsIu3gFf3Bju5+4/e8ACM4WQTunOKT2cNA32+j9qmVLtO7
 wgzQWPOwjaU8r+y0ugq8yVSnz0EShqWyCO1PhxmAa8iY/tfyQRTMji/iS Q==;
X-CSE-ConnectionGUID: OxCac/EITxKnX3meQmmerA==
X-CSE-MsgGUID: 7WSbHbLsSfOX3dP8BWTkDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="65913300"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="65913300"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 12:53:53 -0800
X-CSE-ConnectionGUID: 6XJOloinTDyhoYRK4u/pbQ==
X-CSE-MsgGUID: x4gpBYTsSJ6YOtWf0kJ6Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="218448475"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 12:53:53 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 12:53:52 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 12:53:52 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.36) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 12:53:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lnqxy4JTi07NUKOmg5btVKA3ZwCO2b2/2uo0vaBbUUT2YEILnJAb8shTBl10oTna0b+gBfaFV/B0P1IWykkoWUonztkGxerXPuSxj/3Zdj1lnamodyf8YAYsIfQQ1FqvDTg1s7Adwr65NHILOocKF9uxD0OWk65CQJeYShmymjV4Rmcp39hZ+X+t6h053WA3KQb90Xs6Nd3W1+UpAMnj0SmL1gXfxBUifmAEDbgx9636X3KluD+8FCtOdB2URoiZ/f5H6Aumd+J+pOAy/+svSpsW1MotFafynnzvq5axLczYIbvwCTBUxmRVAfL2PBloEH/OGPveNEzNoP20MqUcXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSa3DulPoPoAkzD2PGexCrvqR6U9Nw9rkItLlJZzeCU=;
 b=t5RUFrze/2bnH9vECOjGdi9QND+T1+cW0qsCE61ZViyya7jk4Z/BlTeKDrfZMe4dUhsTAkrMECM24P8qf47UBPieED29ED74JGOmW9OEgOGMvgApSeymJWdr0ASPqpWM9HGlMp6JyBw1e+J0lh17hLk8AVJSunl/4JKuKD7o7fSKzSgb2kxbYnKVLA+x+8I+H5HGUG3dV+p/JPFfDc6r3mtKHaX4dddaZXnZuNhivdctVMRr/6cuNXN9u0fIOT8vqTSCdNauxqTcwa2VcQdpNcPG6TsOKr9mL0x4nnetySS/RkDsOsiATTfQaXL1XRAo/fvd4iV5jn5+qGZH90v/vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 IA0PR11MB8418.namprd11.prod.outlook.com (2603:10b6:208:487::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 20:53:44 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 20:53:44 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v2 10/19] tests/intel/xe_exec_multi_queue: Add dynamic
 priority test
Thread-Topic: [PATCH v2 10/19] tests/intel/xe_exec_multi_queue: Add dynamic
 priority test
Thread-Index: AQHcWpr+Q1ovI0Eq2kyvyD6Mx4W6ZbUSCu8A
Date: Thu, 4 Dec 2025 20:53:44 +0000
Message-ID: <93071ea09d4c61137273fc1714c94c7317218562.camel@intel.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-31-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251121035715.767226-31-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|IA0PR11MB8418:EE_
x-ms-office365-filtering-correlation-id: 13f6f9a9-6132-436c-7612-08de337736bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?QnBNL1k2MUtWTnhTeU1tdS9RR3pQRlh0THB1NzUxN2lQTE1aRFBPTGFodUpP?=
 =?utf-8?B?V2NYdWlQODdMbE9DQUsxcU02dmRTMXJYa3lKNm5lSllEUG5sazZOWkpMU0xq?=
 =?utf-8?B?UURUTVpURkZ1cWlFUmdNRVBFYVJBSU9aVmJOVnYrWlVPazZwZGRHWDdLT2FM?=
 =?utf-8?B?S25WOCtrU05PbFFYd1ZUMzB5ZVJFRXpGdXNPVDVpUHV4LzlSbnJhVGpIdzJW?=
 =?utf-8?B?U1Qwc2hYOUIrSTZNRW55TU5iVDJRcUVGSldoN2hKQksybzdYZE85L3BaR2Jz?=
 =?utf-8?B?OUdkU2p0TlRORmRLanVCeVJwYVVhS0pvb1h0SXdrdmxtNDFnV0tCN3gvTkNC?=
 =?utf-8?B?Uk1wUlpiNlFvQXgxS2pRNkl3T0JWK1h2ZGtXU0xBMGowVENzc2tqTE9tQTJV?=
 =?utf-8?B?cU5JMTlyQ0JxdFBHMGRlNHczUmNNQU5KVncrdFZiRFRZQ3Eva0JMaUJDT3dN?=
 =?utf-8?B?alhRRWhnU2JKQW9MWEVyVWZJVk5pV2k0MU9mUlkySlpCZEJYcFpaNzdkcXFw?=
 =?utf-8?B?WnB5SEZnclZMVlg1ajJJeDRYYitvSXFlVlR3c3RleG5iTW15UGoyckZibGJu?=
 =?utf-8?B?cU0vUjNwUjZWbTFBK1NPU0NFRzNOYiszMDk3a21IUTRwTThWeW1VeVlBTXEv?=
 =?utf-8?B?MzZYWDc1aWJBUXl2WnJMSnRYeGUyZ1BXTjFGRkI2L0p6SjJwSU8vQ1FHSmI4?=
 =?utf-8?B?SkpFWHk3UDFUbzFpOGh3OTNyTm95UVJqS1FPVHVoVmhyWVloNzF1U29GWEts?=
 =?utf-8?B?R2xGbkkvbk5nWkdPMTFDamYzRTg2TkVXdGRJUnZUckVVRVB0Nyt4aGxnUFdN?=
 =?utf-8?B?Q292SExxVmkxcytQYlJObEU4ang2Ym9UaWFsRngzR3lzNUI3TEJ3dnV6VjdF?=
 =?utf-8?B?QUVwZ1cyQklGQUxHb2piZG9OOXcraUUrR0RCNGdxZjZNcUdyL0tweE9KbFFJ?=
 =?utf-8?B?NUJ6d3d3SklscVBPNzliWEtWUWxKZlM3c0JQdlFqUlhBKzJtRXYrelAvVW02?=
 =?utf-8?B?SmRjZ1hXaFZRbkhBNVZGQ1Q1ZTVwcDIvemxxMzFYcklWM2xvM2txaHBubi9x?=
 =?utf-8?B?cXlhL3E1ZTQyRXJOblFnVjJocUhMNGI3KytlUVhKTVpuKzlyMGpJWTMzeTht?=
 =?utf-8?B?Qk1XSFZ2SEcyK3M0OGpubEJZNTVSbGkrRnF3c29wWHp4MEVsMDFtZHhRdXhC?=
 =?utf-8?B?Q3hPbTg4aHkwbFFBeUhtazFMUEhBd1RkczZSMCsvcHpMaGE1WjF0V2ZkbldK?=
 =?utf-8?B?N2RtNmhBZGJDMnptNEtNWndlQkM3d3NaSEpiQXV2dG1WVkxncXgxQ2FHT3Rn?=
 =?utf-8?B?eEREdzhvcVlpZXpWZjFGelo2Yi9ScFp1aTJXS0pwcHkxeEtCQUR0RFFiLzZU?=
 =?utf-8?B?WTJmMjJ3YTF2UVd4Q0dNWlNEZkVjbmZ5dzBjdlRNZm1HaXpSdmpXRDZCbmd5?=
 =?utf-8?B?Q0ZaWTloU0JJUlpRWGtzZExCdFJkZTVUVXJKN3Ivc0dlTUpVT3hRcHFGWVVE?=
 =?utf-8?B?d1BuZFFRZ1p6TXZKRHQwZ0w5RUlneGlhVDc0NDRlRkNnK2NJeEZkKytxVnpO?=
 =?utf-8?B?eHNzUUxqTk1hK29iQWdtYlZNTFZaU0RvZ3Y3QzY0SE1rRlNHQkhWNGFxaUgr?=
 =?utf-8?B?eVl3NFppSUh0Kzl4QUp3eHhwclYxMVNKakpJMFBZQVJzT0JxVGg0K0RzOEha?=
 =?utf-8?B?T1JjR3k3Y1dXaFRxSHdNWkZrUURKNjBvUWRWTGZNUlZnS05CQ3pLTjNoS2Vt?=
 =?utf-8?B?Z3NxYktlTlhJdXcvWm5ueWxVUmFjTStJRUdaekFsV2cveXZHVmIxZ1VVWWFk?=
 =?utf-8?B?Mi9DcUg0R2J0SUpndnQwanc4NWJJZXprL3B4R0lHRmtrNDhvMHYvYW5NSG9U?=
 =?utf-8?B?S2lBUnp0SEtUSUE0MkFoMlNGaWxIQ0lHeTlIVFlzc3RPNWQrb1p0NHF3NmRH?=
 =?utf-8?B?dW5DaVBLaGNUcEptWjUvSVBCbTdtemNlVTB6Tkx1Vjk0M1NrNldGSERYOHFi?=
 =?utf-8?B?VUVBV1BuM0tlVENVRzU5SEFHemxidHV2cHJDbmtDZ2g3UGxkeUtXazkvbTFr?=
 =?utf-8?Q?bXTZXc?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V2JRMXlSUzJsczgxSE1MZ0ZFZFJkVHlrY1Y0UVhMVEVpRXZHaGUxamFCNkVn?=
 =?utf-8?B?Vm9TYlZ0M2pNWjc0V3cyUEh5WE1MUEh5TVJPcmJ5eWs5QUVWSHZ5MkhTRG5P?=
 =?utf-8?B?dGg2S0JSQjNQRXBGeFYvMTdYUWhIcGRidXpNUE03NVp4TE9wMXlYZWJSY2pW?=
 =?utf-8?B?andxKzdJd2o4K3o4SFYxVGhhWUJyVUJKemQwR2RGQkZKdDlacTh3b1l5SXlz?=
 =?utf-8?B?TWRvSDBEb0FKeFpSOTA0cFZjK3UzUk5ZRnlnWUR3a2lDM1NXeWdpWUtqb3RF?=
 =?utf-8?B?MC9hU2luaXk4a1cyUlNRQlZyL1M5RVI4TGp1dXRBcHc1bWYwWEplcWhzd1Vp?=
 =?utf-8?B?ODB5MkZQM2NFYVVFdTNLMkxqU2NkZWRQT2UvT1FMNTJ1d2VCQVlGM3hHUXhO?=
 =?utf-8?B?cnRmVlQ4QTl2eDVFTzRhYTR4WkE4bWJ6R3pCSU5CWU1QTWlncExTSGFmWGVT?=
 =?utf-8?B?S1hpVnpMWmozeEFlYTJXdDlJZEZNNG9XWWtqdFkySlJEQmlPZ1RLcnNmQ3VM?=
 =?utf-8?B?RVRSWElTcUpIbCthdG1odXpJTDdtYWtsek1kTkV6ajhMYmhHREVUdTdIS1Bw?=
 =?utf-8?B?TFQvT082bjMvQUpUb1dwZ2ZXaFoxUHdERE84YlNOUTdldlJpNUlsWGs4b0ZC?=
 =?utf-8?B?cmZVU1JCc0FWdS9pampabGRON2dZdWV6T3ArOGlOMVU5a2J1cmhXbGVHV1hy?=
 =?utf-8?B?L3NoYWtRV1phdzNaVnRUS1Y1M0piMEVJYmRZSVVPNko1NVhJQWVrL3A2RGtk?=
 =?utf-8?B?TU9QV2xGbjRiZVAyMnQvaTB0MjhVWi9wODBuVGg5MzhiU1BGUVFlWmhHaGg1?=
 =?utf-8?B?RkV2TUtEUEMzM2lCUWFRcUoyTlF6OFZseHF4VUJPb2hOa3hxMkQ5dUl3Vm1j?=
 =?utf-8?B?VjA2VW12T2lXaFVUWitEVXMvYzN4b3QyOCt5U2w3ODFHYTk0Y2JJVEFqZWkr?=
 =?utf-8?B?RmxoSk1kbFp4amhEdXZlSUZOZ2l0amlxY2gvOStVdkdRdi9sWFIyYnZ2Vjhq?=
 =?utf-8?B?cm5VNFBRMTFjWjFwb0JKT1B6a0I1Qi9MSFBSUU15UnpjN2R2VEZUSnp1cGdQ?=
 =?utf-8?B?Z1l3SGhMank5aHRaNWQzenZsQm1TMUl0eW9vbWN1WW9ZbmRReS8rTVZRV1hR?=
 =?utf-8?B?eGNRSTBWSVpOMUNpdnZiSWJuRDNwcHZCNDg2dGJhSlNHU1o0KzJTL29IbmJl?=
 =?utf-8?B?bjhQaUlQNHVrVnJaaERkZGRkRFZvbUFVVThudnNnd1orTnYxdEh5a0grUlVT?=
 =?utf-8?B?OHozWlNQOXVuN3hVYmpkUTdYZ0RHK3hSOFBONGo0R1owVFBHWWtjeTZveEVm?=
 =?utf-8?B?Q0t3bzJTRHY0Z1dSbDQwaXBqN1VkM3kxZnZsMUU1RHk5OHIvQ0gwN24vUlMw?=
 =?utf-8?B?bUU0NDBwbU1YQU1VYUVwa2ZlcS9KTmphdDhYd0ZQMTlEMm8zb0pvRmhZRE9J?=
 =?utf-8?B?ZDhCQUwvaStGcUEzZVBubkI5d1NYSnJ0OU85T2xLcUFKeXhaUW5UZzA4WkVJ?=
 =?utf-8?B?N1N1eEswWWtNM1Z5WTYybU5uUjVNRFN5Z2YxZklaQ21aZXZBeGxvMXlQRmVm?=
 =?utf-8?B?ZU5acmN5YXB2ZW9VWTBKOUJnMGRyVzYvKzh1cFVFU3p2RTV0czQ5N2U0dnJz?=
 =?utf-8?B?UU1SRytkZG1zK0NuMkwzbUpOWVZTM3lOcGNEWkpmVko1N3J2dnVMbndXQjUr?=
 =?utf-8?B?OHVDOUNsT1NtWU9WU0d0ZkFtYTRVL2VMdFh5QzBqMDdOY1VlNm9DSSt1Q2t2?=
 =?utf-8?B?eXhpTkZwR3hPdUhWa2NNVmVDdUw0Zkk4YTJTbmFYK1J1emlJSmFib25scFpX?=
 =?utf-8?B?SHp6V2todmdLZDBWcmNWbGRGcFR4YzN5Qm1hRnFuNXZaS3hPM01weE1XVzB3?=
 =?utf-8?B?SkZZcHpnby85Q1h6aklEanpXam9aL21KaThvMklEc2hFaW5CeFlkT21ZaHky?=
 =?utf-8?B?LzMwVkw4V09OZUM4c0M3TDdyOGwySXlMb2VRK2t4anJDQWRIV3JZMFhCWmtl?=
 =?utf-8?B?QUJJYW9icDNneDVMeTErQTVZUnhoQXlMVTVoUExleW4yVmhJNUZmVzBZWVJq?=
 =?utf-8?B?R1ZrN0I4VDROSHdYOXFlL0VGQk5kRFFYNzkxK3pnQ0JZU2hCYUpjbXMyL2hD?=
 =?utf-8?B?OVdmdVVLTnZJM1FLWjVJS0NNc1RFVXA2dHg4cW5jRHFEeE9jbFpyMmtvc2cz?=
 =?utf-8?B?UEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F289125B8F5FFB4FABEE6FDFFBB7C639@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f6f9a9-6132-436c-7612-08de337736bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 20:53:44.5221 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: paGglMlADOVamcdEcEBZcRYVgeh1GkW2njHpQ5XUI39nto5/ab64xUAA8xcCsN0Myh4JddZ+4kBqkG/WJmI2QUOKYzaTskhZ07d4BXynkhk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8418
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

T24gVGh1LCAyMDI1LTExLTIwIGF0IDE5OjU3IC0wODAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IEFkZCBzdWJ0ZXN0IGZvciBiYXNpYyBmdW5jdGlvbmFsaXR5IG9mIGR5bmFt
aWMgcHJpb3JpdHkKPiBjaGFuZ2UgdXNpbmcgc2V0X3Byb3BlcnR5IGlvY3RsLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFBhbGxhdmkgTWlzaHJhIDxwYWxsYXZpLm1pc2hyYUBpbnRlbC5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogTmlyYW5qYW5hIFZpc2h3YW5hdGhhcHVyYQo+IDxuaXJhbmphbmEudmlzaHdh
bmF0aGFwdXJhQGludGVsLmNvbT4KPiBSZXZpZXdlZC1ieTogUHJpeWFua2EgRGFuZGFtdWRpIDxw
cml5YW5rYS5kYW5kYW11ZGlAaW50ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IFN0dWFydCBTdW1tZXJz
IDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+Cgo+IC0tLQo+IMKgdGVzdHMvaW50ZWwveGVfZXhl
Y19tdWx0aV9xdWV1ZS5jIHwgMTYgKysrKysrKysrKysrKysrKwo+IMKgMSBmaWxlIGNoYW5nZWQs
IDE2IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXhlY19t
dWx0aV9xdWV1ZS5jCj4gYi90ZXN0cy9pbnRlbC94ZV9leGVjX211bHRpX3F1ZXVlLmMKPiBpbmRl
eCAxZTMzYzVkYjguLjVkM2EyMDllNSAxMDA2NDQKPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9leGVj
X211bHRpX3F1ZXVlLmMKPiArKysgYi90ZXN0cy9pbnRlbC94ZV9leGVjX211bHRpX3F1ZXVlLmMK
PiBAQCAtMjksNiArMjksNyBAQAo+IMKgI2RlZmluZSBQUklPUklUWcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCgweDEgPDwgMSkKPiDCoCNkZWZpbmUgQ0xPU0VfRkTCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAoMHgxIDw8IDIpCj4gwqAjZGVmaW5lIFBSRUVNUFRfTU9ERcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAoMHgxIDw8IDMpCj4gKyNkZWZpbmUgRFlOX1BSSU9SSVRZwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCgweDEgPDwgNCkKPiDCoAo+IMKgI2RlZmluZSBNQVhfSU5TVEFOQ0Ug
OQo+IMKgCj4gQEAgLTMwNiw2ICszMDcsMTIgQEAgdGVzdF9wcmVlbXB0X21vZGUoaW50IGZkLCBz
dHJ1Y3QKPiBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2ksIGludCBudW1fcGxhYwo+
IMKgCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBleGVjLmV4ZWNfcXVldWVfaWQg
PSBleGVjX3F1ZXVlc1tlXTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGV4ZWMu
YWRkcmVzcyA9IGJhdGNoX2FkZHI7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBpZiAoZmxhZ3MgJiBEWU5fUFJJT1JJVFkpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9leGVjX3F1ZXVlX3NldF9wcm9wZXJ0eShmZCwKPiBleGVj
X3F1ZXVlc1tlXSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAK
PiBEUk1fWEVfRVhFQ19RVUVVRV9TRVRfUFJPUEVSVFlfTVVMVElfUVVFVUVfUFJJT1JJVFksCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gWEVfRVhFQ19RVUVV
RV9QUklPUklUWV9OT1JNQUwgKyAocmFuZCgpICUgMikpOwo+ICsKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHhlX2V4ZWMoZmQsICZleGVjKTsKPiDCoMKgwqDCoMKgwqDCoMKgfQo+
IMKgCj4gQEAgLTQzOSw2ICs0NDYsMTEgQEAgdGVzdF9sZWdhY3lfbW9kZShpbnQgZmQsIHN0cnVj
dAo+IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVjaSwgaW50IG51bV9wbGFjZQo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKGUgIT0gaSkKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzeW5jb2JqX3Jlc2V0KGZkLCAmc3lu
Y29ianNbZV0sIDEpOwo+IMKgCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChm
bGFncyAmIERZTl9QUklPUklUWSkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHhlX2V4ZWNfcXVldWVfc2V0X3Byb3BlcnR5KGZkLAo+IGV4ZWNfcXVldWVz
W2VdLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+IERSTV9Y
RV9FWEVDX1FVRVVFX1NFVF9QUk9QRVJUWV9NVUxUSV9RVUVVRV9QUklPUklUWSwKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiBYRV9FWEVDX1FVRVVFX1BSSU9S
SVRZX05PUk1BTCArIChyYW5kKCkgJSAyKSk7Cj4gKwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgeGVfZXhlYyhmZCwgJmV4ZWMpOwo+IMKgwqDCoMKgwqDCoMKgwqB9Cj4gwqAKPiBA
QCAtNTA2LDEwICs1MTgsMTIgQEAgdGVzdF9sZWdhY3lfbW9kZShpbnQgZmQsIHN0cnVjdAo+IGRy
bV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVjaSwgaW50IG51bV9wbGFjZQo+IMKgICogQHVz
ZXJwdHI6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHVzZXJwdHIKPiDCoCAqIEBwcmlvcml0eTrCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBy
aW9yaXR5Cj4gwqAgKiBAY2xvc2UtZmQ6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjbG9zZSBmZCB3aXRob3V0Cj4gZGVz
dHJveWluZyBleGVjIHF1ZXVlcwo+ICsgKiBAZHluLXByaW9yaXR5OsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGR5bmFtaWMgcHJpb3Jp
dHkKPiDCoCAqIEBwcmVlbXB0LW1vZGUtYmFzaWM6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHByZWVtcHQtbW9kZQo+IGJhc2lj
Cj4gwqAgKiBAcHJlZW1wdC1tb2RlLXVzZXJwdHI6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBwcmVlbXB0LW1vZGUgdXNlcnB0cgo+IMKgICogQHByZWVtcHQtbW9k
ZS1wcmlvcml0eTrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwcmVl
bXB0LW1vZGUgcHJpb3JpdHkKPiDCoCAqIEBwcmVlbXB0LW1vZGUtY2xvc2UtZmQ6wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcHJlZW1wdC1tb2RlIGNsb3NlIGZkCj4g
d2l0aG91dCBkZXN0cm95aW5nIGV4ZWMgcXVldWVzCj4gKyAqIEBwcmVlbXB0LW1vZGUtZHluLXBy
aW9yaXR5OsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwcmVlbXB0LW1vZGUgZHlu
YW1pYwo+IHByaW9yaXR5Cj4gwqAgKi8KPiDCoHN0YXRpYyB2b2lkCj4gwqB0ZXN0X2V4ZWMoaW50
IGZkLCBzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqZWNpLCBpbnQKPiBudW1f
cGxhY2VtZW50LAo+IEBAIC01NTYsMTAgKzU3MCwxMiBAQCBpZ3RfbWFpbgo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgeyAidXNlcnB0ciIsIFVTRVJQVFIgfSwKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHsgInByaW9yaXR5IiwgUFJJT1JJVFkgfSwKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHsgImNsb3NlLWZkIiwgQ0xPU0VfRkQgfSwKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeyAiZHluLXByaW9yaXR5IiwgRFlOX1BSSU9SSVRZ
IH0sCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB7ICJwcmVlbXB0LW1vZGUtYmFz
aWMiLCBQUkVFTVBUX01PREUgfSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHsg
InByZWVtcHQtbW9kZS11c2VycHRyIiwgUFJFRU1QVF9NT0RFIHwgVVNFUlBUUiB9LAo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeyAicHJlZW1wdC1tb2RlLXByaW9yaXR5IiwgUFJF
RU1QVF9NT0RFIHwgUFJJT1JJVFkgfSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHsgInByZWVtcHQtbW9kZS1jbG9zZS1mZCIsIFBSRUVNUFRfTU9ERSB8IENMT1NFX0ZEIH0sCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHsgInByZWVtcHQtbW9kZS1keW4tcHJpb3Jp
dHkiLCBQUkVFTVBUX01PREUgfAo+IERZTl9QUklPUklUWSB9LAo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgeyBOVUxMIH0sCj4gwqDCoMKgwqDCoMKgwqDCoH07Cj4gwqDCoMKgwqDC
oMKgwqDCoGludCBmZCwgZ3QsIGNsYXNzOwoK
