Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76207C021B5
	for <igt-dev@archiver.kernel.org>; Mon, 24 Feb 2025 13:32:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D5B10E39C;
	Mon, 24 Feb 2025 13:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JqizLQZi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4BD510E2C4
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2025 13:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740403928; x=1771939928;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LZz9Ql+JQLJsDhE3agGQmXLbvDHGafNSyY95Tb5ZwBo=;
 b=JqizLQZiSmTaYKtZea3S98YKp/CLF3MPphbVLj6pApDn1nItzUse62G5
 y1llfi6PNve+Dzd49CO/trPcgtXJZxhcZ+stGuUgoi6QtXD9sQGsSfUU+
 HEeqqSwVsA/+JrjCOIMsH/Agmmtrz+S22OpkYUFkSr179vzNoxQQAy6zb
 NWcLYqAvkwRdcMJCBpzxHk7+2IBfw2TaBzX/kCTvv/Pl6I/nuDac6y9MC
 W6HvNGcLFfb6me5LNOrMpWz2wRN3iiBM4D3PtQkwnqP8+5NOeuIB0xszO
 3dSKWlew4lynwwREJTAIYyARqQSnNCYd1Iz4J2oBoRHn5BA4tclzl/lf8 g==;
X-CSE-ConnectionGUID: uU15i4h/T7OA0rZjrIKcMg==
X-CSE-MsgGUID: rmc3NrZAS6qUJl3V9HcAKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="41172727"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="41172727"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 05:32:07 -0800
X-CSE-ConnectionGUID: wTt3UWvXRN2wzXqsQ1MrGg==
X-CSE-MsgGUID: YjDTRHu3TmehEshQOOXKMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="146911108"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Feb 2025 05:32:07 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 24 Feb 2025 05:32:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 24 Feb 2025 05:32:06 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 05:32:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9t0XW4ACCldIip83AIAxNc7AjOvO/sER189tl0D+fXgaqQrPj5plGqzDqU56bseIOafxonmS1/HzCbsFtjAAd83IB7qA7VMcff0kh6cioD1G8ZF7PZ7jURmdG++d5JEihcgv+JWxART5BaFvcFHIP0Eto928ALM12HhdRPMJs74VSQVoiTUnDQefrq2Awx9u/8YR8DjY1iS6dzrB0yuERfPJ69LIsbUUfqVvE7GjQI3MpBP3vH1lhQ/BlMFgXqK3AVQ1FcIOwi/PlP/8S8ppdbSEwWMpXqo8ktrcmymm2/JpIimUIRFxEq6zrFjSLtGe3UegZwWOHgrdxwUi5gksA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZz9Ql+JQLJsDhE3agGQmXLbvDHGafNSyY95Tb5ZwBo=;
 b=k2UpXz2YNE5yvQyLa3z/9gjPmIN1YBx/slVU/Mg4nLuTbqOymDlE4sgtmBDsCbIrYP4Ilo7JE2JsF+bSUpbRX7HLClNecA/7gWksLNDs62w00O1i1qTHoYQhSGDIKDqSpPt30HY2JFyGBNiLIS+iFYm2tI06rQI4y2cRzrqhvdPe4bOQcR16U4yyecSpKViFQDcJV/x1ZNP8VpYyVk+PRtyEzm7oK3MnZBHJ8xdT1Yq3S3+nlQCMK5SfLJGltUhpgvL83sVlXQsb3/PPhbJus15dJMkGC7RZAcWBwQccB2leHyZmsbsGeLsh/5jEWiCUH2Qk7xhdaDpIaIq5AlfOYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 PH8PR11MB6755.namprd11.prod.outlook.com (2603:10b6:510:1ca::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.18; Mon, 24 Feb 2025 13:31:59 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8466.020; Mon, 24 Feb 2025
 13:31:59 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>, Mika Kuoppala
 <mika.kuoppala@linux.intel.com>, "Laguna, Lukasz" <lukasz.laguna@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH i-g-t v2 2/2] tests/intel/xe_eudebug: Add subtests for
 eudebug/SR-IOV exclusion
Thread-Topic: [PATCH i-g-t v2 2/2] tests/intel/xe_eudebug: Add subtests for
 eudebug/SR-IOV exclusion
Thread-Index: AQHbg6gdg+RpWFYZp0GWuo2uRQTiW7NWeC/g
Date: Mon, 24 Feb 2025 13:31:59 +0000
Message-ID: <DS0PR11MB7264229868E4E77EC4343FB1D9C02@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20250220145912.37735-1-christoph.manszewski@intel.com>
 <20250220145912.37735-3-christoph.manszewski@intel.com>
