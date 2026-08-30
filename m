Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D8AC61DE1
	for <igt-dev@archiver.kernel.org>; Sun, 30 Aug 2026 19:55:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4170D10E16F;
	Sun, 30 Aug 2026 19:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fqYTHZRM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E095310E16F
 for <igt-dev@lists.freedesktop.org>; Sun, 30 Aug 2026 19:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788119689; x=1819655689;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DoFT9ZeRgfmCEyD2T/7pqrmIu2ZIIYUvfjs6IwbVdlc=;
 b=fqYTHZRM6B06DkyUD/bOdDVPwGM6w/3wAjg9L9ZQay1yoi9RXQlzTwiW
 sx/zejhojFG4kPzaznMKxExsGqt7WLgJ4fWxEFFJqDh4DCHIFScLXPOwf
 jgJkywQoPYAwt1N1FBSZS+4K3xhEUJURyTYMA78qfIpokeCpzUiLK2RP8
 I6Fo2J05pTOQ9UhJ5bt2lSjEhJ5jIXrzZw8AAhrmMdcffqUTumM1Xq7r6
 Qw451V63Ji85H3iJLFBvHq+sbH7pTb7NfXGDwlVvNLtzZEnv+MRfyvf+L
 XptpDgf1BUUcXVKmFB07SDteb1bjF2koOgxQ0MHeqrVTaOVPfGxrM1QlN A==;
X-CSE-ConnectionGUID: odCZblk3Sr2km7kwh8sCWw==
X-CSE-MsgGUID: D2o8vG7TQN+IyLPzY1p91A==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88557265"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="88557265"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 12:54:49 -0700
X-CSE-ConnectionGUID: 14MVcmhoTQWY2WC2wwjFfg==
X-CSE-MsgGUID: eTBRxRVZT+SN/bQcJ83MiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="272426266"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 12:54:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 12:54:48 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 30 Aug 2026 12:54:48 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.16)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 12:54:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I97+6pdPUcFlk/Nfnu/ugW0zdi/NTeVRdet8l2Ct571yXMushRutABWQs+bllSo0CN+yRpyOG1squdv6vQbjCcwjy8g+aNDt3Fh+AZoz73YoDrhfefYY53pZoy1hfW6JNnh2XN3LjYFPs0DmsVgjEPLOTO5Y7LfDVA3bj/o1LL29pzg/tL55lqxS8RMdWo1ZWq9FoRg+A+Zao+a0HKBfAosjkWYZ2iHdlQRRl7VX48MR4jsmh7+UC+KOYZ7mnCYGcUdIg38CU1XNoD41G+IjZwr6708bxjxt5iYF2w87h1iVWWAkhx50ZuYH36+Y/HZAf9oC0dJcQ9BaiGyHuLhv/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DoFT9ZeRgfmCEyD2T/7pqrmIu2ZIIYUvfjs6IwbVdlc=;
 b=hRrXeS47U0pi5WnBGuT0INLG2zmjWq0xF4jPJetUN1479NUAWUUANgWKREYrKWZRggmkmlwt1iXvWlNWHeOooVJQkTKe4jxUJRO7GEOV1A7SVNENWT+W71+M0Fg9U6mNy5Lf3AXjcLkEBlAsj559xy1MIOwW9EKkO+94BAQuhouH6s4uey6vkbgD97eAzPJDGRgN+YQ7HjrF0vRo8Kg4pDrN+MR1DN99vg0NYQCFVA93ovr/hivO9vOa5V+he9NZhPWDM57JTmEz1x5Vn/iFU//Uq2F2NVPAQAmrj6aqoQVQneELSsXkiNyOfJaXTeIz+W1TWnFhakHJeUREjXKEkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 by CY5PR11MB6319.namprd11.prod.outlook.com (2603:10b6:930:3d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sun, 30 Aug
 2026 19:54:40 +0000
Received: from CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03]) by CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03%5]) with mapi id 15.21.0360.008; Sun, 30 Aug 2026
 19:54:40 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "Grzelak, Michal" <michal.grzelak@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Garg, Nemesa" <nemesa.garg@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t v3 16/17] tests/kms_ccs: limit #crtcs tested during
 suspend
