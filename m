Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED14CC44508
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jul 2026 13:03:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A016A10E062;
	Tue, 14 Jul 2026 13:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M7UsXLIW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D336510E05C
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jul 2026 13:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784034210; x=1815570210;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Wjpe5vZWatH9NjF3G4rmsWSn8vlkx8BxYvX3I8Tfb1k=;
 b=M7UsXLIWQ+HZhkBti9ijhOAEhsMbpU2G40EyqyuX84w4MNozK4p4FBam
 mtJXIBS95sEnMdqL6W8r9hsR7qBQXsEUaH0bnezcGyClKmqWQbwvc2elX
 xq4EDlWQD7KgGY/FNM1hBCS0Jp8r3W8/nMkLCEDdcimVyQkdhPRcV0Fa9
 pFbh4/aB2VGwYmdZByRyP0ORw2S4dszHyoalKzIC+NbP3Uurq+756g4Zy
 lYDr5vZdZpQUZ9SSg8Bs9IHpmVFYknwjEb/CHf/yYQMdqS8eOnqR1VxZc
 wDS1ISzh4H5y9F4vjWPLcB6yXauXhGJRda/NLt6NCJ5YTD5fm6OLNMXGl w==;
X-CSE-ConnectionGUID: gBaRhqoKQA6uG+MpwjFb5A==
X-CSE-MsgGUID: EVJEdLIDTC2/VGF/O02cQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="95300419"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="95300419"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 06:03:29 -0700
X-CSE-ConnectionGUID: IIjiquQETn6hdDWGlWz9aw==
X-CSE-MsgGUID: 7d+4W5AZSFuiJ9h0D2XMDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="257816261"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 06:03:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 06:03:28 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 14 Jul 2026 06:03:28 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 06:03:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5zYaRypoXhd9mV/spMii55h8d8dfqAzdTgnkAbBZdssEMTIGpyzcbkXEwtcEQhw4nDcA/wbzvHf7pJmh9w5Bu44mn8pWdn+J+XhXzeLeIQEqM+YYkmMnpB1K56QwpRDuZnx5qlgq/gWCz2h3ax+P2GcydawTA15mHy4cX3qZ64Jqs0NvavIQOOX5k0VNkc+i/ZwfHDXq7moVJ/0zd13gMbgZjQWulmg2kc3r8dj4Ul7Ffiu4mZGmf6i3gwvWTBpAY2zH7ORKBX5jnuXa4gVgNHDDxdIVdYmKmCSLI3DSab4BUTwEqfDGra39neUlHnXqGbsN6Y2+2BynsXJ3bc4Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wjpe5vZWatH9NjF3G4rmsWSn8vlkx8BxYvX3I8Tfb1k=;
 b=vRcNZsbHsXgbLJJIKR3wabjowphrcGqBcLtvzGx3F6xhpYvqP4rpNNYUOm50MaDrEsJ+1XUSJ2nUpbTMvDNEn/DyXjZk2ZibqPIl0TWPdZ2BUoPv+WwDlHqddphZ76fdFa+olvUE531RXByV+PyH+8DXxXMdZJ9pJhmx6LIOr0+JK2TShKfJE8mqc1x90Aix9SqfXaQ9LGL3dIycKCky7U5WZSZ77J39DBplTIG192PWMZS3ESvuIgfP/5mJ94SXYYrawl5uX46bNic3VT3AXSQhghGSXTnOpW9VddlErV4Z/NV+qbIC6ceWKS3frf7MO3CXFiF8BPtk8fyyfAUGfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by PH0PR11MB7635.namprd11.prod.outlook.com (2603:10b6:510:28e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Tue, 14 Jul
 2026 13:03:25 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973%3]) with mapi id 15.21.0223.008; Tue, 14 Jul 2026
 13:03:25 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Grzelak, Michal" <michal.grzelak@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>, "Grzelak, Michal"
 <michal.grzelak@intel.com>
Subject: RE: [PATCH i-g-t v1 12/16] tests/kms_sharpness_filter: limit #outputs
 tested during suspend