In-Reply-To: <20250220145912.37735-3-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|PH8PR11MB6755:EE_
x-ms-office365-filtering-correlation-id: 47429376-eb71-43ab-9fce-08dd54d79dac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NU5iWGRlMGo1bTVHUmt2THV4WEtxci9QekphWkZjVXUzYVUrMHdDbEZ2Y1RF?=
 =?utf-8?B?K0FtS1g2cHo4ZXJ5TVByUFk2SDBDbHNGSTdSMzYvNDh1R09iSmNwYmZWejha?=
 =?utf-8?B?Y0RYQXpub2J6c01TSEZOWlc5L3NNZGtGNmxQUU9qOTE2dXFHNW5LOG9hcUpS?=
 =?utf-8?B?dlRvSlRDNEUwNjVWNXpqeDZUT21QMSs5bk50UUNtV3h0SUtGNW9aeHpUTTRy?=
 =?utf-8?B?citEaUs0ME1mN1p0Mi9FcmxCREtLZnJmcmpKS0hFVGhmK0FMOWZUeHcvL2lu?=
 =?utf-8?B?NnpXQWN1dS9sUnRJd2dLalcrSGJkMld0QzlxR2N5VHp2SkRickJtbWFzano0?=
 =?utf-8?B?NmU4TGJOSFdhZW42Tkh2c3V0eEtHWnFxWVB3SWRrL1JmNW54NExQS1lYYXlW?=
 =?utf-8?B?NzJlOFc4elIraTlET1Vvb1h4SDYrc1dlRDcrWFRWNUFzY2pVdDU3RmwwM0JH?=
 =?utf-8?B?UnRiTXNaV3NNd1pKL0dKVStPV21oMjRFTzlHNVFlMDFtempoa0p5VGw4bExo?=
 =?utf-8?B?bndQQVJFN0lFRlJ5Mzk5YmNyZDhWakVpSGdILzYzUGRReko1RW9KZjlBcGM3?=
 =?utf-8?B?eEhKZzBPZ28vMWw5WnU5QUhWMmNnTCtnQUpPSGxyZW4zN1ZDVlQ3WkFZYU12?=
 =?utf-8?B?cjQ0Z1pyMXlZZWpIMXM4MU1mbHg3QnRHdTkzQlBDYUdaQmFXcGloZkhQakxH?=
 =?utf-8?B?c3RJSjQrRE5hSmd1b0dxTU9tNCsyVUJKZytaRjNJekNLays0SmJZdGt6bXVZ?=
 =?utf-8?B?UjV3azgyaWlldXU1TTJnZHAwcTZFWXJqRXJQUkR4dFlqWGo3d2tHejlOb2RF?=
 =?utf-8?B?UHpxSUthdVoxQ0Y5TmlMOFBJRFpXYm1KT2ZTU3IyeUpMN09QL0lzTWQxNFdI?=
 =?utf-8?B?SjBRMkJDZzBjMnd1cU4vRkl5N0lKdjB1UGQxckRWRjlhVlZhZjRHK1Zka2ht?=
 =?utf-8?B?bG5oNUM5UUZ1Mkp6UU41R0JoNjR6N2k5c3RYQ25IbnJNVk9SdW1QM2w1TWJQ?=
 =?utf-8?B?TEtKSWh6TFdaNGY5d2RjVHZYVEx6OWd4Wll1V1A2Y0ZCVzF2aVBkalluMVpD?=
 =?utf-8?B?L3pacTVJTXl2SkVESGplVlNqY01mWnZhcEdwTVY3THJQL1FqL3lWa1BhUTB5?=
 =?utf-8?B?RVZNRDV2YnZKNW9WS1pZUU5ZNjF6UU41c3hKNklRNVE2c2xDb0VrL3JDb2RW?=
 =?utf-8?B?cVNwNWNIVmMwYnJoY3NTdWt0ZWpBRUFqVmxmZkNoM2R2YzRvODRBN1NHS0wy?=
 =?utf-8?B?cVdqdE9odG8zMlEyOUd2YUEvNC82RnVvWTc2bXRLWGh1a2FTSFUzc255aURS?=
 =?utf-8?B?NkFIUHc4ZGJVTWJ2Ly8zQmt5emI2WVphbkppK3lQRXNNNm4yZXlLZHZaVGI4?=
 =?utf-8?B?WXJTZ3Z1REVnTnpvWTg1WmpKT0Y2NzhjK25wV2VBd1hYalB6RzJ3WDhUTnBT?=
 =?utf-8?B?YzNNbWpjUGJPNFRwSXhlQnVpLzVLdVpTMmFUdTNCc0FUMk5Uc2VWTy9WNVFh?=
 =?utf-8?B?cGNSUGU4dU43UlR1Q3FodVR0T0w2NmxFRlQyQVJtZit3Y1RRT09CZ0dsQmJz?=
 =?utf-8?B?RDZ2RG1rREV5THc4ZWJvZHZjUHM5aExjT3pEUnZ0Y1ptRXltOXE3WWtUYlRx?=
 =?utf-8?B?Tk9JYkw2NEI5RzB3Y1BxTm5tRkhKdnhsWWszMUlSQjBjbkpZc0YzMVIzQmU2?=
 =?utf-8?B?VGxoVlRMWEg2SVcxMG8yRHVYbWt2TG5sMUs2a1BQcmlSM0F6bm9kSXZVMWtn?=
 =?utf-8?B?eTZaU0R2WnpTdFNCNkVKbUY1RFV5K1ZFa21hTlBRNlBBaDA1QnFmbWUrK0Qw?=
 =?utf-8?B?MWFWQ1ROQW9jVEZUeXk1TkFFYk1iSTZrYS8xV3pjeUh1VGJOVThFeGJoeWNO?=
 =?utf-8?B?TkNtRmRvQ3lVRXJSeS9rTFZPRXpYRmQyMTVOdGNoVFhyMHZCUGIrQUdoemlS?=
 =?utf-8?Q?w98r79xndkS0WyNlYSOepxbKw3w7FS//?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXYxZnBXbnhrRmVhUkMyRzd4MklGN251Uko3S1VIbURHM2l4SGEvSm11TG5x?=
 =?utf-8?B?UFdMRFhmRXU5SXFtN2dWUk5IekZRN2I2dHFvWkFDWndaakMyOUZBeEJjREF6?=
 =?utf-8?B?aHVnVit6Y1U5MUNJRFlDamNmczZCbjBRYnV1aTBUSnlid0dHUU1hTmo3TkE1?=
 =?utf-8?B?YzQyWVpIZWUzV0pkcCs3b3VYblRUSDZZZUg4KytXZXkzWGRKeXdOak9JV3Ro?=
 =?utf-8?B?V2lyZW5BL2J6Rjl6aFdGMUp4KzlwNVo0OTJaYU5iU0pXYWJ2YXIwNHZMaCtQ?=
 =?utf-8?B?MytRZzZBR3BNT1JucyttVkpXM0gxeXp4QXBNUjRpR1pCbFVmUFl4ZFYwNG43?=
 =?utf-8?B?QTE2ZFozUkZOaWhzQnV5Kyt0L1o3YkI2bU1aTitQV3g4WmJvL3FjRStWSzFn?=
 =?utf-8?B?aE14U25SamFpMFlNN3AwZ2EvNTI4QzBWYk52NTRhdzN4aFpVOHUvOHNSZERL?=
 =?utf-8?B?Ny9ISGFXWVFUdklRaVhnTVBFTDE1dnBkeFdPaWNJNm5DcVZKajFkMlRGY205?=
 =?utf-8?B?MXEvNDlQUkdLNGpzeWxwdFptRlltTmZma0tnRjZ1a3VQeFM3TlMwbXJueENO?=
 =?utf-8?B?MFlBODNiaTA1Y1diOGRSdFhJUnR5RURQdSswL1d5QlUrSDdKSFZsY044TnI0?=
 =?utf-8?B?UGtrdE0za2kvc3gyMDVVaTZoYUlkOHlNckh1Y1c2Q0pZRC9XT0VnL0c1MkdK?=
 =?utf-8?B?ZDdtaDUwdERDSHgrU3ZucmphRDB5a1Bac3JCa2pDSGpiMmNlU0RCM1BqbjJ1?=
 =?utf-8?B?cnV1Zk1jYVJQUXpPa2tHbU8xbkh5VmJPL24wK09yU1AxVXM0dTY1a1RGdlM5?=
 =?utf-8?B?cTV1NUVIaWN2aW01WEJYbUd1T3o2ZjJyVFhpd0VmZVZyemRiQXBFVkZic2Zx?=
 =?utf-8?B?MHFYUWVtNkhvdzVaYklvREtuY3hkelczOEtneTZaQkN0TFBlK05BTmVzbysz?=
 =?utf-8?B?RStISjJzWjhodWdXTXBuOENycm1BZmdHQmpjRXBGK3V5b0YzTG9nSERNR09x?=
 =?utf-8?B?dGxxdGdYdWhlY0wzVUVlUEZPOVEyek9OL0FhZEZuYzBIV2YzL1lYTHg3S2tu?=
 =?utf-8?B?YjJTL0VaRkVVdlp6WjlDaVBBWlE0ZlJpQmpSQURRZnFjeDNEek91Q3YwSkk2?=
 =?utf-8?B?YkFwRnY2ZGVqVm1ZNjRmVGJjbHZtNkJUb2VMc0MwRXhrRDNWU20vTTlTWnN3?=
 =?utf-8?B?NFY1ZFR1Z3BDRzhxTDY5NHluWmtDMmsxWkNLTXV1UzVDUkZXbU1VTFlPSjV5?=
 =?utf-8?B?RUlzUjhYS3lCK2FIOWZXWTdBOXh1bERLOFF5Uk9pelc5Ry93dTdOLzlFb3h6?=
 =?utf-8?B?YStuanhLTXF4c0NrQVhVYmxkb01ac1VsVEw5ZGtBVmNNVHpqZHZtbHdjcmgy?=
 =?utf-8?B?SmNaOVYzRWlwRkM3TVg1OE5kUTRGSFRkbm1CNExJTTdyK2ttOElXa1dNNkdD?=
 =?utf-8?B?SkVURDJrOUw2QTE0QjBFWGRTb3AyK3hSam9KYUF5TStRUnEwOUdJVzU5Wlpr?=
 =?utf-8?B?V1FUZ0NuSktSRlpLQUNoRDJhdjRINUkrUmg2S3JDTkRyR3NuSEVRY0xwK1Zx?=
 =?utf-8?B?dHN0S0hhYm5XdTkvYmpKRHd2empYclBWWURYZEozZEY4YWNKZEV0UWhJZWN0?=
 =?utf-8?B?U1pyWnRYcEluYU5FeWo5dkFUNVluTnpiM0VmOGxKU3NuR2dTZnVDWWpkbXFZ?=
 =?utf-8?B?c3V2RDRDUzU1STg1aGh0bWI0eUpKTUI5V0lONHN6Y2dYNmI5TmxmeHZMZi9Q?=
 =?utf-8?B?eFlVRnZlcTlJdTFXNzNtMVFRUDRJdjk3eEdPVHNwNmhqMS95Y1hYeG1ZdzV5?=
 =?utf-8?B?UFRqbWxab3Y2Y0hZQ3kybGZtVHNOVENRMGRYeHlVeEtNNjE0dE5OT2E1dmJT?=
 =?utf-8?B?VW1xWTBnNnJrMUdUeTZGcHE2SFlhbnpjakhxWVpvRW9FM093K3JBT0VaRHVu?=
 =?utf-8?B?alpKbjUzaG1qaDJHb2ZiQjMweVpEaElzMVpLOHQxNW1jN3dySHJETW1sS2xE?=
 =?utf-8?B?aVZBekJxSjVWNG4yaXZVQTZUejd5OVAyM0U1TGNsd2trL01VdzVYOXZLa3Z5?=
 =?utf-8?B?eDFUK0pGeXAyYXBlaTdkcXkzUkVZZHVBVjhONnVLckxVVzhTazB0c28yNVpQ?=
 =?utf-8?B?WjRuMTgwYTJucjJQYTFDOFRWUXliZ3M1WGRmV0srVSt6TlMxOEcrUzNTdlQr?=
 =?utf-8?B?cXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47429376-eb71-43ab-9fce-08dd54d79dac
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 13:31:59.6217 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wTCgUaGEWNc8CVKeX2diITcvL9Uo00a2TuPT2N7UYr5SseCkpILMZtr9jYrzpZaddjn2k3K4QAL1+TNNX19k10aksESrphGBfXPMWdTlbVhcdRXLkRTikKFeM73JHb1g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6755
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