Thread-Topic: [PATCH i-g-t v3 16/17] tests/kms_ccs: limit #crtcs tested during
 suspend
Thread-Index: AQHdMWt1eLiVCq3c/EO+1ktSLpm3y7a3DrwAgAABA0A=
Date: Sun, 30 Aug 2026 19:54:40 +0000
Message-ID: <CO1PR11MB491333FE20F2F31ACE81CB62E4AA2@CO1PR11MB4913.namprd11.prod.outlook.com>
References: <20260821124834.1974029-1-michal.grzelak@intel.com>
 <20260821124834.1974029-17-michal.grzelak@intel.com>
 <863a7231-efb1-4944-a601-268bfdbceb61@intel.com>
In-Reply-To: <863a7231-efb1-4944-a601-268bfdbceb61@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB4913:EE_|CY5PR11MB6319:EE_
x-ms-office365-filtering-correlation-id: d1625e9b-120f-4b6c-f6d3-08df06d0878e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|23010399003|1800799024|376014|38070700021|56012099006|10067099003|4143699003|5023799004|11063799006|3023799007|18002099003|22082099003;
x-microsoft-antispam-message-info: ebe8BUd1OXDi4UfX32IS8ry2rCoH/5yl4X70YtEr0y0jyl8Ch3DEhd1Zxmrd3TFoBog92LalTj2NKi8evnsnOKD93KuGdY1aNE5wOOWqxAxk3PAq3NmSnyuPv4EB/O4ovSkpm0BGcLymxZcAdwEGCiHCHxEanoaPkryThGvZqGQ+lpEEKqzqVph0RD+H3CHc+uRMgKkJs70ZydFWYR7d2/B5uE2jnGwqpUyQUoAlRByqjgEdciE41Ps72/b3WcVx1SasUV/R0pdfhbcQF9R6oyRpNSYubU3w2W5gjjERnYRDzcmog/ZgnaluAYxSVgAbX1bE4AlVtyeCqCyvSywXiNyHGFi+WuQKPlkM4oDNSSbNS8xzneAYP0TCrhQ550aL+b9HPSl/BwPkMIg8i16WBSdSxI74iWXXFQeK4qjiVZIaw5KiDKfTI42O83PrAOJcZzemSNziniRaRlUjqIgacbW4+C1ke4EEjzup309MKmKEKDTmNlzCvYVfkji8f4OK52mQEcbaFDx/V963REEvdqni29t0fzw+xFUM98LMUmelw6lxKolfURllGbDKi0682K/TjH7Xh5s2JIMo39KuNZHm6YmtATZEdWPsDYiJeS0N7Sub8hbksEZxPlrWGPEssNNVl3Yk/prbJyKk1NftOx726TrSYp6sl1O2GSLWhKedvFJmJ3TA4jHzr06ZvC49Gf0996XpQpD+6QXLbJc3R1jowUeN6SAPa/X/+54SkaY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4913.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(23010399003)(1800799024)(376014)(38070700021)(56012099006)(10067099003)(4143699003)(5023799004)(11063799006)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SnlzS29yTzloRktEd1pDejJWd3RiY21mWDJNbW90bkxwYjNaMnY1ejFTK1BK?=
 =?utf-8?B?NzFUNUNnZEZURkVjeGU0U0Z1TXM4UHpkNjFjLzFHaG00dmRpWXNFNUlFN2dI?=
 =?utf-8?B?bVA5SDJtaXhScTVGTmlQTEkwNUNqMFpXZkNHYWQreVBLK0pUTjQ4KzhNSDJJ?=
 =?utf-8?B?VzR6L1pwZDVIWmROdEVPUy9LcWJCUFpRWFByYzZLZ3h1L0k3RU15WDY5bmNj?=
 =?utf-8?B?WHk2RWJ0SEtjWThNSDdsSFN4cklVNkluRStHNTJZZy90VkxwQ0hqbU92Umpm?=
 =?utf-8?B?b3FZZDFOdUI1MXRoOWJLSWFWYnlqZ3A2Y3BCeHFsSTdyRHBTOHBLR29yNUk0?=
 =?utf-8?B?WTFMR01sdGwxQU5oOWJLUCtlRHo3S1lxR1htRmxkTVcyOVA3dVlFZFl4MTZl?=
 =?utf-8?B?MVB6Y1BPVzBtRUtMMHdzbWlxVzBYanYvSHYvY3VuUGEwWEJ1NTBqK3JtR2pn?=
 =?utf-8?B?SWh5MlQ3Zm56SjRoMGFTbDB3dm56WGFYMEQ2TXpWSXduZkpZTnd0N3F5Mi9L?=
 =?utf-8?B?OHJFbGhYOU40NXNucXByc1JzTUd2Q2lyUkNJTHVUNW84NVkwWnVJWkFMeWNP?=
 =?utf-8?B?WDhCeXNJam5nRk95MEkrZlNUbVV3VTltZ2FWUGJTekxFdFpZWEZsVWtFSmht?=
 =?utf-8?B?NUprVXRSaFJlR0p0dU1UblRwMW4xc2lVTGJDNVdHM0FrSVN0QlRKNEV4THpR?=
 =?utf-8?B?bjQ4SktGdEM2QnJWcEViYWJqQVdOa2o3VjdxdWhtNGJaT3FUY2R1anBQTDlI?=
 =?utf-8?B?WHFGZTFvT3JSS2Q0cDluMUF0QmtQZGVTWVpsem1ScWg1dzNHT0ZZS29GR1g4?=
 =?utf-8?B?Yi9ST0EwNEk0NVJKWUx4dGg4K01semNjdjNxYUV2QjV5emN2SDRuUW9BOHRj?=
 =?utf-8?B?UlJjSllHeW9ZVml5UStXcnNWbXZTZjdNTnFDM1lvVDJwZ3NvYWloVkJLRzFr?=
 =?utf-8?B?RGlNcndTa1BOdDk4NTJHUWkrQjFJcnd2T3VwbkJXck1uZ0RLdmlvcndvRnND?=
 =?utf-8?B?ckpkRnZWdDZIU0lIWFM0YmNRYlhMOEVZeUlPb0Jjc29na2oyL2lqUjNUbVpp?=
 =?utf-8?B?Zm9NeWtGZWQ3WFJKTURWU0VqenRXWFhWQ0lVTkl1UDhZZFJkUmFERzlveXJL?=
 =?utf-8?B?cEo4cndIK2tzbTN1T1hCSGxpbjRRNUZqYngwVXFxWVhaNUxtY0FITmtsN3hD?=
 =?utf-8?B?UzVINVZhakJMRDZzRUcvdmw3dUZFcXZXMHRxNy9mQS9rbSthbnNuQ0gwQ2lD?=
 =?utf-8?B?Vm1rQ2FXcGdpZ2ZlNzNZVi9HTXRnMDJES1YvUmxUSXdLR1Bpd3FVN2E1cHZt?=
 =?utf-8?B?cDFHOVlIRzdrMXZHRkc3cHdDbktHUThjOEk2M09iYXZ0S1hTSktvNW9JSURu?=
 =?utf-8?B?TUdhTW5NM1Q2MlZCckplUW1RTHRISm9xTHo1TUZpQkdKTWVWUWtSa3NKTnNS?=
 =?utf-8?B?VUpnbXYveUF6bjNZdmlJTkk0Z3ppSW9TYmMwT1RvODRtc2dhSTIvRGgxUHJU?=
 =?utf-8?B?WXpteE5jcURMMWxSRlpHNFBEL3lIbEg0SHdkNUt1aFlzU3VzcFFub3EvN0lh?=
 =?utf-8?B?elZVMmVrd3ZsTXF0WmJuMDRzTTBtYUdvWm9oS3dRaTR2Mlp6dmxYVE5BVVVB?=
 =?utf-8?B?MWZ6Mng1ekxnZ0h3cnZOTjhBVWl6VUJ1SWFVaHdtTDUvN1o4MGZyZzRlS0xv?=
 =?utf-8?B?K3d1N20wVFhWU1hKTWdJYm0yenFKQ3orZWc3NkVXckNUM2pib0lKdEhDWHVh?=
 =?utf-8?B?QW9DL3ZXMFpMU3VqTmhPaXFMMnhKR2l3ai83R2dPMWJQN3MwR1hkc0swTmQv?=
 =?utf-8?B?aGlnU0dxeWNDY0lhM1AyZGJkbUFYVi9FM3B1QkcyWWR5Mm1yMW1SZGxPQ0ww?=
 =?utf-8?B?Qk9EaWdueVRsRjVUMFlLeU9waFZHMVZHU0RCcUkrUloxa2JZYWlWSnhYQVJR?=
 =?utf-8?B?MCtuWWFNUG91NSsrbUd4aHJMZlZwY2R2RXVrSThIZENpY2d5UFVoYXJSdjVJ?=
 =?utf-8?B?R1JFaXJhVVRtK1J0NFNmYXg3alJJNnR5cGtLS2ovazNhSlV3WkpFcG4rTm1Y?=
 =?utf-8?B?SGs4UWVlSnAzT0VJK0YvYmpHZUpLWVN5RVRIUXYzMGtWcTB5TjkydW1uZEJH?=
 =?utf-8?B?OW5UWU1lKzlGVjFJalE4TnNPWTJPa3N3U08rQ1Q2dWQ1cnhnd09yWE8yN1NT?=
 =?utf-8?B?Tzd3SEJiREdBcGljRHdpaTY2S1lva21aK2x5a0tIM0RWWThEemR1RFlnOHF2?=
 =?utf-8?B?ZmFjcFZDVkpCb2s1LzBtc2l3MzBtV20xUGNPQnZjV0prcEpuMnN4K2ZGT202?=
 =?utf-8?B?V25VOGdEeDNhSFV4aTFuYXJaV3VjZ09Ldmltclg2OWZHSlhwRFI3YlhJTWNq?=
 =?utf-8?Q?65xPFsoD2wFCRjxwfnmeLvumrvgH/cogfmGe25TV1T7Bz?=