Thread-Topic: [PATCH i-g-t v1 12/16] tests/kms_sharpness_filter: limit
 #outputs tested during suspend
Thread-Index: AQHdEqaofBsT+fpc30eECs2u9QzjRbZs/EVg
Date: Tue, 14 Jul 2026 13:03:24 +0000
Message-ID: <IA1PR11MB6467A9718AEB60E607D3A09CE3F92@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20260713085515.463575-1-michal.grzelak@intel.com>
 <20260713085515.463575-13-michal.grzelak@intel.com>
In-Reply-To: <20260713085515.463575-13-michal.grzelak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|PH0PR11MB7635:EE_
x-ms-office365-filtering-correlation-id: 00085b2c-3a77-4645-8fa8-08dee1a84a48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|38070700021|4143699003|3023799007|11063799006|5023799004|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: DP3VePFry5d4eoDgNXq6mNi7DsdOYyUMbiz3IvDLPBIpar6YU5+YIhYpTPXI5mNxxjWZCUo7XmfdxgU5rdmPxN6qmg95SFUcYBhxNwEDYYmPpHvFnaTZ7ER9BFMzAekNmUIu4zv/5f/Qy+H/5rCb5R8WKmk3o6ignUbPBmxqaLxfBXphAHzjigpN8EyM4GYElzXJDCg7DoadMoxnHSLHLN6T/l8s0eva3aJH9uGBElwwL45MgHTp77Re6B4Gd5McBuZN8dvSImGDiNegNkZaLuHuWBdXw+GeBr0iZPPeC9LZTwtPDUqtwKi5zI8MY+Lc9nq6ozNngC+W7nTWikqhqt6HhH8hg8nqwf5wubXLXBE4ZNmlUXLHc4DiIDfM6ctyPzJXzlZ/nw549dw/bo/icas2c0qsg5uPmlOUfWfsq8UrEmpHG7BxPeLR23z7JnRO9tECSFu+HPdi+l8a3vhk9HpcUmscCyClaPlUuxxYgfHrPHBOch/LZd40MiHEI4AhlPPhxXXTnXWM1+Hq+I61ortUfUm/S3R+XN612c1oyFHqF5DHIFai85SBUg5y0vBQHWRg3cYDJagBvEl4LM8jQnFBiPqFeqvMjh5Sm/mugAYiVraqoQHQ9W+B5r5KTCgT7VzQsuvNmH8nkVYML89goqpR3tFln1JBL9wAx114oYcl/YWpZ4gJGg6CaVyDJawDRFvVIGhEieRa1fNKLg9fzfz3YizaIulo9rXnTlaS5v0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(4143699003)(3023799007)(11063799006)(5023799004)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmMvbXh0RWhEejFyVTJ3bVdOQ1pBOEZ6OVNkbXhUZDBiUWp2a2hYWlFrTFZl?=
 =?utf-8?B?TnJ4eU1KNnFseTBpbVhzTnZjQ0wwbTUvUjQ3QXpnRUorNThGYlV0bHNmZWVY?=
 =?utf-8?B?cnBHQWxSNkhlaXJYU0dWM3NNTXA0aERJTjRmaVh0SXBjS08xRXN5UFJ0WDM3?=
 =?utf-8?B?WnJLbkVyVTRucDVBdE1pVmJoRjB2Y2pTbUpadkQ3VXJTalMvV1lUck5Ud0hW?=
 =?utf-8?B?dVlCSW00cHN3cWRpeUdGLzVIaE5xNFNEWGlodG1NUjQwU2hpdEppbFNRc1Vq?=
 =?utf-8?B?SGYrQ1hoYkI0R2hQT2R6dG52N3NwRHVybjQ5Vmt2ZTZNbkc0ZFI1S08vTWRh?=
 =?utf-8?B?bFlXUTMwa2VYeFRMWUpyQXlCT0dWdG1haGNoNDJ5cHZiUnQxdm11SEZrN2wx?=
 =?utf-8?B?c0lLTWpBdng3bEhidi85ZTdyc1RMUzYyTjY0WDg5N2NTb25IY3BTeHBrdkNo?=
 =?utf-8?B?OHVYa2R0OVZ5VnNJR3BvM0czeStUTlFhdWY3azJPOWJuK01FT3lsUkpxbWtP?=
 =?utf-8?B?SlJHWmttSGFjRnNDUnc4MTIxU2Z6WXFDN3hIQzhqMklQS213NzI5WjM2ZmlE?=
 =?utf-8?B?QXBuV1VrWVNPM21mMmhWMnUxWWZwNnhJeEhBTG04Z3RVK015K0cxYllwSzZa?=
 =?utf-8?B?cFhQdlhBQzRFYWdMVWtsYnMzdnlLek1neTZ3Q0loanVrSjl0L1VuWThFQjNL?=
 =?utf-8?B?REQ0T3hYWi9WNGZPZ1RkektLUHdVN003VXBhTkpPWjRIZnZjdTQwSHFTdXQx?=
 =?utf-8?B?UDRVaytic2h3MlIyNXlPV3lKMU14bVpDYlk3NnowN3ZXQ29UUFZlM2hGVWJh?=
 =?utf-8?B?YmQ4ZlVhaXo1L0NvZytNb0w3bUphajlaWU5rNERVZTlJNmlsQXlOUGNzRjdV?=
 =?utf-8?B?VThUZE5XVEF2WE5CWU81UUJqL3kzMXNkZGk5Um85K1RZSVZzVUlnS0FTbmta?=
 =?utf-8?B?cjduanFZU0YxYTdxT1Zpd3RRVzllckVRbEIySTJOa0prbjA1bU1tblNGSzNr?=
 =?utf-8?B?czVzK015S2RIQWZQeTlTQURPcy90VmY1Y1JJUDEzOFdQN3RlS3FUOUlmNzJi?=
 =?utf-8?B?YUwrcktSUHFxUXVJZzkrTXgvRkxIb25STzlUNlNyWDF2YUNRdWZOT2NTbkE5?=
 =?utf-8?B?YnFZbVptbGZCUG5HdXlwbEdBNE5OV2JQeGxYUUJkK25wbXc2dXRhdFdhRTZL?=
 =?utf-8?B?WVBsQjgvTWxrNE53ZzhyYnlvYVAzME42Qk0wTDBja2Z2UkdMdXN1TVdScmpO?=
 =?utf-8?B?dm84bUZ1ZFRPTG5IYk1HOXkvOFVpcjYzNzdBUFJhVERlV2NDa044RlpIQjFn?=
 =?utf-8?B?RTd0SUMvRlE5ZWsxa1gwa1daZkJZaFArYnFyVHN5SENMVFNZTDJiSXJpUFNr?=
 =?utf-8?B?OUZyUkFuYk1IdXREWFZXWktlcWNBR3BKVE82cElIQmJQVzRTWjR4T1JRME41?=
 =?utf-8?B?TzZ1b0pYNnF1djNXK1ZQMUw2R2krOWdZQlJOd0FLZmJDMUEwYmNoSXFiTkxB?=
 =?utf-8?B?K1NPY2FwZkk0WXVwWTRLaTRLQW9qTDNMbTJEUmhXUC9KdUJLKzhUT2I3ellw?=
 =?utf-8?B?K0JJd1ljV3dMOURSSjZ5cFUwNlZ4aU94Z2VrVDFGa3ZUcmtmTS9QQ1FpbXlH?=
 =?utf-8?B?TGxzN3ZWYW0vQ2R1Wm5tc3NqRmgwbTBpSFUzWGtucitIQzNldmdqKzJJY2RC?=
 =?utf-8?B?UWJxcGE1eDN3cEJyL3RZSEJhaWh4UlltN3BDeEk1T2l3KzdtbFpvZ3ZXUDEr?=
 =?utf-8?B?emc2Q0xWZ0FkUWorQWRoODVXY1lzQkZjdlNHNFJkWUZnd0VIMmtFYUtGVk9N?=
 =?utf-8?B?NTJYV0pqZDFFV250N0UzRk5sOHdSZFUxZDRDaWorMUQ1L1MyTWtvUUVEY3I5?=
 =?utf-8?B?ajV6UlV0U1AvY0pQNnlmVlI3cXFJYWNsc1d0UUZtR1hYZUNSVTBUOC94TXc1?=
 =?utf-8?B?NUVpRTl3SndPY2ZqUXB6WGlpMlNUM21qclpnODllOGlWd2dvV1FZNWdIK1ox?=
 =?utf-8?B?M2N6YUFvZ2lmUnpQTlhyMXhMSkxLNkYvVitGU0czZ2hMZ2QzMnZYUDQ4TEF6?=
 =?utf-8?B?QzhvRlFHd0hHRTExaWNmdG5tQ3ZNVlVub3BkeUZTR0dPRENZVFlUeFJxaE9J?=
 =?utf-8?B?V3Y4OWVrV2cwdFhRS1dmcUYwaFVadms4azBncDk5ZEhCRTF0ZWdQMnluTktI?=
 =?utf-8?B?K0hKdXM3UHdWSkVhbCsyOHZ0aDlvYmMzbHV1YmJwa0VOUGsyOTRwRFlEaU1V?=
 =?utf-8?B?WlF5bWJGMFNaV0l0MXBwSnJVeEZKcTgwTHhFRGxta1cybU1rQ1BUUTBGUjVu?=
 =?utf-8?B?eG9aWUcwYlBpNU03S2tkZEFGaktZWW02SUVKOStiT081ZmpLcHZMUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: B8lrj7/T0tm+fBw9XfLVIMOWdriaMir+ZTDq7Sd0Ef/o0DSUR9RD9K101fBka/23BJXM8xijsV3AajVc2b5IvMw5Cy30BNGBdo1lp1nqS8W/SOWbDLoYeqppRMPZ3JHc2nu30PV1JfftXx5T8d/HjanzGfUyqyzE1vH8Z1XiIakv1Q6zcJcQzF/GLIFnC9gpz5W0f4ymZmvCCObGiYI0W6DGATauyO/cTvrvdo0lyuYmGR2wgJzcnTHKYf3UCuqkNRjrSZRV9DM9XooE5VUu+BXXZ2Mipm6e3q9JwtzEroaKeAcLcl49I3DToEgg6a3FVWlyrwtYUFpU1b1iEwWFdA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00085b2c-3a77-4645-8fa8-08dee1a84a48
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2026 13:03:24.9890 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MjAx6KltoCqre/DEQ3K/P+QaDBp3j3BeoHASvIPpUDmDUPVRf2BXEEHkhpp+SD6+T8Qk6Nb00whdSPsNRCgjrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7635
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIE1pY2hhxYINCj4g
R3J6ZWxhaw0KPiBTZW50OiBNb25kYXksIEp1bHkgMTMsIDIwMjYgMjoyNSBQTQ0KPiBUbzogaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFRoYXNsZWVtLCBNb2hhbW1lZCA8bW9o
YW1tZWQudGhhc2xlZW1AaW50ZWwuY29tPjsgR3J6ZWxhaywNCj4gTWljaGFsIDxtaWNoYWwuZ3J6
ZWxha0BpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdCB2MSAxMi8xNl0gdGVzdHMv
a21zX3NoYXJwbmVzc19maWx0ZXI6IGxpbWl0ICNvdXRwdXRzDQo+IHRlc3RlZCBkdXJpbmcgc3Vz
cGVuZA0KPiANCj4gV2UgYXJlIGl0ZXJhdGluZyB0aHJvdWdoIGVhY2ggb3V0cHV0IHdoaWxlIHRl
c3Rpbmcgc3VzcGVuZC4gVGhpcyByZXN1bHRzIGluDQo+IGV4dGVuZGVkIGV4ZWN1dGlvbiB0aW1l
LiBJbiB0dXJuIHRoaXMgbGVhZHMgdG8gaGl0dGluZyBDSSBlbmZvcmNlZCB0aW1lb3V0Lg0KPiAN
Cj4gQnkgZGVmYXVsdCBsaW1pdCBudW1iZXIgb2YgdGVzdGVkIG91dHB1dHMgdG8gMy4gVGVzdCBl
YWNoIGNvbm5lY3RlZCBvdXRwdXQNCj4gd2hlbiBwYXNzaW5nIGNvbW1hbmQtbGluZSBwYXJhbWV0
ZXIuDQo+IA0KV2hhdCBpcyB0aGUgcmF0aW9uYWxlIGJlaGluZCBudW1iZXIgMy4NCg0KUmVnYXJk
cywNCk5lbWVzYQ0KDQo+IHYxLT52Mg0KPiAtIHJlbW92ZSBhYmJyZXZpYXRpb25zIChKYW5pKQ0K
PiANCj4gU2lnbmVkLW9mZi1ieTogTWljaGHFgiBHcnplbGFrIDxtaWNoYWwuZ3J6ZWxha0BpbnRl
bC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMvaW50ZWwva21zX3NoYXJwbmVzc19maWx0ZXIuYyB8IDE4
ICsrKysrKysrKysrKysrKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwva21zX3NoYXJw
bmVzc19maWx0ZXIuYw0KPiBiL3Rlc3RzL2ludGVsL2ttc19zaGFycG5lc3NfZmlsdGVyLmMNCj4g
aW5kZXggZjJlM2ZjOTQ5NC4uYWRlYzRhNjBjNSAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwv
a21zX3NoYXJwbmVzc19maWx0ZXIuYw0KPiArKysgYi90ZXN0cy9pbnRlbC9rbXNfc2hhcnBuZXNz
X2ZpbHRlci5jDQo+IEBAIC03NCw2ICs3NCw4IEBAIElHVF9URVNUX0RFU0NSSVBUSU9OKCJUZXN0
IHRvIHZhbGlkYXRlIGNvbnRlbnQNCj4gYWRhcHRpdmUgc2hhcnBuZXNzIGZpbHRlciIpOw0KPiAg
ICogaXMgc2VlbiB3aXRob3V0IGNvcnJ1cHRpb24gZm9yIGVhY2ggc3VidGVzdC4NCj4gICAqLw0K
PiANCj4gKyNkZWZpbmUgT1VUUFVUX0xJTUlUIAkJCTMNCj4gKw0KPiAgI2RlZmluZSBUQVBfMwkJ
CQkzDQo+ICAjZGVmaW5lIFRBUF81CQkJCTUNCj4gICNkZWZpbmUgVEFQXzcJCQkJNw0KPiBAQCAt
MjMxLDYgKzIzMyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3VidGVzdF9lbnRyeSB7ICB0eXBl
ZGVmIHN0cnVjdCB7DQo+ICAJaW50IGRybV9mZDsNCj4gIAlib29sIGxpbWl0ZWQ7DQo+ICsJYm9v
bCBhbGxfb3V0cHV0czsNCj4gIAlzdHJ1Y3QgaWd0X2ZiIGZiWzRdOw0KPiAgCWlndF9jcnRjX3Qg
KmNydGM7DQo+ICAJaWd0X2Rpc3BsYXlfdCBkaXNwbGF5Ow0KPiBAQCAtNjE0LDkgKzYxNywxNiBA
QCBydW5fc2hhcnBuZXNzX2ZpbHRlcl90ZXN0KGRhdGFfdCAqZGF0YSwgZW51bQ0KPiB0ZXN0X3R5
cGUgdHlwZSkNCj4gIAlpZ3RfZGlzcGxheV90ICpkaXNwbGF5ID0gJmRhdGEtPmRpc3BsYXk7DQo+
ICAJaWd0X291dHB1dF90ICpvdXRwdXQ7DQo+ICAJaWd0X2NydGNfdCAqY3J0YzsNCj4gKwlpbnQg
b3V0cHV0X2NvdW50ZXIgPSAwOw0KPiAgCWNoYXIgbmFtZVs0MF07DQo+IA0KPiAgCWZvcl9lYWNo
X2Nvbm5lY3RlZF9vdXRwdXQoZGlzcGxheSwgb3V0cHV0KSB7DQo+ICsJCWlmICh0eXBlID09IFRF
U1RfRklMVEVSX1NVU1BFTkQgJiYgIWRhdGEtPmFsbF9vdXRwdXRzICYmDQo+ICsJCSAgICBvdXRw
dXRfY291bnRlciA+IE9VVFBVVF9MSU1JVCkNCj4gKwkJCWNvbnRpbnVlOw0KPiArDQo+ICsJCW91
dHB1dF9jb3VudGVyKys7DQo+ICsNCj4gIAkJZm9yX2VhY2hfY3J0YyhkaXNwbGF5LCBjcnRjKSB7
DQo+ICAJCQlpZ3RfZGlzcGxheV9yZXNldChkaXNwbGF5KTsNCj4gDQo+IEBAIC03NjYsNiArNzc2
LDkgQEAgc3RhdGljIGludCBvcHRfaGFuZGxlcihpbnQgb3B0LCBpbnQgb3B0X2luZGV4LCB2b2lk
DQo+ICpfZGF0YSkNCj4gIAljYXNlICdsJzoNCj4gIAkJZGF0YS0+bGltaXRlZCA9IHRydWU7DQo+
ICAJCWJyZWFrOw0KPiArCWNhc2UgJ28nOg0KPiArCQlkYXRhLT5hbGxfb3V0cHV0cyA9IHRydWU7
DQo+ICsJCWJyZWFrOw0KPiAgCWRlZmF1bHQ6DQo+ICAJCXJldHVybiBJR1RfT1BUX0hBTkRMRVJf
RVJST1I7DQo+ICAJfQ0KPiBAQCAtNzc0LDExICs3ODcsMTIgQEAgc3RhdGljIGludCBvcHRfaGFu
ZGxlcihpbnQgb3B0LCBpbnQgb3B0X2luZGV4LCB2b2lkDQo+ICpfZGF0YSkgIH0NCj4gDQo+ICBz
dGF0aWMgY29uc3QgY2hhciBoZWxwX3N0cltdID0NCj4gLQkiICAtLWxpbWl0ZWR8LWxcdFx0TGlt
aXQgZXhlY3V0aW9uIHRvIDEgdmFsaWQgcGlwZS1vdXRwdXQgY29tYm9cbiI7DQo+ICsJIiAgLS1s
aW1pdGVkfC1sXHRcdExpbWl0IGV4ZWN1dGlvbiB0byAxIHZhbGlkIHBpcGUtb3V0cHV0IGNvbWJv
XG4iDQo+ICsJIiAgLS1hbGwtb3V0cHV0c3wtb1x0XHRFeHRlbmQgc3VzcGVuZCB0ZXN0cyBmb3Ig
YWxsIG91dHB1dHNcbiI7DQo+IA0KPiAgZGF0YV90IGRhdGEgPSB7fTsNCj4gDQo+IC1pbnQgaWd0
X21haW5fYXJncygibCIsIE5VTEwsIGhlbHBfc3RyLCBvcHRfaGFuZGxlciwgJmRhdGEpDQo+ICtp
bnQgaWd0X21haW5fYXJncygibG8iLCBOVUxMLCBoZWxwX3N0ciwgb3B0X2hhbmRsZXIsICZkYXRh
KQ0KPiAgew0KPiAgCWlndF9maXh0dXJlKCkgew0KPiAgCQlkYXRhLmRybV9mZCA9IGRybV9vcGVu
X2RyaXZlcl9tYXN0ZXIoRFJJVkVSX0FOWSk7DQo+IC0tDQo+IDIuNDUuMg0KDQo=