SGkgQ2hyaXN0b3BoLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1h
bnN6ZXdza2ksIENocmlzdG9waCA8Y2hyaXN0b3BoLm1hbnN6ZXdza2lAaW50ZWwuY29tPg0KPiBT
ZW50OiBUaHVyc2RheSwgRmVicnVhcnkgMjAsIDIwMjUgMzo1OSBQTQ0KPiBUbzogaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFBpYXRrb3dza2ksIERvbWluaWsgS2Fyb2wgPGRv
bWluaWsua2Fyb2wucGlhdGtvd3NraUBpbnRlbC5jb20+Ow0KPiBHcnplZ29yemVrLCBEb21pbmlr
IDxkb21pbmlrLmdyemVnb3J6ZWtAaW50ZWwuY29tPjsgTWFyY2luIEJlcm5hdG93aWN6DQo+IDxt
YXJjaW4uYmVybmF0b3dpY3pAbGludXguaW50ZWwuY29tPjsgTWlrYSBLdW9wcGFsYQ0KPiA8bWlr
YS5rdW9wcGFsYUBsaW51eC5pbnRlbC5jb20+OyBMYWd1bmEsIEx1a2Fzeg0KPiA8bHVrYXN6Lmxh
Z3VuYUBpbnRlbC5jb20+OyBXYWpkZWN6a28sIE1pY2hhbA0KPiA8TWljaGFsLldhamRlY3prb0Bp
bnRlbC5jb20+OyBLYW1pbCBLb25pZWN6bnkNCj4gPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRl
bC5jb20+OyBNYW5zemV3c2tpLCBDaHJpc3RvcGgNCj4gPGNocmlzdG9waC5tYW5zemV3c2tpQGlu
dGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10IHYyIDIvMl0gdGVzdHMvaW50ZWwveGVf
ZXVkZWJ1ZzogQWRkIHN1YnRlc3RzIGZvcg0KPiBldWRlYnVnL1NSLUlPViBleGNsdXNpb24NCj4g
DQo+IEV1ZGVidWcgaXMgbm90IHN1cHBvcnRlZCBpbiBQRiBtb2RlIHdpdGggVkZzIGVuYWJsZWQg
YW5kIGluIFZGIG1vZGUuDQo+IFByb3ZpZGUgc3VidGVzdHMgdG8gZW5zdXJlIHRoYXQ6DQo+ICAg
MS4gZW5hYmxpbmcgZXVkZWJ1ZyBpcyBub3QgcGVybWl0dGVkIGluIFBGIG1vZGUgd2l0aCBWRnMg
ZW5hYmxlZA0KPiAgIDIuIGV1ZGVidWcgc3lzZnMgdG9nZ2xlIGlzIG5vdCBhdmFpbGFibGUgaW4g
VkYgbW9kZQ0KPiAgIDMuIGVuYWJsaW5nIFZGcyBpcyBub3QgcGVybWl0dGVkIHdoZW4gZXVkZWJ1
ZyBpcyBlbmFibGVkDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggTWFuc3pld3NraSA8
Y2hyaXN0b3BoLm1hbnN6ZXdza2lAaW50ZWwuY29tPg0KPiAtLS0NCj4gIHRlc3RzL2ludGVsL3hl
X2V1ZGVidWcuYyAgICAgICB8ICAgMiArDQo+ICB0ZXN0cy9pbnRlbC94ZV9ldWRlYnVnX3NyaW92
LmMgfCAxNTMNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICB0ZXN0cy9t
ZXNvbi5idWlsZCAgICAgICAgICAgICAgfCAgIDEgKw0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAxNTYg
aW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL2ludGVsL3hlX2V1ZGVi
dWdfc3Jpb3YuYw0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX2V1ZGVidWcuYyBi
L3Rlc3RzL2ludGVsL3hlX2V1ZGVidWcuYw0KPiBpbmRleCA3Njg3MDgwNWMuLjNlZWRkNTQzZCAx
MDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwveGVfZXVkZWJ1Zy5jDQo+ICsrKyBiL3Rlc3RzL2lu
dGVsL3hlX2V1ZGVidWcuYw0KPiBAQCAtMjAsNyArMjAsOSBAQA0KPiAgI2luY2x1ZGUgPHN5cy9w
cmN0bC5oPg0KPiANCj4gICNpbmNsdWRlICJpZ3QuaCINCj4gKyNpbmNsdWRlICJpZ3Rfc3lzZnMu
aCINCj4gICNpbmNsdWRlICJpbnRlbF9wYXQuaCINCj4gKyNpbmNsdWRlICJsaWIvaWd0X3NyaW92
X2RldmljZS5oIg0KPiAgI2luY2x1ZGUgImxpYi9pZ3Rfc3luY29iai5oIg0KPiAgI2luY2x1ZGUg
InhlL3hlX2V1ZGVidWcuaCINCj4gICNpbmNsdWRlICJ4ZS94ZV9pb2N0bC5oIg0KDQpUaGVzZSBp
bmNsdWRlcyBhcmUgcHJvYmFibHkgYSBsZWZ0b3ZlciBhcnRpZmFjdCBmcm9tIHYxLiBQbGVhc2Ug
cmVtb3ZlIHRoZW0uDQoNClRoYW5rcywNCkRvbWluaWsgS2Fyb2wNCg0KPiBkaWZmIC0tZ2l0IGEv
dGVzdHMvaW50ZWwveGVfZXVkZWJ1Z19zcmlvdi5jIGIvdGVzdHMvaW50ZWwveGVfZXVkZWJ1Z19z
cmlvdi5jDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMC4uZTgyZGZm
OThhDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvdGVzdHMvaW50ZWwveGVfZXVkZWJ1Z19zcmlv
di5jDQo+IEBAIC0wLDAgKzEsMTUzIEBADQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
TUlUDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IMKpIDIwMjUgSW50ZWwgQ29ycG9yYXRpb24NCj4g
KyAqLw0KPiArDQo+ICsvKioNCj4gKyAqIFRFU1Q6IFRlc3QgRVUgRGVidWdnZXIgYW5kIFNSLUlP
ViBpbnRlcmFjdGlvbg0KPiArICogQ2F0ZWdvcnk6IENvcmUNCj4gKyAqIE1lZ2EgZmVhdHVyZTog
RVVkZWJ1Zy9TUi1JT1YNCj4gKyAqIFN1Yi1jYXRlZ29yeTogRVVkZWJ1ZyB0ZXN0cw0KPiArICog
RnVuY3Rpb25hbGl0eTogRVUgRGVidWdnZXIgZnJhbWV3b3JrDQo+ICsgKiBUZXN0IGNhdGVnb3J5
OiBmdW5jdGlvbmFsaXR5IHRlc3QNCj4gKyAqLw0KPiArDQo+ICsjaW5jbHVkZSAiaWd0LmgiDQo+
ICsjaW5jbHVkZSAiaWd0X3N5c2ZzLmgiDQo+ICsjaW5jbHVkZSAibGliL2lndF9zcmlvdl9kZXZp
Y2UuaCINCj4gKyNpbmNsdWRlICJ4ZS94ZV9ldWRlYnVnLmgiDQo+ICsNCj4gK3N0YXRpYyBib29s
IGhhc19lbmFibGVfZXVkZWJ1Z19hdHRyKGludCBmZCwgdW5zaWduZWQgaW50IHZmX251bSkNCj4g
K3sNCj4gKwljaGFyIHBhdGhbUEFUSF9NQVhdOw0KPiArCWludCBzeXNmczsNCj4gKwlib29sIHJl
dDsNCj4gKw0KPiArCWlndF9hc3NlcnQodmZfbnVtID4gMCk7DQo+ICsNCj4gKwlzeXNmcyA9IGln
dF9zeXNmc19vcGVuKGZkKTsNCj4gKwlpZ3RfYXNzZXJ0X2ZkKHN5c2ZzKTsNCj4gKwkvKiB2Zl9u
dW0gaXMgMS1iYXNlZCwgYnV0IHZpcnRmbiBpcyAwLWJhc2VkICovDQo+ICsJc25wcmludGYocGF0
aCwgc2l6ZW9mKHBhdGgpLCAiZGV2aWNlL3ZpcnRmbiV1L2VuYWJsZV9ldWRlYnVnIiwNCj4gdmZf
bnVtIC0gMSk7DQo+ICsJcmV0ID0gaWd0X3N5c2ZzX2hhc19hdHRyKHN5c2ZzLCBwYXRoKTsNCj4g
KwljbG9zZShzeXNmcyk7DQo+ICsNCj4gKwlyZXR1cm4gcmV0Ow0KPiArfQ0KPiArDQo+ICsvKioN
Cj4gKyAqIFNVQlRFU1Q6IGRlbnktZXVkZWJ1Zw0KPiArICogRGVzY3JpcHRpb246DQo+ICsgKglD
aGVjayB0aGF0IGV1ZGVidWcgdG9nZ2xlIGlzIG5vdCBhdmFpbGFibGUgZm9yIFZGcywgYW5kIHRo
YXQgZW5hYmxpbmcNCj4gKyAqCWV1ZGVidWcgd2l0aCBWRnMgZW5hYmxlZCBpcyBub3QgcGVybWl0
dGVkLg0KPiArICovDQo+ICtzdGF0aWMgdm9pZCB0ZXN0X2RlbnlfZXVkZWJ1ZyhpbnQgZmQpDQo+
ICt7DQo+ICsJdW5zaWduZWQgaW50IG51bV92ZnMgPSBpZ3Rfc3Jpb3ZfZ2V0X3RvdGFsX3Zmcyhm
ZCk7DQo+ICsJYm9vbCBldWRlYnVnX2VuYWJsZSA9IHRydWU7DQo+ICsJYm9vbCBlcnIgPSBmYWxz
ZTsNCj4gKwlpbnQgcmV0ID0gMDsNCj4gKw0KPiArCWlndF9kZWJ1ZygiVGVzdGluZyAldSBWRnNc
biIsIG51bV92ZnMpOw0KPiArDQo+ICsJeGVfZXVkZWJ1Z19lbmFibGUoZmQsIGZhbHNlKTsNCj4g
KwlpZ3Rfc3Jpb3ZfZW5hYmxlX2RyaXZlcl9hdXRvcHJvYmUoZmQpOw0KPiArCWlndF9zcmlvdl9l
bmFibGVfdmZzKGZkLCBudW1fdmZzKTsNCj4gKwlpZ3RfYXNzZXJ0X2VxKG51bV92ZnMsIGlndF9z
cmlvdl9nZXRfZW5hYmxlZF92ZnMoZmQpKTsNCj4gKw0KPiArCWZvciAoaW50IHZmX251bSA9IDE7
IHZmX251bSA8PSBudW1fdmZzOyArK3ZmX251bSkgew0KPiArCQlpZiAoIWlndF9zcmlvdl9pc192
Zl9kcm1fZHJpdmVyX3Byb2JlZChmZCwgdmZfbnVtKSkgew0KPiArCQkJaWd0X2RlYnVnKCJWRiV1
IHByb2JlIGZhaWxlZFxuIiwgdmZfbnVtKTsNCj4gKwkJCWVyciA9IHRydWU7DQo+ICsJCX0gZWxz
ZSBpZiAoaGFzX2VuYWJsZV9ldWRlYnVnX2F0dHIoZmQsIHZmX251bSkpIHsNCj4gKwkJCWlndF9k
ZWJ1ZygiVkYldSBoYXMgZW5hYmxlX2V1ZGVidWcgYXR0cmlidXRlXG4iLA0KPiB2Zl9udW0pOw0K
PiArCQkJZXJyID0gdHJ1ZTsNCj4gKwkJfQ0KPiArCX0NCj4gKw0KPiArCWlndF9hc3NlcnQoIWVy
cik7DQo+ICsNCj4gKwlyZXQgPSBfX3hlX2V1ZGVidWdfZW5hYmxlX2dldHNldChmZCwgTlVMTCwg
JmV1ZGVidWdfZW5hYmxlKTsNCj4gKwlpZ3RfYXNzZXJ0X2VxKHJldCwgLTEpOw0KPiArCWlndF9h
c3NlcnRfZXEoZXJybm8sIEVQRVJNKTsNCj4gK30NCj4gKw0KPiArLyoqDQo+ICsgKiBTVUJURVNU
OiBkZW55LXNyaW92DQo+ICsgKiBEZXNjcmlwdGlvbjoNCj4gKyAqCUNoZWNrIHRoYXQgVkZzIGNh
bm5vdCBiZSBlbmFibGVkIHdoZW4gZXVkZWJ1ZyBpcyBlbmFibGVkLg0KPiArICovDQo+ICtzdGF0
aWMgdm9pZCB0ZXN0X2Rlbnlfc3Jpb3YoaW50IGZkKQ0KPiArew0KPiArCXVuc2lnbmVkIGludCBu
dW1fdmZzID0gaWd0X3NyaW92X2dldF90b3RhbF92ZnMoZmQpOw0KPiArCWJvb2wgcmV0ID0gZmFs
c2U7DQo+ICsJaW50IHN5c2ZzID0gMDsNCj4gKw0KPiArCWlndF9kZWJ1ZygiVGVzdGluZyAldSBW
RnNcbiIsIG51bV92ZnMpOw0KPiArDQo+ICsJaWd0X3NyaW92X2Rpc2FibGVfdmZzKGZkKTsNCj4g
KwlpZ3RfYXNzZXJ0X2VxKDAsIGlndF9zcmlvdl9nZXRfZW5hYmxlZF92ZnMoZmQpKTsNCj4gKwl4
ZV9ldWRlYnVnX2VuYWJsZShmZCwgdHJ1ZSk7DQo+ICsNCj4gKwlzeXNmcyA9IGlndF9zeXNmc19v
cGVuKGZkKTsNCj4gKwlpZ3RfYXNzZXJ0X2ZkKHN5c2ZzKTsNCj4gKw0KPiArCXJldCA9IF9faWd0
X3N5c2ZzX3NldF91MzIoc3lzZnMsICJkZXZpY2Uvc3Jpb3ZfbnVtdmZzIiwgbnVtX3Zmcyk7DQo+
ICsJY2xvc2Uoc3lzZnMpOw0KPiArDQo+ICsJaWd0X2Fzc2VydF9lcShyZXQsIGZhbHNlKTsNCj4g
KwlpZ3RfYXNzZXJ0X2VxKGVycm5vLCBFUEVSTSk7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyB2b2lk
IHJlc3RvcmVfaW5pdGlhbF9kcml2ZXJfc3RhdGUoaW50IGZkLCBib29sIGV1ZGVidWdfZW5hYmxl
ZCwgYm9vbA0KPiB2Zl9hdXRvcHJvYmUpDQo+ICt7DQo+ICsJYm9vbCBhYm9ydCA9IGZhbHNlOw0K
PiArDQo+ICsJaWd0X3NyaW92X2Rpc2FibGVfdmZzKGZkKTsNCj4gKwlpZiAoaWd0X3NyaW92X2dl
dF9lbmFibGVkX3ZmcyhmZCkgPiAwKSB7DQo+ICsJCWlndF9kZWJ1ZygiRmFpbGVkIHRvIGRpc2Fi
bGUgVkYocylcbiIpOw0KPiArCQlhYm9ydCA9IHRydWU7DQo+ICsJfQ0KPiArDQo+ICsJdmZfYXV0
b3Byb2JlID8gaWd0X3NyaW92X2VuYWJsZV9kcml2ZXJfYXV0b3Byb2JlKGZkKSA6DQo+ICsJCSAg
ICAgICBpZ3Rfc3Jpb3ZfZGlzYWJsZV9kcml2ZXJfYXV0b3Byb2JlKGZkKTsNCj4gKwlpZiAodmZf
YXV0b3Byb2JlICE9IGlndF9zcmlvdl9pc19kcml2ZXJfYXV0b3Byb2JlX2VuYWJsZWQoZmQpKSB7
DQo+ICsJCWlndF9kZWJ1ZygiRmFpbGVkIHRvIHJlc3RvcmUgc3Jpb3ZfZHJpdmVyc19hdXRvcHJv
YmUNCj4gdmFsdWVcbiIpOw0KPiArCQlhYm9ydCA9IHRydWU7DQo+ICsJfQ0KPiArDQo+ICsJaWYg
KF9feGVfZXVkZWJ1Z19lbmFibGVfZ2V0c2V0KGZkLCBOVUxMLCAmZXVkZWJ1Z19lbmFibGVkKSA8
IDApIHsNCj4gKwkJaWd0X2RlYnVnKCJGYWlsZWQgdG8gcmVzdG9yZSBldWRlYnVnIHN0YXRlXG4i
KTsNCj4gKwkJYWJvcnQgPSB0cnVlOw0KPiArCX0NCj4gKw0KPiArCS8qIGFib3J0IHRvIGF2b2lk
IGV4ZWN1dGlvbiBvZiBuZXh0IHRlc3RzIHdpdGggaW52YWxpZCBkcml2ZXIgc3RhdGUgKi8NCj4g
KwlpZ3RfYWJvcnRfb25fZihhYm9ydCwgIkZhaWxlZCB0byByZXN0b3JlIGluaXRpYWwgZHJpdmVy
IHN0YXRlXG4iKTsNCj4gK30NCj4gKw0KPiAraWd0X21haW4NCj4gK3sNCj4gKwlib29sIGV1ZGVi
dWdfZW5hYmxlZDsNCj4gKwlib29sIHZmX2F1dG9wcm9iZTsNCj4gKwlpbnQgZmQ7DQo+ICsNCj4g
KwlpZ3RfZml4dHVyZSB7DQo+ICsJCWZkID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9YRSk7DQo+
ICsJCWlndF9yZXF1aXJlKGlndF9zcmlvdl9pc19wZihmZCkpOw0KPiArCQlpZ3RfcmVxdWlyZShp
Z3Rfc3Jpb3ZfdmZzX3N1cHBvcnRlZChmZCkpOw0KPiArCQlpZ3RfcmVxdWlyZShpZ3Rfc3Jpb3Zf
Z2V0X2VuYWJsZWRfdmZzKGZkKSA9PSAwKTsNCj4gKwkJaWd0X3JlcXVpcmUoX194ZV9ldWRlYnVn
X2VuYWJsZV9nZXRzZXQoZmQsDQo+ICZldWRlYnVnX2VuYWJsZWQsIE5VTEwpID09IDApOw0KPiAr
CQl2Zl9hdXRvcHJvYmUgPSBpZ3Rfc3Jpb3ZfaXNfZHJpdmVyX2F1dG9wcm9iZV9lbmFibGVkKGZk
KTsNCj4gKwl9DQo+ICsNCj4gKwlpZ3Rfc3VidGVzdCgiZGVueS1ldWRlYnVnIikNCj4gKwkJdGVz
dF9kZW55X2V1ZGVidWcoZmQpOw0KPiArDQo+ICsJaWd0X3N1YnRlc3QoImRlbnktc3Jpb3YiKQ0K
PiArCQl0ZXN0X2Rlbnlfc3Jpb3YoZmQpOw0KPiArDQo+ICsJaWd0X2ZpeHR1cmUgew0KPiArCQly
ZXN0b3JlX2luaXRpYWxfZHJpdmVyX3N0YXRlKGZkLCBldWRlYnVnX2VuYWJsZWQsDQo+IHZmX2F1
dG9wcm9iZSk7DQo+ICsJCWNsb3NlKGZkKTsNCj4gKwl9DQo+ICt9DQo+IGRpZmYgLS1naXQgYS90
ZXN0cy9tZXNvbi5idWlsZCBiL3Rlc3RzL21lc29uLmJ1aWxkDQo+IGluZGV4IGEwZjk4NGIzNC4u
MzBkMDY3YzI0IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9tZXNvbi5idWlsZA0KPiArKysgYi90ZXN0
cy9tZXNvbi5idWlsZA0KPiBAQCAtMzMyLDYgKzMzMiw3IEBAIGludGVsX3hlX2V1ZGVidWdfcHJv
Z3MgPSBbDQo+ICAJJ3hlX2V1ZGVidWcnLA0KPiAgCSd4ZV9leGVjX3NpcF9ldWRlYnVnJywNCj4g
IAkneGVfZXVkZWJ1Z19vbmxpbmUnLA0KPiArCSd4ZV9ldWRlYnVnX3NyaW92JywNCj4gIF0NCj4g
DQo+ICBpZiBidWlsZF94ZV9ldWRlYnVnDQo+IC0tDQo+IDIuMzQuMQ0KDQo=