x-ms-exchange-antispam-messagedata-1: Okl0DjnIHvrfnw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: aNce6Jcr8lExGhW6q0bvVxQ2nFTluv+TbpaO7SJtcwCkKwVqOy68ZLtLJUOuwgAI7oLqSuoZYKSWRgWpGwMq0NvAc1T6heLFagLavXfjm2kuIXYZYVI2HpKpZY9K8hEhqE48qRIJ6wvgTlL4tpLRS1gCVmaS4Tw/lBJ0tYwvypPe3UCwo8J2Cq0yG1qUAf31hxWzFLJx2sIAvCuuxsezIOG0o7dhkoblBJjebUj/21zFVL1eKjBp9kC+gubzY32DDW8WN/Ntt7rD1LxzLLbxX3N8sie11uWFgPR3ssW61cNTvX+TCibCyMCWQv63axVbThOJl2ZIguyyUrld1SHGeA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1625e9b-120f-4b6c-f6d3-08df06d0878e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2026 19:54:40.6954 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZPOfSdqWxVfnLwsvgAbAqRQBveommZ+zXM0HAgAAKtsdtfu5fAtR5rJkhQfPDOE+6nRoiag/A8LEywjTb1ZwTSilXTI3SHpoeL+p886lkeU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6319
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

VXBkYXRlIHRlc3QgcGF0aCBhdCBzdWJqZWN0KGluIGFsbCBrbXNfY2NzIHBhdGNoZXMpIC0tPiB0
ZXN0cy9pbnRlbC9rbXNfY2NzOiBsaW1pdCAjY3J0Y3MgdGVzdGVkIGR1cmluZyBzdXNwZW5kDQoN
Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBUaGFzbGVlbSwgTW9oYW1tZWQgDQpT
ZW50OiAzMSBBdWd1c3QgMjAyNiAwMToyMSBBTQ0KVG86IEdyemVsYWssIE1pY2hhbCA8bWljaGFs
LmdyemVsYWtAaW50ZWwuY29tPjsgaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBH
YXJnLCBOZW1lc2EgPG5lbWVzYS5nYXJnQGludGVsLmNvbT47IEIgUywgS2FydGhpayA8a2FydGhp
ay5iLnNAaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCBpLWctdCB2MyAxNi8xN10gdGVz
dHMva21zX2NjczogbGltaXQgI2NydGNzIHRlc3RlZCBkdXJpbmcgc3VzcGVuZA0KDQoNCk9uIDIx
LTA4LTIwMjYgMDY6MTggcG0sIE1pY2hhxYIgR3J6ZWxhayB3cm90ZToNCj4gTGltaXQgZXhlY3V0
aW9uIG9mIHN1c3BlbmQgdGVzdHMgdG8gZmlyc3QgYW5kIGxhc3QgYWN0aXZlIENSVEMgdW5sZXNz
IA0KPiB1c2luZyBgZXh0ZW5kZWRgIGZsYWcuIFRoaXMgcmVkdWNlcyBkZWZhdWx0IGV4ZWN1dGlv
biB0aW1lIG9mIHRoZSB0ZXN0Lg0KPiBJbiB0dXJuIHRoaXMgY2FuIGxvd2VyIGNoYW5jZXMgb2Yg
aGl0dGluZyBDSSB0aW1lb3V0Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYcWCIEdyemVsYWsg
PG1pY2hhbC5ncnplbGFrQGludGVsLmNvbT4NCj4gLS0tDQo+ICAgdGVzdHMvaW50ZWwva21zX2Nj
cy5jIHwgMTQgKysrKysrKysrKysrKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwva21zX2Nj
cy5jIGIvdGVzdHMvaW50ZWwva21zX2Njcy5jIGluZGV4IA0KPiAxMWJjMzA3NjljLi4zYWViMWE1
N2RmIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC9rbXNfY2NzLmMNCj4gKysrIGIvdGVzdHMv
aW50ZWwva21zX2Njcy5jDQo+IEBAIC0xOTEsNiArMTkxLDcgQEAgdHlwZWRlZiBzdHJ1Y3Qgew0K
PiAgIAlpbnQgZmJfbGlzdF9sZW5ndGg7DQo+ICAgCWJvb2wgZG9faGliZXJuYXRlOw0KPiAgIAli
b29sIGFsbF9vdXRwdXRzOw0KPiArCWJvb2wgYWxsX2NydGNzOw0KPiAgIAlzdHJ1Y3Qgew0KPiAg
IAkJc3RydWN0IGlndF9mYiBmYjsNCj4gICAJCWludCB3aWR0aCwgaGVpZ2h0Ow0KPiBAQCAtMTE1
Nyw2ICsxMTU4LDkgQEAgc3RhdGljIHZvaWQgdGVzdF9vdXRwdXQoZGF0YV90ICpkYXRhLCBjb25z
dCBpbnQgdGVzdG51bSkNCj4gICAJCQl9DQo+ICAgDQo+ICAgCQkJZm9yX2VhY2hfY29ubmVjdGVk
X291dHB1dCgmZGF0YS0+ZGlzcGxheSwgZGF0YS0+b3V0cHV0KSB7DQo+ICsJCQkJaW50IGZpcnN0
ID0gZGF0YS0+ZGlzcGxheS5jcnRjc1swXS5jcnRjX2luZGV4Ow0KPiArCQkJCWludCBsYXN0ID0g
DQo+ICtkYXRhLT5kaXNwbGF5LmNydGNzW2RhdGEtPmRpc3BsYXkubl9jcnRjcy0xXS5jcnRjX2lu
ZGV4Ow0KLS0+SU1POiB0aGV5IGRvbuKAmXQgZGVwZW5kIG9uIG91dHB1dCBzbyBjaGVja2luZyB0
aGVtIGluc2lkZSBtYWtlIHNhbWUNCnZhbHVlcyBvbiBlYWNoIGl0ZXJhdGlvbi4uLg0KPiArDQo+
ICAgCQkJCWlmICghZGF0YS0+YWxsX291dHB1dHMgJiYgKGRhdGEtPmZsYWdzICYgVEVTVF9TVVNQ
RU5EKSAmJg0KPiAgIAkJCQkgICAgb3V0cHV0X2NvdW50ID49IE9VVFBVVF9MSU1JVCkNCj4gICAJ
CQkJCWNvbnRpbnVlOw0KPiBAQCAtMTE3NSw2ICsxMTc5LDEwIEBAIHN0YXRpYyB2b2lkIHRlc3Rf
b3V0cHV0KGRhdGFfdCAqZGF0YSwgY29uc3QgaW50IHRlc3RudW0pDQo+ICAgCQkJCQlpZiAoIWlu
dGVsX3BpcGVfb3V0cHV0X2NvbWJvX3ZhbGlkKCZkYXRhLT5kaXNwbGF5KSkNCj4gICAJCQkJCQlj
b250aW51ZTsNCj4gICANCj4gKwkJCQkJaWYgKCFkYXRhLT5hbGxfY3J0Y3MgJiYgKGRhdGEtPmZs
YWdzICYgVEVTVF9TVVNQRU5EKSAmJg0KPiArCQkJCQkgICAgY3J0Yy0+Y3J0Y19pbmRleCAhPSBm
aXJzdCAmJiBjcnRjLT5jcnRjX2luZGV4ICE9IGxhc3QpDQo+ICsJCQkJCQljb250aW51ZTsNCj4g
Kw0KPiAgIAkJCQkJaWd0X2R5bmFtaWNfZigicGlwZS0lcy0lcyIsDQo+ICAgCQkJCQkJCQkgICAg
aWd0X2NydGNfbmFtZShjcnRjKSwNCj4gICAJCQkJCQkJCSAgICBkYXRhLT5vdXRwdXQtPm5hbWUp
IHsNCj4gQEAgLTEyMzQsNiArMTI0Miw5IEBAIHN0YXRpYyBpbnQgb3B0X2hhbmRsZXIoaW50IG9w
dCwgaW50IG9wdF9pbmRleCwgdm9pZCAqb3B0X2RhdGEpDQo+ICAgCWNhc2UgJ24nOg0KPiAgIAkJ
ZGF0YS0+YWxsX291dHB1dHMgPSB0cnVlOw0KPiAgIAkJYnJlYWs7DQo+ICsJY2FzZSAnZSc6DQo+
ICsJCWRhdGEtPmFsbF9jcnRjcyA9IHRydWU7DQo+ICsJCWJyZWFrOw0KPiAgIAlkZWZhdWx0Og0K
PiAgIAkJcmV0dXJuIElHVF9PUFRfSEFORExFUl9FUlJPUjsNCj4gICAJfQ0KPiBAQCAtMTI0OCw5
ICsxMjU5LDEwIEBAIHN0YXRpYyBjb25zdCBjaGFyICpoZWxwX3N0ciA9DQo+ICAgIiAgLXMgPHNl
ZWQ+XHRTZWVkIGZvciByYW5kb20gbnVtYmVyIGdlbmVyYXRvclxuIg0KPiAgICIgIC1yXHRcdE9u
IHN1c3BlbmQgdGVzdCBkbyBmdWxsIGhpYmVybmF0ZSB3aXRoIHJlYm9vdFxuIg0KPiAgICIgIC1u
XHRcdFJ1biBvbiBhbGwgY29ubmVjdG9ycy4gKEJ5IGRlZmF1bHQgc3VzcGVuZCBzdWJ0ZXN0cyB3
aWxsIHJ1biBvbiAyIGNvbm5lY3RvcnMpXG4iDQo+ICsiICAtZVx0XHRSdW4gb24gYWxsIENSVENz
LiAoQnkgZGVmYXVsdCBzdWJ0ZXN0cyB3aWxsIHJ1biBvbiB0d28gQ1JUQ3MpXG4iDQo+IC0tPkNo
ZWNrIHRoaXMgcnVucyBvbiAyIGNydHMgb3IgMyBjcnRjcz8NCj4gICA7DQo+ICAgDQo+IC1pbnQg
aWd0X21haW5fYXJncygiY3NybjoiLCBOVUxMLCBoZWxwX3N0ciwgb3B0X2hhbmRsZXIsICZkYXRh
KQ0KPiAraW50IGlndF9tYWluX2FyZ3MoImNzcm5lOiIsIE5VTEwsIGhlbHBfc3RyLCBvcHRfaGFu
ZGxlciwgJmRhdGEpDQo+ICAgew0KPiAgIAlpZ3RfZml4dHVyZSgpIHsNCj4gICAJCWRhdGEuZHJt
X2ZkID0gZHJtX29wZW5fZHJpdmVyX21hc3RlcihEUklWRVJfSU5URUwgfCBEUklWRVJfWEUpOw0K
